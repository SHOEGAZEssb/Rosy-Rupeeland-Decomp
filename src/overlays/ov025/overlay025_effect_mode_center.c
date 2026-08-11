#include "tingle/types.h"

/* Overlay 25 centered paired-effect sprite configuration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void func_ov025_021fe174(void *, s32, s32, s32);

/*
 * Select resource 1/animation 14 with setup flag 2, expose both secondary
 * sprites on animation zero, and clear signed X separation +0xA8. Sprite
 * resource, flag, animation, and positioning state change; returns void.
 */
extern "C" void func_ov025_021fe340(void *object)
{
    func_ov025_021fe174(object, 1, 14, 2);
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) &= ~4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0xec), 0);
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) &= ~4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0xf4), 0);
    FIELD(s32, object, 0xa8) = 0;
}
