#include "tingle/types.h"

/* Entered-glyph truncation for overlay 25's name-entry widget. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);

/*
 * Truncate entered length to index: switch sprites from that slot through the
 * previous end to animation 5, select the indexed sprite with phase zero, and
 * store the new length. Character storage is unchanged; sprite/widget state
 * changes and the function returns no value.
 */
extern "C" void func_ov025_021fd388(void *widget, s32 index)
{
    for (s32 i = index; i < FIELD(s32, widget, 0x17c); ++i) {
        u8 *entry = (u8 *)widget + i * 4;
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, entry, 0x10), 5);
    }
    u8 *selected = (u8 *)widget + index * 4;
    void *sprite = FIELD(void *, selected, 0x10);
    FIELD(void *, widget, 0x174) = sprite;
    FIELD(u16, sprite, 0x28) = 0;
    FIELD(s32, widget, 0x17c) = index;
}
