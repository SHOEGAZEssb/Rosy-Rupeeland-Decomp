#include "tingle/types.h"

/*
 * Overlay 9 embedded-member destruction thunk. This recovered compiler thunk
 * converts a +0x24 subobject pointer back to its containing scene object.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *Overlay009_Scene_Destroy(void *state);
#ifdef __cplusplus
}
#endif

/* Subtract 0x24 from member, tail-call the non-freeing destructor, and return it. */
#ifdef __cplusplus
extern "C"
#endif
void *Overlay009_EmbeddedDestroyThunk(void *member)
{
    return Overlay009_Scene_Destroy((u8 *)member - 0x24);
}
