/* Step 1 — EnterScope writes `active` only when version differs. */
#include <Python.h>

static PyObject *demo(PyObject *self, PyObject *args) {
    PyMonitoringState s[1] = {};
    uint64_t v = 0;
    uint8_t e[] = { PY_MONITORING_EVENT_PY_START };

    PyMonitoring_EnterScope(s, &v, e, 1);
    fprintf(stderr, "  version=%llu  active=%u\n",
            (unsigned long long)v, s[0].active);
    PyMonitoring_ExitScope();
    Py_RETURN_NONE;
}

static PyMethodDef m[] = {{"demo", demo, METH_NOARGS, ""}, {0}};
static struct PyModuleDef d = {PyModuleDef_HEAD_INIT, "step1_enter_exit", 0, -1, m};
PyMODINIT_FUNC PyInit_step1_enter_exit(void) { return PyModule_Create(&d); }
