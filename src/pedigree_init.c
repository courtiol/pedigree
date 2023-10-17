#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
 Check these declarations against the C/Fortran source code.
 */

/* .C calls */
extern void CcalcInbreeding(void *, void *, void *, void *, void *);
extern void CcountGen(void *, void *, void *, void *, void *);
extern void CcountOff(void *, void *, void *, void *, void *);
extern void CgetA(void *, void *, void *, void *, void *, void *);
extern void CgetAinv(void *, void *, void *, void *, void *);
extern void CorderPed(void *, void *, void *, void *, void *);
extern void CtrimPed(void *, void *, void *, void *, void *, void *);

static const R_CMethodDef CEntries[] = {
  {"CcalcInbreeding", (DL_FUNC) &CcalcInbreeding, 5},
  {"CcountGen",       (DL_FUNC) &CcountGen,       5},
  {"CcountOff",       (DL_FUNC) &CcountOff,       5},
  {"CgetA",           (DL_FUNC) &CgetA,           6},
  {"CgetAinv",        (DL_FUNC) &CgetAinv,        5},
  {"CorderPed",       (DL_FUNC) &CorderPed,       5},
  {"CtrimPed",        (DL_FUNC) &CtrimPed,        6},
  {NULL, NULL, 0}
};

void R_init_pedigree(DllInfo *dll)
{
  R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
