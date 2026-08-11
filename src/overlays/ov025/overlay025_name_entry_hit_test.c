#include "tingle/types.h"

/* Hit testing for the entered-glyph row in overlay 25's name-entry widget. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s32 func_02092910(void *, void *);

/*
 * Test each entered-glyph sprite against input and return the first matching
 * index, or -1 when none match. The per-entry base preserves retail's indexed
 * pointer load; the hit-test callee may inspect current touch/input state.
 */
extern "C" s32 func_ov025_021fd340(void *widget, void *input)
{
    for (s32 i = 0; i < FIELD(s32, widget, 0x17c); ++i) {
        u8 *entry = (u8 *)widget + i * 4;
        if (func_02092910(FIELD(void *, entry, 0x10), input))
            return i;
    }
    return -1;
}
