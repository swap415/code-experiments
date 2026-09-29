/* ============================================================================
 * STEP 5 — When Fire*Event returns -1 the FIRST TIME you see it.
 *
 * GOAL:  See exactly what's true on tstate when a Fire*Event returns -1.
 *        This is the moment where the dispatcher's audit method becomes
 *        critical: you have to know what's *live* before you can clean up.
 *
 * WATCH FOR:
 *   1. Before the call: PyErr_Occurred() == NULL.
 *   2. After Fire returns -1: PyErr_Occurred() != NULL — and it's the
 *      callback's exception, sitting on tstate ready to propagate.
 *   3. The callback's exception is what gets returned from our function. The
 *      dispatcher's pattern: Fire returns -1 → goto cleanup → return NULL with
 *      that PyErr in flight.
 *
 * SOURCE REFERENCE:
 *   Python/instrumentation.c:972-995    (call_one_instrument: when the user
 *                                        callback raises, PyObject_VectorcallTstate
 *                                        returns NULL → call_one returns -1)
 *   Python/instrumentation.c:2622-2627   (capi_call_instrumentation: the
 *                                         "if (res < 0) { err = -1; break; }"
 *                                         line — exactly where our error
 *                                         propagates out)
 * ============================================================================ */
#define PY_SSIZE_T_CLEAN
#include <Python.h>

enum { S_PY_START, S_COUNT };
static const uint8_t event_types[S_COUNT] = { PY_MONITORING_EVENT_PY_START };

#define LOG(fmt, ...) do { fprintf(stderr, "  C> " fmt "\n", ##__VA_ARGS__); fflush(stderr); } while(0)

static PyObject *fire(PyObject *self, PyObject *codelike)
{
    PyMonitoringState mon[S_COUNT] = {};
    uint64_t version = 0;
    PyMonitoring_EnterScope(mon, &version, event_types, S_COUNT);

    LOG("BEFORE fire:  PyErr_Occurred()=%p", (void*)PyErr_Occurred());
    LOG("              active[PY_START]=%u", mon[S_PY_START].active);

    int rc = PyMonitoring_FirePyStartEvent(&mon[S_PY_START], codelike, 0);

    LOG("AFTER fire:   rc=%d", rc);
    LOG("              PyErr_Occurred()=%p", (void*)PyErr_Occurred());

    /* If the callback raised, the exception is now on tstate. We can inspect
     * it without affecting propagation by using PyErr_Occurred (returns a
     * BORROWED ref — do NOT DECREF). */
    PyObject *exc = PyErr_Occurred();
    if (exc != NULL) {
        LOG("              exception type: %s", Py_TYPE(exc)->tp_name);
    }

    PyMonitoring_ExitScope();

    /* This is the dispatcher's pattern: rc<0 → return NULL → caller sees
     * error AND PyErr is set. Contract: non-NULL with PyErr is UB; we obey. */
    if (rc < 0) {
        return NULL;  /* PyErr already set by capi_call_instrumentation */
    }
    Py_RETURN_NONE;
}

static PyMethodDef methods[] = {
    {"fire", fire, METH_O, "fire(codelike) — fires PY_START."},
    {NULL, NULL, 0, NULL},
};

static struct PyModuleDef moddef = {
    PyModuleDef_HEAD_INIT, "step5_callback_raises", NULL, -1, methods,
};

PyMODINIT_FUNC PyInit_step5_callback_raises(void) { return PyModule_Create(&moddef); }
