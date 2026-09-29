/* Step 2 — FirePyStartEvent: short-circuits on active==0, dispatches otherwise. */
#include <Python.h>

static PyObject *fire(PyObject *self, PyObject *codelike) {
    PyMonitoringState s[1] = {};
    uint64_t v = 0;
    uint8_t e[] = { PY_MONITORING_EVENT_PY_START };

    PyMonitoring_EnterScope(s, &v, e, 1);
    int rc = PyMonitoring_FirePyStartEvent(&s[0], codelike, 0);
    fprintf(stderr, "  active=%u  rc=%d  err=%p\n",
            s[0].active, rc, (void*)PyErr_Occurred());
    PyMonitoring_ExitScope();

    if (rc < 0) return NULL;
    Py_RETURN_NONE;
}

static PyMethodDef m[] = {{"fire", fire, METH_O, ""}, {0}};
static struct PyModuleDef d = {PyModuleDef_HEAD_INIT, "step2_fire_pystart", 0, -1, m};
PyMODINIT_FUNC PyInit_step2_fire_pystart(void) { return PyModule_Create(&d); }
