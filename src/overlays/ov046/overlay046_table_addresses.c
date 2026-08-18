#include "tingle/types.h"

/*
 * Overlay 46 table-address helpers. These recovered leaf routines combine
 * selector records with category coordinate bases. The returned values seed
 * the marker sprite position used by the overlay scene constructor.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_ov046_0220cd14[];
extern "C" u8 data_ov046_0220cd18[];
extern "C" u8 data_ov046_0220cd1c[];
extern "C" u8 data_ov046_0220ce08[];
extern "C" u8 data_ov046_0220ce0c[];

/*
 * Return data_ov046_0220ce08[category*0x28] plus variant*0x40, where category
 * and variant are read at offsets 0 and 4 of the selector's 0x14-byte record.
 * No state changes and no SDK/hardware effects occur.
 */
extern "C" s32 func_ov046_0220b740(s32 selector)
{
    s32 offset = selector * 0x14;
    s32 category = FIELD(s32, data_ov046_0220cd14, offset);
    s32 variant = FIELD(s32, data_ov046_0220cd18, offset);
    s32 base = FIELD(s32, data_ov046_0220ce08, category * 0x28);
    return base + variant * 0x40;
}

/*
 * Return data_ov046_0220ce0c[category*0x28] plus variant*0x30, where category
 * and variant are read at offsets 0 and 8 of the selector's 0x14-byte record.
 * No state changes and no SDK/hardware effects occur.
 */
extern "C" s32 func_ov046_0220b77c(s32 selector)
{
    s32 offset = selector * 0x14;
    s32 category = FIELD(s32, data_ov046_0220cd14, offset);
    s32 variant = FIELD(s32, data_ov046_0220cd1c, offset);
    s32 base = FIELD(s32, data_ov046_0220ce0c, category * 0x28);
    return base + variant * 0x30;
}
