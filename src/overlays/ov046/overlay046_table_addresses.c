#include "tingle/types.h"

/*
 * Overlay 46 table-address helpers. These recovered leaf routines combine
 * selector records with category bases to locate two differently sized global
 * records. The underlying table meanings are not yet confirmed.
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
extern "C" void *func_ov046_0220b740(s32 selector)
{
    s32 offset = selector * 0x14;
    s32 category = FIELD(s32, data_ov046_0220cd14, offset);
    s32 variant = FIELD(s32, data_ov046_0220cd18, offset);
    void *base = FIELD(void *, data_ov046_0220ce08, category * 0x28);
    return (u8 *)base + variant * 0x40;
}

/*
 * Return data_ov046_0220ce0c[category*0x28] plus variant*0x30, where category
 * and variant are read at offsets 0 and 8 of the selector's 0x14-byte record.
 * No state changes and no SDK/hardware effects occur.
 */
extern "C" void *func_ov046_0220b77c(s32 selector)
{
    s32 offset = selector * 0x14;
    s32 category = FIELD(s32, data_ov046_0220cd14, offset);
    s32 variant = FIELD(s32, data_ov046_0220cd1c, offset);
    void *base = FIELD(void *, data_ov046_0220ce0c, category * 0x28);
    return (u8 *)base + variant * 0x30;
}
