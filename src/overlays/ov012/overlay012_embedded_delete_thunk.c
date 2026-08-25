#include "tingle/types.h"

/* Overlay 12 +0x24 subobject deleting-destructor adjustment thunk. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov012_021fd4fc(void *);
#ifdef __cplusplus
}
#endif

/* Recover the containing state by subtracting 0x24, tail-call its deleting destructor, and return the destructor's ABI value. */
#ifdef __cplusplus
extern "C"
#endif
void *Overlay012_EmbeddedDeleteThunk(void *member)
{
    return func_ov012_021fd4fc((u8 *)member - 0x24);
}
