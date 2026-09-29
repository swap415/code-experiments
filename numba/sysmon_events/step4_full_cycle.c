/* ============================================================================
 * STEP 4 — A full Start → body → Return cycle.
 *
 * GOAL:  Now that you've seen each event in isolation, glue them together.
 *        This is the dispatcher's HAPPY PATH stripped to its skeleton:
 *        EnterScope, FirePyStart, run a "body" (we'll just compute a value),
 *        FirePyReturn, ExitScope. No errors, no exceptions.
 *
 * WATCH FOR:
 *   1. Both events fire correctly with the same codelike.
 *   2. We refresh between Start and Return — same as the dispatcher does.
 *      EnterScope is the documented "refresh primitive". On the second call
 *      it's the fast-path version=unchanged → no-op.
 *   3. pyresult lifecycle: nothing is allocated yet at Start; we own a strong
 *      ref between body and Return; we release it via the return value to
 *      our caller.
 *
 * SOURCE REFERENCE:
 *   Compare this file's body with numba/_dispatcher.cpp:1163-1240 — the same
 *   skeleton, just without the JIT-specific machinery.
 * ============================================================================ */
#define PY_SSIZE_T_CLEAN
#include <Python.h>

enum { S_PY_START, S_PY_RETURN, S_COUNT };
static const uint8_t event_types[S_COUNT] = {
    PY_MONITORING_EVENT_PY_START,
    PY_MONITORING_EVENT_PY_RETURN,
};

#define LOG(fmt, ...) do { fprintf(stderr, "  C> " fmt "\n", ##__VA_ARGS__); fflush(stderr); } while(0)

static PyObject *cycle(PyObject *self, PyObject *codelike)
{
    PyObject *pyresult = NULL;
    int in_scope = 0;
    PyMonitoringState mon[S_COUNT] = {};
    uint64_t version = 0;

    LOG("--- entry: pyresult=%p in_scope=%d ---", (void*)pyresult, in_scope);

    /* Phase 1: enter scope. */
    if (PyMonitoring_EnterScope(mon, &version, event_types, S_COUNT) < 0) {
        return NULL;  /* unreachable in 3.14 */
    }
    in_scope = 1;
    LOG("EnterScope ok: version=%llu  active[start]=%u active[return]=%u",
        (unsigned long long)version, mon[S_PY_START].active, mon[S_PY_RETURN].active);

    /* Phase 2: fire PY_START. */
    if (PyMonitoring_FirePyStartEvent(&mon[S_PY_START], codelike, 0) < 0) {
        LOG("FirePyStart -1, jump to cleanup");
        goto cleanup;
    }
    LOG("FirePyStart ok");

    /* Phase 3: simulate a body that returns a Python int. */
    LOG("calling body...");
    pyresult = PyLong_FromLong(7);
    if (pyresult == NULL) goto cleanup;
    LOG("body returned: pyresult=%p (PyLong 7)", (void*)pyresult);

    /* Phase 4: refresh scope. The dispatcher does this because the body might
     * have toggled monitoring. In this simple example version is unchanged so
     * EnterScope's fast path takes — no rewrites. */
    if (PyMonitoring_EnterScope(mon, &version, event_types, S_COUNT) < 0) {
        Py_CLEAR(pyresult);     /* see step 7 for why this matters */
        goto cleanup;
    }
    LOG("refresh ok: version=%llu", (unsigned long long)version);

    /* Phase 5: fire PY_RETURN with our pyresult. */
    if (PyMonitoring_FirePyReturnEvent(&mon[S_PY_RETURN], codelike, 0, pyresult) < 0) {
        LOG("FirePyReturn -1, must Py_CLEAR(pyresult)");
        Py_CLEAR(pyresult);
        goto cleanup;
    }
    LOG("FirePyReturn ok");

cleanup:
    LOG("--- cleanup: pyresult=%p in_scope=%d ---", (void*)pyresult, in_scope);
    if (in_scope) PyMonitoring_ExitScope();
    return pyresult;   /* NULL → caller sees error; non-NULL → caller takes ref */
}

static PyMethodDef methods[] = {
    {"cycle", cycle, METH_O, "cycle(codelike) — full Start->body->Return."},
    {NULL, NULL, 0, NULL},
};

static struct PyModuleDef moddef = {
    PyModuleDef_HEAD_INIT, "step4_full_cycle", NULL, -1, methods,
};

PyMODINIT_FUNC PyInit_step4_full_cycle(void) { return PyModule_Create(&moddef); }
