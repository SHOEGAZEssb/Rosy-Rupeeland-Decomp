#include "tingle/types.h"

/* Overlay 28 randomized scanline offsets and 16-color palette interpolation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov028_021ff174[];
extern u16 data_ov028_021ff300[];

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern s32 func_020918f4(void *, s32);
extern s32 func_02091a70(s32, s32, s32, s32);
extern void func_020b4554(void *, s32);
extern void func_020b44e8(void);
extern void func_ov028_021fce28(void *);
#ifdef __cplusplus
}
#endif

/* Seeds PRNG state +0x18, generates fresh ranges, and returns `object`. */
extern "C" void *func_ov028_021fce00(void *object)
{
    FIELD(u32, object, 0x18) = 0;
    FIELD(u32, object, 0x18) = genrand_int32();
    func_ov028_021fce28(object);
    return object;
}

/*
 * Clears phase +0 and selects two random [0,255] bases at +4/+0x10. Their
 * corresponding ends +8/+0x14 are base+0x60 plus a random [0,63] amount.
 * PRNG state +0x18 advances; returns void.
 */
extern "C" void func_ov028_021fce28(void *object)
{
    FIELD(s32, object, 0) = 0;
    FIELD(s32, object, 4) = func_020918f4((u8 *)object + 0x18, 0x100);
    FIELD(s32, object, 8) = FIELD(s32, object, 4) + 0x60 +
                            func_020918f4((u8 *)object + 0x18, 0x40);
    FIELD(s32, object, 0x10) = func_020918f4((u8 *)object + 0x18, 0x100);
    FIELD(s32, object, 0x14) = FIELD(s32, object, 0x10) + 0x60 +
                               func_020918f4((u8 *)object + 0x18, 0x40);
}

/*
 * During visible scanlines (VCOUNT<192), derives two packed 9-bit coordinate
 * pairs from phase +0, ranges +4/+8/+0x10/+0x14, and the 32-entry table at
 * 0x021FF174, then writes main-engine BG2X/BG2Y registers 0x04000018/1C.
 * Returns void and has no effect during VBlank.
 */
extern "C" void func_ov028_021fce94(void *object)
{
    s32 scanline = *(volatile u16 *)0x04000006;
    if (scanline >= 0xc0)
        return;
    u32 phase = FIELD(u32, object, 0);
    s32 left_index = (scanline + ((u32)(-(s32)phase) >> 2)) & 0x1f;
    s32 right_index = (scanline + (phase >> 2)) & 0x1f;
    u32 x = (FIELD(s32, object, 4) + data_ov028_021ff174[left_index]) & 0x1ff;
    u32 y = (FIELD(s32, object, 0x10) + (phase >> 2)) & 0x1ff;
    *(volatile u32 *)0x04000018 = x | (y << 16);
    x = (FIELD(s32, object, 8) + data_ov028_021ff174[right_index]) & 0x1ff;
    y = (FIELD(s32, object, 0x14) - (phase >> 2)) & 0x1ff;
    *(volatile u32 *)0x0400001c = x | (y << 16);
}

/*
 * Interpolates all RGB5 components of 16 colors from `from` toward `to` using
 * blend amount `weight` over denominator 16. Results go to 0x021FF300, then
 * the 32-byte buffer is flushed and the SDK transfer hook is invoked. Returns
 * void; the final hook is inferred to publish the prepared palette.
 */
extern "C" void func_ov028_021fcf2c(const u16 *from, const u16 *to,
                                      s32 weight)
{
    for (s32 i = 0; i < 16; ++i) {
        s32 r = func_02091a70(from[i] & 0x1f, to[i] & 0x1f, 0x10, weight);
        s32 g = func_02091a70((from[i] >> 5) & 0x1f,
                              (to[i] >> 5) & 0x1f, 0x10, weight);
        s32 b = func_02091a70((from[i] >> 10) & 0x1f,
                              (to[i] >> 10) & 0x1f, 0x10, weight);
        data_ov028_021ff300[i] = (u16)(r | (g << 5) | (b << 10));
    }
    func_020b4554(data_ov028_021ff300, 0x20);
    func_020b44e8();
}

/* Clears words +0/+4 and halfwords +8/+0xA. Returns void. */
extern "C" void func_ov028_021fcff4(void *record)
{
    FIELD(s32, record, 0) = 0;
    FIELD(s32, record, 4) = 0;
    FIELD(u16, record, 0xa) = 0;
    FIELD(u16, record, 8) = 0;
}
