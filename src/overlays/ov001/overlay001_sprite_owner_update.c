#include "tingle/types.h"

/*
 * Overlay 1 sprite-owner update forwarding. This recovered helper advances the
 * graphics owner stored at presentation-state offset 4.
 */

typedef struct Overlay001SpriteOwnerState {
    void *owner_00;
    void *spriteOwner_04;
} Overlay001SpriteOwnerState;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_AdvanceAnimations(void *owner);
#ifdef __cplusplus
}
#endif

/*
 * Pass spriteOwner_04 to GraphicsSpriteGroup_AdvanceAnimations and return no value. The callee owns any
 * graphics/SDK state effects; this wrapper changes no other state and performs
 * no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fbaa8(Overlay001SpriteOwnerState *state)
{
    GraphicsSpriteGroup_AdvanceAnimations(state->spriteOwner_04);
}
