#include "tingle/types.h"

/* Active-sprite selection for overlay 25's name-entry keys and glyph grid. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);

/*
 * Select special-key sprite index from the four pointers at +0x30, store it
 * as active +0x174, switch it to animation 3, and clear active phase +0x28.
 * The active pointer is reloaded after the animation call as retail does;
 * sprite/widget state changes and the function returns no value.
 */
extern "C" void func_ov025_021fd2e8(void *widget, s32 index)
{
    u8 *entry = (u8 *)widget + index * 4;
    FIELD(void *, widget, 0x174) = FIELD(void *, entry, 0x30);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x174), 3);
    FIELD(u16, FIELD(void *, widget, 0x174), 0x28) = 0;
}

/*
 * Select grid sprite index from the 7x11 pointers at +0x40, store it as active
 * +0x174, switch it to animation 2, and clear active phase +0x28. The active
 * pointer is reloaded after the animation call; sprite/widget state changes
 * and the function returns no value.
 */
extern "C" void func_ov025_021fd314(void *widget, s32 index)
{
    u8 *entry = (u8 *)widget + index * 4;
    FIELD(void *, widget, 0x174) = FIELD(void *, entry, 0x40);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x174), 2);
    FIELD(u16, FIELD(void *, widget, 0x174), 0x28) = 0;
}
