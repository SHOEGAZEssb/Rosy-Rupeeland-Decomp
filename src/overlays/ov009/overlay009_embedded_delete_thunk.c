#include "tingle/types.h"

/*
 * Overlay 9 embedded-member deleting thunk. This recovered compiler thunk
 * converts a +0x24 subobject pointer back to its containing scene allocation.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov009_021fd208(void *state);
#ifdef __cplusplus
}
#endif

/* Subtract 0x24 from member, tail-call the deleting destructor, and return it. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov009_021feab0(void *member)
{
    return func_ov009_021fd208((u8 *)member - 0x24);
}
