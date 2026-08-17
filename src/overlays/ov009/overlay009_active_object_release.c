#include "tingle/types.h"

/*
 * Overlay 9 active-object release. This recovered helper detaches the retained
 * object and resets the embedded resource description used to create it.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_ReleaseState(void *owner, void *object);
extern void AnimationResourceState_ReleaseResources(void *member);
#ifdef __cplusplus
}
#endif

/*
 * Pass +0x84 and +0x88 to GraphicsSpriteGroup_ReleaseState, clear +0x88, then reset embedded
 * member +0x78 through AnimationResourceState_ReleaseResources. Return no value. Resource effects are
 * delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov009_021fd338(void *state)
{
    GraphicsSpriteGroup_ReleaseState(FIELD(void *, state, 0x84), FIELD(void *, state, 0x88));
    FIELD(void *, state, 0x88) = 0;
    AnimationResourceState_ReleaseResources((u8 *)state + 0x78);
}
