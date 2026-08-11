#include "tingle/types.h"

/* UTF-16 buffer cleanup for overlay 25's name-entry widget. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Clear every UTF-16 slot from current length through slot 15, then strip
 * trailing U+0020 spaces inside the entered prefix until the first non-space.
 * Character storage changes; the length field and external state do not.
 */
extern "C" void func_ov025_021fd3f4(void *widget)
{
    for (s32 i = FIELD(s32, widget, 0x17c); i < 16; ++i) {
        u8 *entry = (u8 *)widget + i * 2;
        entry += 0x100;
        FIELD(u16, entry, 0x80) = 0;
    }
    for (s32 i = FIELD(s32, widget, 0x17c) - 1; i >= 0; --i) {
        u8 *entry = (u8 *)widget + i * 2;
        entry += 0x100;
        if (FIELD(u16, entry, 0x80) != 0x20) return;
        FIELD(u16, entry, 0x80) = 0;
    }
}
