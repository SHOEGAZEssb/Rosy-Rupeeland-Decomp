#include "tingle/types.h"
/* Overlay 10 +0x24 subobject deleting thunk. */
#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov010_021fd2b4(void *);
#ifdef __cplusplus
}
#endif
/* Convert member to containing state by subtracting 0x24, tail-call deleting teardown, and return its invalid ABI pointer. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov010_021fe9a8(void *m){return func_ov010_021fd2b4((u8 *)m-0x24);}
