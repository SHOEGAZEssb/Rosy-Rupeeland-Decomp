#include "tingle/types.h"

/* Overlay 36 single-primitive construction and immediate-mode GX drawing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern const u8 data_ov036_022060b4[];
extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020949ec(void *object);
extern void func_020b0808(s16 sine, s16 cosine);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a primitive after its common render base. mode is stored at
 * +0x9C, four caller-supplied 16-bit values at +0xA0..+0xA6, and base flag
 * +0x88 is set to one. The final two values arrive on the stack in the original
 * ABI. Returns object with no direct hardware effect.
 */
extern "C" void *func_ov036_021fd690(void *object, s32 mode, u16 valueA4,
                                      u16 valueA6, u16 valueA0, u16 valueA2)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov036_022060b4;
    FIELD(s32, object, 0x9c) = mode;
    FIELD(u16, object, 0xa0) = valueA0;
    FIELD(u16, object, 0xa2) = valueA2;
    FIELD(u16, object, 0xa4) = valueA4;
    FIELD(u16, object, 0xa6) = valueA6;
    FIELD(s32, object, 0x88) = 1;
    return object;
}

/*
 * Draws one primitive after loading translation and unit scale. Mode 0 rotates
 * using stored +0xA4/+0xA6 and emits constants 0xFFF8, 0xF8000000, and 8.
 * Mode 1 derives rotation from angle +0x60 and emits 0xFFFE, 0xFE800000, and 2.
 * Both paths use +0xA0/+0xA2 as recovered vertex/color values; other modes emit
 * no vertices. It has no return value and directly programs Nintendo DS GX.
 */
extern "C" void func_ov036_021fd6e0(void *object)
{
    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, object, 0x10);
    REG32(0x04000470) = FIELD(u32, object, 0x20);
    REG32(0x04000470) = FIELD(u32, object, 0x30);
    REG32(0x0400046c) = 0x10000;
    REG32(0x0400046c) = 0x10000;
    REG32(0x0400046c) = 0x10000;
    if (FIELD(s32, object, 0x9c) == 0) {
        func_020b0808(FIELD(s16, object, 0xa4), FIELD(s16, object, 0xa6));
        REG32(0x04000500) = 0;
        REG32(0x04000480) = FIELD(u16, object, 0xa0);
        REG32(0x0400048c) = 0x0000fff8;
        REG32(0x0400048c) = 0;
        REG32(0x04000480) = FIELD(u16, object, 0xa2);
        REG32(0x04000494) = 0xf8000000;
        REG32(0x04000480) = FIELD(u16, object, 0xa0);
        REG32(0x04000498) = 8;
    } else if (FIELD(s32, object, 0x9c) == 1) {
        s32 index = (FIELD(s32, object, 0x60) >> 4) * 2;
        func_020b0808(data_020c9670[index], data_020c9670[index + 1]);
        REG32(0x04000500) = 0;
        REG32(0x04000480) = FIELD(u16, object, 0xa0);
        REG32(0x0400048c) = 0x0000fffe;
        REG32(0x0400048c) = 0;
        REG32(0x04000480) = FIELD(u16, object, 0xa2);
        REG32(0x04000494) = 0xfe800000;
        REG32(0x04000480) = FIELD(u16, object, 0xa0);
        REG32(0x04000498) = 2;
    }
    REG32(0x04000504) = 0;
    REG32(0x04000448) = 1;
}
