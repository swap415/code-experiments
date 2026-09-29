/* ============================================================================
 * STEP 6 — PyMonitoring_FireRaiseEvent and the hidden exception dance.
 *
 * GOAL:  Understand what FireRaiseEvent / FirePyUnwindEvent do that's
 *        different from the success-path firers. The docs don't tell you
 *        about exception_event_setup/teardown; the source does.
 *
 * BACKGROUND:  When you call FireRaiseEvent, it:
 *   (a) MOVES the current exception off tstate via PyErr_GetRaisedException,
 *   (b) passes it as args[3] to the callback,
 *   (c) on success: PUTS IT BACK via PyErr_SetRaisedException,
 *   (d) on failure: DECREFs the saved exception (callback set a new one).
 *
 * So the API hides the save/restore for you. If your callback returns
 * cleanly, the original exception is preserved on tstate. If your callback
 * raises, the original is FREED and the callback's new exception replaces it.
 *
 * WATCH FOR:
 *   1. Precondition: PyErr_Occurred() MUST be non-NULL when calling
 *      FireRaiseEvent. We set ValueError ourselves to simulate "the JIT
 *      raised". If PyErr were NULL the API itself returns -1 with a fresh
 *      ValueError "Firing event N with no exception set".
 *   2. After a SUCCESSFUL FireRaiseEvent, PyErr_Occurred() is the SAME
 *      pointer it was before. Identity preserved.
 *   3. After a FAILED FireRaiseEvent (callback raised), PyErr_Occurred()
 *      is the callback's exception, NOT the original.
 *
 * SOURCE REFERENCE:
 *   Python/instrumentation.c:2790-2800   (exception_event_setup)
 *   Python/instrumentation.c:2802-2814   (exception_event_teardown — this
 *                                         is the if(err==0) PyErr_SetRaised...
 *                                         branch you must read)
 *   Python/instrumentation.c:2828-2839   (_PyMonitoring_FireRaiseEvent)
 * ============================================================================ */
#define PY_SSIZE_T_CLEAN
#include <Python.h>

enum { S_RAISE, S_COUNT };
static const uint8_t event_types[S_COUNT] = { PY_MONITORING_EVENT_RAISE };

#define LOG(fmt, ...) do { fprintf(stderr, "  C> " fmt "\n", ##__VA_ARGS__); fflush(stderr); } while(0)

static PyObject *demo(PyObject *self, PyObject *codelike)
{
    PyMonitoringState mon[S_COUNT] = {};
    uint64_t version = 0;
    PyMonitoring_EnterScope(mon, &version, event_types, S_COUNT);

    /* Simulate "the JIT body raised an exception". */
    LOG("setting ValueError to simulate JIT raise...");
    PyErr_SetString(PyExc_ValueError, "from simulated JIT");

    /* Snapshot the exception's identity (borrowed, do not DECREF). */
    PyObject *err_before = PyErr_Occurred();
    LOG("BEFORE FireRaise:  PyErr=%p  type=%s",
        (void*)err_before, err_before ? Py_TYPE(err_before)->tp_name : "NULL");
    LOG("                   active[RAISE]=%u", mon[S_RAISE].active);

    int rc = PyMonitoring_FireRaiseEvent(&mon[S_RAISE], codelike, 0);

    PyObject *err_after = PyErr_Occurred();
    LOG("AFTER FireRaise:   rc=%d  PyErr=%p  type=%s",
        rc, (void*)err_after, err_after ? Py_TYPE(err_after)->tp_name : "NULL");

    if (rc == 0) {
        if (err_before == err_after) {
            LOG("                   IDENTITY PRESERVED — exception_event_teardown");
            LOG("                   put it back via PyErr_SetRaisedException()");
        } else {
            LOG("                   *** unexpected: identity changed despite rc=0");
        }
    } else {
        LOG("                   IDENTITY DIFFERS — original was DECREF'd by");
        LOG("                   exception_event_teardown's `Py_XDECREF(exc)`");
        LOG("                   branch (err != 0 path).");
    }

    PyMonitoring_ExitScope();

    /* Whatever happened, propagate. PyErr is set; return NULL to signal err. */
    return NULL;
}

static PyMethodDef methods[] = {
    {"demo", demo, METH_O, "demo(codelike) — sets ValueError, fires RAISE."},
    {NULL, NULL, 0, NULL},
};

static struct PyModuleDef moddef = {
    PyModuleDef_HEAD_INIT, "step6_exception_path", NULL, -1, methods,
};

PyMODINIT_FUNC PyInit_step6_exception_path(void) { return PyModule_Create(&moddef); }
