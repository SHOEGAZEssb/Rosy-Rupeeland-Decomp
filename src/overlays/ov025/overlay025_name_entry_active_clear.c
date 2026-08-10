#include "tingle/types.h"

/* Overlay 25 active name-entry glyph teardown helper. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Restores the active sprite phase to 0x100 and clears pointer +0x174. The
 * pointed-to sprite and widget change; returns no value.
 */
extern "C" void func_ov025_021fd3dc(void *widget)
{
    FIELD(u16, FIELD(void *, widget, 0x174), 0x28) = 0x100;
    FIELD(void *, widget, 0x174) = 0;
}
