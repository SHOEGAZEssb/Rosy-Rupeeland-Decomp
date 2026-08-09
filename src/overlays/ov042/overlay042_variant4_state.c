#include "tingle/types.h"

/*
 * Overlay 42 fourth late-variant state setup. This recovered initializer copies
 * a caller transform, selects animation and target coordinates by subtype, and
 * primes the variant's opening movement vector.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_ov042_021fda0c(void *destination, const void *source);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" void func_02072b68(void *resource, u8 mode);

/*
 * Given object, subtype, and source payload, copy the source to +0x50, clear
 * +0x88, select an even resource mode from subtype modulo three, clear resource
 * bit 1, and restore child scale to 0x100. Subtypes below four and subtype seven
 * enter state one and select one of five confirmed target pairs; subtypes four
 * through six enter state five with subtype-dependent horizontal displacement.
 * All handled paths move the current point upward by 0x17000 and prime a
 * 0x2000 vertical velocity. Set +0x7C=10, clear +0x80, and return no value.
 */
extern "C" void func_ov042_02209af4(void *object, u8 subtype,
                                      const void *source)
{
    static const s32 targets[5][2] = {
        {-124, 240}, {124, 240}, {-124, 110}, {124, 110}, {0, 155},
    };

    FIELD(u8, object, 0x8a) = subtype;
    func_ov042_021fda0c((u8 *)object + 0x50, source);
    FIELD(u16, object, 0x88) = 0;
    void *child = FIELD(void *, object, 0x4c);
    void *resource = FIELD(void *, child, 0xc);
    func_02072b68(resource, (u8)((subtype % 3) * 2));
    FIELD(u16, resource, 0x24) &= (u16)~2;
    FIELD(u16, child, 0x3c) = 0x100;
    FIELD(u16, child, 0x3e) = 0x100;

    if (subtype < 4 || subtype == 7) {
        FIELD(s32, object, 0x74) = 1;
        if ((subtype & 1) != 0)
            FIELD(s32, object, 0x54) += 0x40000;
        else
            FIELD(s32, object, 0x54) -= 0x40000;
        FIELD(s32, object, 0x58) -= 0x17000;
        s32 index = subtype == 7 ? 4 : subtype;
        FIELD(s32, object, 0x60) = targets[index][0] << 12;
        FIELD(s32, object, 0x64) = targets[index][1] << 12;
        FIELD(s32, object, 0x6c) = 0;
        FIELD(s32, object, 0x70) = 0x2000;
    } else if (subtype == 4 || subtype == 6) {
        FIELD(s32, object, 0x74) = 5;
        FIELD(s32, object, 0x54) -= 0x40000;
        FIELD(s32, object, 0x58) -= 0x17000;
        FIELD(s32, object, 0x6c) = -0x2000;
        FIELD(s32, object, 0x70) = 0x2000;
    } else if (subtype == 5) {
        FIELD(s32, object, 0x74) = 5;
        FIELD(s32, object, 0x54) += 0x40000;
        FIELD(s32, object, 0x58) -= 0x17000;
        FIELD(s32, object, 0x6c) = 0x2000;
        FIELD(s32, object, 0x70) = 0x2000;
    }
    FIELD(s32, object, 0x7c) = 10;
    FIELD(s32, object, 0x80) = 0;
}
