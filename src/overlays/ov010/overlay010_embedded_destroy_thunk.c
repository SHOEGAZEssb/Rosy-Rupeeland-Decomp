#include "tingle/types.h"
/* Overlay 10 +0x24 subobject non-freeing destruction thunk. */
#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov010_021fd1e8(void *);
#ifdef __cplusplus
}
#endif
/* Convert member to containing state by subtracting 0x24, tail-call non-freeing teardown, and return state. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov010_021fe9b8(void *m){return func_ov010_021fd1e8((u8 *)m-0x24);}
