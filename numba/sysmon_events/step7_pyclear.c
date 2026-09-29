/* ============================================================================
 * STEP 7 — The Py_CLEAR(pyresult) review fix.  ★ The whole point.
 *
 * GOAL:  Reproduce the exact situation that motivated commit 08ea237b6
 *        ("apply review suggestion: clear pyresult on scope-refresh") on the
 *        sysmon branch. Show that without Py_CLEAR you both LEAK and return
 *        non-NULL with PyErr set.
 *
 * THE SITUATION:
 *   - The "JIT body" runs to completion and returns a value.
 *   - We hold a strong reference to that value in `pyresult`.
 *   - We fire PY_RETURN. The user's PY_RETURN callback raises an exception.
 *   - FirePyReturnEvent returns -1, with a fresh exception on tstate.
 *
 * AT THIS EXACT POINT: pyresult is non-NULL AND PyErr is set. To clean up
 * we must DECREF pyresult AND make the slot NULL so `return pyresult;` at
 * the cleanup label signals failure to the caller.
 *
 * THIS FILE EXPORTS TWO FUNCTIONS:
 *   - cycle_correct(...)  — uses Py_CLEAR(pyresult). The patch's behaviour.
 *   - cycle_buggy(...)    — does NOT use Py_CLEAR. Demonstrates the bug.
 *
 * Run them via step7_run.py and observe the difference.
 *
 * SOURCE REFERENCE:
 *   numba/_dispatcher.cpp:1219-1232    (the new return-path block — see the
 *                                        Py_CLEAR(pyresult) calls)
 *   commit 08ea237b6                    ("apply review suggestion...")
 *   Include/object.h                    (Py_CLEAR macro: NULL slot first,
 *                                        then Py_XDECREF the saved pointer)
 * ============================================================================ */
#define PY_SSIZE_T_CLEAN
#include <Python.h>

enum { S_PY_START, S_PY_RETURN, S_COUNT };
static const uint8_t event_types[S_COUNT] = {
    PY_MONITORING_EVENT_PY_START,
    PY_MONITORING_EVENT_PY_RETURN,
};

#define LOG(fmt, ...) do { fprintf(stderr, "  C> " fmt "\n", ##__VA_ARGS__); fflush(stderr); } while(0)


/* ── The CORRECT version, matching the patch ──────────────────────── */
static PyObject *cycle_correct(PyObject *self, PyObject *codelike)
{
    PyObject *pyresult = NULL;
    int in_scope = 0;
    PyMonitoringState mon[S_COUNT] = {};
    uint64_t version = 0;

    PyMonitoring_EnterScope(mon, &version, event_types, S_COUNT);
    in_scope = 1;

    /* Body: returns a list to make the strong-ref easy to track. */
    pyresult = PyList_New(0);
    if (pyresult == NULL) goto cleanup;
    PyList_Append(pyresult, PyLong_FromLong(7));
    LOG("[CORRECT] body returned: pyresult=%p refcnt=%zd",
        (void*)pyresult, Py_REFCNT(pyresult));

    PyMonitoring_EnterScope(mon, &version, event_types, S_COUNT);  /* refresh */

    int rc = PyMonitoring_FirePyReturnEvent(&mon[S_PY_RETURN], codelike, 0, pyresult);
    LOG("[CORRECT] FirePyReturn rc=%d", rc);
    LOG("[CORRECT] PyErr_Occurred() = %p", (void*)PyErr_Occurred());

    if (rc < 0) {
        LOG("[CORRECT] before Py_CLEAR: pyresult=%p", (void*)pyresult);
        Py_CLEAR(pyresult);   /* ← the patch's fix */
        LOG("[CORRECT] after  Py_CLEAR: pyresult=%p (NULL signals error)",
            (void*)pyresult);
        goto cleanup;
    }

cleanup:
    if (in_scope) PyMonitoring_ExitScope();
    LOG("[CORRECT] returning: pyresult=%p  PyErr=%p",
        (void*)pyresult, (void*)PyErr_Occurred());
    return pyresult;
}


/* ── The BUGGY version, missing Py_CLEAR ──────────────────────────── */
static PyObject *cycle_buggy(PyObject *self, PyObject *codelike)
{
    PyObject *pyresult = NULL;
    int in_scope = 0;
    PyMonitoringState mon[S_COUNT] = {};
    uint64_t version = 0;

    PyMonitoring_EnterScope(mon, &version, event_types, S_COUNT);
    in_scope = 1;

    pyresult = PyList_New(0);
    if (pyresult == NULL) goto cleanup;
    PyList_Append(pyresult, PyLong_FromLong(7));
    LOG("[BUGGY]   body returned: pyresult=%p refcnt=%zd",
        (void*)pyresult, Py_REFCNT(pyresult));

    PyMonitoring_EnterScope(mon, &version, event_types, S_COUNT);

    int rc = PyMonitoring_FirePyReturnEvent(&mon[S_PY_RETURN], codelike, 0, pyresult);
    LOG("[BUGGY]   FirePyReturn rc=%d", rc);
    LOG("[BUGGY]   PyErr_Occurred() = %p", (void*)PyErr_Occurred());

    if (rc < 0) {
        LOG("[BUGGY]   ** SKIPPING Py_CLEAR — this is the bug! **");
        goto cleanup;
    }

cleanup:
    if (in_scope) PyMonitoring_ExitScope();
    LOG("[BUGGY]   returning: pyresult=%p  PyErr=%p",
        (void*)pyresult, (void*)PyErr_Occurred());
    LOG("[BUGGY]   ** non-NULL return WITH PyErr set — UB by C-API contract **");
    LOG("[BUGGY]   ** the list at %p will leak (caller treats us as success) **",
        (void*)pyresult);
    return pyresult;
}


static PyMethodDef methods[] = {
    {"cycle_correct", cycle_correct, METH_O, "Patched version: uses Py_CLEAR."},
    {"cycle_buggy",   cycle_buggy,   METH_O, "Buggy version: missing Py_CLEAR."},
    {NULL, NULL, 0, NULL},
};

static struct PyModuleDef moddef = {
    PyModuleDef_HEAD_INIT, "step7_pyclear", NULL, -1, methods,
};

PyMODINIT_FUNC PyInit_step7_pyclear(void) { return PyModule_Create(&moddef); }
