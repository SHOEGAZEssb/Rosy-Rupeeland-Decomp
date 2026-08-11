#include "tingle/types.h"

/* Count meaningful UTF-16 characters in overlay 25's name-entry buffer. */

/*
 * Scan the entered prefix at widget +0x180 and return the number of code units
 * other than U+0020. The per-character address is deliberately formed before
 * the +0x100 page adjustment to preserve the retail instruction sequence.
 */
extern "C" s32 func_ov025_021fd450(void *widget)
{
    s32 count = 0;
    for (s32 i = 0; i < *(s32 *)((u8 *)widget + 0x17c); ++i) {
        u8 *character = (u8 *)widget + i * 2;
        character += 0x100;
        if (*(u16 *)(character + 0x80) != 0x20)
            ++count;
    }
    return count;
}
