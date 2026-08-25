#include "tingle/types.h"

/* Overlay 12 +0x24 subobject non-freeing destructor adjustment thunk. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov012_021fd468(void *);
#ifdef __cplusplus
}
#endif

/* Recover the containing state by subtracting 0x24, tail-call its non-freeing destructor, and return the destructor's ABI value. */
#ifdef __cplusplus
extern "C"
#endif
void *Overlay012_EmbeddedDestroyThunk(void *member)
{
    return func_ov012_021fd468((u8 *)member - 0x24);
}
