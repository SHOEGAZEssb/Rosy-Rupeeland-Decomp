#include "tingle/types.h"

/*
 * Overlay 9 embedded-member deleting thunk. This recovered compiler thunk
 * converts a +0x24 subobject pointer back to its containing scene allocation.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *Overlay009_Scene_Delete(void *state);
#ifdef __cplusplus
}
#endif

/* Subtract 0x24 from member, tail-call the deleting destructor, and return it. */
#ifdef __cplusplus
extern "C"
#endif
void *Overlay009_EmbeddedDeleteThunk(void *member)
{
    return Overlay009_Scene_Delete((u8 *)member - 0x24);
}
