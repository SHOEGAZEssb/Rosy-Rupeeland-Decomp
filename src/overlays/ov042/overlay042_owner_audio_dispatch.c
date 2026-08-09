#include "tingle/types.h"

/*
 * Overlay 42 owner-audio dispatch. This recovered helper chooses one of two
 * address-derived sound-value tables from caller flags and applies an entry on
 * alternating owner phases.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_020a1ec0(void *owner, u16 value);
extern "C" u32 data_ov042_0220acf8[8];
extern "C" u32 data_ov042_0220ad18[8];

/*
 * Select data_ov042_0220ad18 when caller flags contain bit 1, otherwise select
 * data_ov042_0220acf8. If owner word +0x1C8 is odd, halve it with signed
 * truncation, select the resulting value modulo eight, narrow the table entry
 * to 16 bits, and pass it to func_020a1ec0 for object+0x48. Even owner phases
 * have no effect; no value is returned. Table meanings remain unconfirmed.
 */
extern "C" void func_ov042_02201ea0(void *object, u32 flags)
{
    const u32 *table = (flags & 2) ? data_ov042_0220ad18
                                   : data_ov042_0220acf8;
    s32 phase = FIELD(s32, object, 0x1c8);
    if ((phase & 1) == 0)
        return;
    s32 half = phase / 2;
    s32 index = half % 8;
    if (index < 0)
        index += 8;
    func_020a1ec0(FIELD(void *, object, 0x48), (u16)table[index]);
}
