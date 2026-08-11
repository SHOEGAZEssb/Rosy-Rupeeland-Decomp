#include "tingle/types.h"

/* Overlay 25 paired-effect secondary-sprite deselection mode. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void func_ov025_021fe174(void *, s32, s32, s32);

/*
 * Select resource 1/animation 22 with setup flag 2, clear the selection bit
 * on both secondary sprites, choose their animation 13, and clear separation
 * +0xA8. Sprite resource, flag, animation, and positioning state change.
 */
extern "C" void func_ov025_021fe39c(void *object)
{
    func_ov025_021fe174(object, 1, 22, 2);
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) &= ~2;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0xec), 13);
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) &= ~2;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0xf4), 13);
    FIELD(s32, object, 0xa8) = 0;
}
