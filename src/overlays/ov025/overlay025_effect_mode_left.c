#include "tingle/types.h"

/* Overlay 25 left-facing paired-effect sprite configuration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void func_ov025_021fe174(void *, s32, s32, s32);

/*
 * Select resource 1/animation 12 with setup flag 0x42, expose and select both
 * secondary sprites on animation 6, and set signed X separation +0xA8 to -4.
 * Sprite resource, flag, animation, and positioning state change; returns void.
 */
extern "C" void func_ov025_021fe2c4(void *object)
{
    func_ov025_021fe174(object, 1, 12, 0x42);
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) |= 2;
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) &= ~4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0xec), 6);
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) |= 2;
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) &= ~4;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0xf4), 6);
    FIELD(s32, object, 0xa8) = -4;
}
