#include "tingle/types.h"

/*
 * Overlay 9 embedded-member destruction thunk. This recovered compiler thunk
 * converts a +0x24 subobject pointer back to its containing scene object.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov009_021fd198(void *state);
#ifdef __cplusplus
}
#endif

/* Subtract 0x24 from member, tail-call the non-freeing destructor, and return it. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov009_021feac0(void *member)
{
    return func_ov009_021fd198((u8 *)member - 0x24);
}
