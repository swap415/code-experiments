/* Step 3 — FirePyReturnEvent: same as FirePyStart but with a retval arg. */
#include <Python.h>

static PyObject *fire(PyObject *self, PyObject *args) {
    PyObject *codelike, *retval;
    if (!PyArg_ParseTuple(args, "OO", &codelike, &retval)) return NULL;

    PyMonitoringState s[1] = {};
    uint64_t v = 0;
    uint8_t e[] = { PY_MONITORING_EVENT_PY_RETURN };

    PyMonitoring_EnterScope(s, &v, e, 1);
    Py_ssize_t before = Py_REFCNT(retval);
    int rc = PyMonitoring_FirePyReturnEvent(&s[0], codelike, 0, retval);
    fprintf(stderr, "  rc=%d  refcnt %zd -> %zd\n", rc, before, Py_REFCNT(retval));
    PyMonitoring_ExitScope();

    if (rc < 0) return NULL;
    Py_RETURN_NONE;
}

static PyMethodDef m[] = {{"fire", fire, METH_VARARGS, ""}, {0}};
static struct PyModuleDef d = {PyModuleDef_HEAD_INIT, "step3_fire_pyreturn", 0, -1, m};
PyMODINIT_FUNC PyInit_step3_fire_pyreturn(void) { return PyModule_Create(&d); }
