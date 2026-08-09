#include "tingle/types.h"

/*
 * Overlay 42 third late-variant state setup. The recovered routine samples an
 * owner-linked element, selects subtype-dependent target and duration data,
 * and derives a normalized fixed-point motion vector for the visible child.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_ov042_021ff2f8(void *destination, const void *source);
extern "C" s32 func_020adc40(s32 squaredLength);
extern "C" s32 func_020adc90(s32 numerator, s32 denominator);
extern "C" void func_02072b68(void *resource, u8 mode);
extern "C" s32 data_ov042_0220b6f4[];
extern "C" s32 data_ov042_0220b6f8[];
extern "C" s32 data_ov042_0220b704[];

/*
 * Copy owner+0xC+0xA4 into object+0x50, choose target coordinates from the
 * first words of eight-byte entries in the two confirmed tables using subtype
 * byte +0x8E, and choose +0x74 from data_ov042_0220b704 using subtype plus
 * twice owner state +0x150. Normalize target-minus-current into a vector scaled
 * by four at +0x6C/+0x70, select child resource mode one, set +0x78/+0x80 to
 * two, and clear +0x84/+0x88/+0x8C. Object and SDK state change; no return.
 */
extern "C" void func_ov042_022091f4(void *object)
{
    void *ownerState = FIELD(void *, FIELD(void *, object, 0x48), 0xc);
    func_ov042_021ff2f8((u8 *)object + 0x50, (u8 *)ownerState + 0xa4);
    u8 subtype = FIELD(u8, object, 0x8e);
    FIELD(s32, object, 0x60) = data_ov042_0220b6f4[subtype * 2] << 12;
    FIELD(s32, object, 0x64) = data_ov042_0220b6f8[subtype * 2] << 12;
    s32 durationIndex = subtype + FIELD(s32, ownerState, 0x150) * 2;
    FIELD(s32, object, 0x74) = data_ov042_0220b704[durationIndex * 2] << 12;
    s32 dx = FIELD(s32, object, 0x60) - FIELD(s32, object, 0x54);
    s32 dy = FIELD(s32, object, 0x64) - FIELD(s32, object, 0x58);
    s32 length = func_020adc40((s32)((((s64)dx * dx + 0x800) >> 12) +
                                     (((s64)dy * dy + 0x800) >> 12)));
    s32 nx = func_020adc90(dx, length);
    s32 ny = func_020adc90(dy, length);
    FIELD(s32, object, 0x6c) = (s32)(((s64)nx * 0x4000 + 0x800) >> 12);
    FIELD(s32, object, 0x70) = (s32)(((s64)ny * 0x4000 + 0x800) >> 12);
    func_02072b68(FIELD(void *, FIELD(void *, object, 0x4c), 0xc), 1);
    FIELD(s32, object, 0x80) = 2;
    FIELD(s32, object, 0x78) = 2;
    FIELD(u16, object, 0x8c) = 0;
    FIELD(s32, object, 0x84) = 0;
    FIELD(s32, object, 0x88) = 0;
}
