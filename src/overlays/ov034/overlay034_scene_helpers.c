#include "tingle/types.h"

/* Overlay 34 scene descriptor initialization and callback installation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020add34(void *entry, void *selfReference);
#ifdef __cplusplus
}
#endif

/*
 * Configures descriptor `index` in a four-entry, 0x10-byte array at `base`.
 * Invalid indices leave all state unchanged. For valid indices it stores the
 * three leading caller words at +0/+4/+8, marks +0xE active, invokes
 * func_020add34 with the entry twice, then packs the final three stack-supplied
 * 5-bit fields into halfword +0xC and marks +0xE again. Returns no value; the
 * descriptor/helper state changes, with no direct hardware access.
 */
extern "C" void func_ov034_021fda4c(void *base, s32 index,
                                     s32 first, s32 second, s32 third,
                                     s32 field0, s32 field1, s32 field2)
{
    if (index < 0 || index >= 4)
        return;
    void *entry = (u8 *)base + index * 0x10;
    FIELD(u16, entry, 0xe) = 1;
    FIELD(s32, entry, 0) = first;
    FIELD(s32, entry, 4) = second;
    FIELD(s32, entry, 8) = third;
    func_020add34(entry, entry);
    FIELD(u16, entry, 0xe) = 1;
    FIELD(u16, entry, 0xc) =
        (u16)(field0 | (field1 << 5) | (field2 << 10));
}

/*
 * Installs a recovered three-word callback/member representation: the fourth
 * register argument goes to +0x1BC, the second/third to +0x1C0/+0x1C4, and
 * dispatch state +0x1B8 clears. Returns no value and performs no SDK/MMIO work.
 */
extern "C" void func_ov034_021fdac0(void *scene, s32 firstWord,
                                     s32 secondWord, s32 thirdWord)
{
    FIELD(s32, scene, 0x1bc) = thirdWord;
    FIELD(s32, scene, 0x1c0) = firstWord;
    FIELD(s32, scene, 0x1c4) = secondWord;
    FIELD(s32, scene, 0x1b8) = 0;
}
