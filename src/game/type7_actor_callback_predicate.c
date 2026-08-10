#include "tingle/types.h"

/* Recovered recognition predicate for three type-seven callback representations. */
extern u8 data_020e16b0[];
extern u8 data_020e18c8[];
extern u8 data_020e1810[];
extern u8 data_020e1778[];

/*
 * Return one when actor callback words +0x208/+0x20c match any of three pairs:
 * data_020e16b0+0x218/data_020e18c8+4, data_020e16b0+0x160/data_020e1810+4,
 * or data_020e16b0+0xc8/data_020e1778+4. Each comparison preserves the retail
 * zero-first-word acceptance after first-word equality. Return zero otherwise;
 * no state, SDK, or hardware effects occur.
 */
s32 Type7Actor_HasSpecialCallbackPair(const void *self)
{
    const u8 *actor = (const u8 *)self;
    void *first = *(void *const *)(actor + 0x208);
    void *second = *(void *const *)(actor + 0x20c);
    if (first == *(void **)(data_020e16b0 + 0x218)
        && (second == *(void **)(data_020e18c8 + 4) || first == 0))
        return 1;
    if (first == *(void **)(data_020e16b0 + 0x160)
        && (second == *(void **)(data_020e1810 + 4) || first == 0))
        return 1;
    if (first == *(void **)(data_020e16b0 + 0xc8)
        && (second == *(void **)(data_020e1778 + 4) || first == 0))
        return 1;
    return 0;
}
