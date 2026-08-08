#include "tingle/types.h"

/* Overlay 35 randomized particle construction, drift update, and GX drawing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern const u8 data_ov035_02203c40[];
extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020949ec(void *object);
extern u32 genrand_int32(void);
extern s32 func_020918f4(void *randomState, s32 maximum);
extern s32 func_0209189c(void *randomState, s32 minimum, s32 maximum);
extern void func_02094bf0(void *object, s32 x, s32 y, s32 z);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_020948e4(void *field, s32 mode, s32 value);
extern void func_020948d4(void *field, s32 value);
extern void func_020b0880(s16 sine, s16 cosine);
extern void func_020b0844(s16 sine, s16 cosine);
extern void func_020b0808(s16 sine, s16 cosine);
extern void func_ov035_021fd274(void *object, s16 duration);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a randomized particle after common base initialization. It seeds
 * random state +0x9C, chooses uniform scale below 0x10000, randomized position
 * components, a -0x800 field at +0x1C, lifetime 120..149, and drift +0xA0=0.
 * One of seven RGB555 color patterns is selected for +0xA4; +0xA6 receives the
 * same components halved. Returns the particle; RNG and object state change,
 * with no direct MMIO.
 */
extern "C" void *func_ov035_021fd7f0(void *particle)
{
    func_020949ec(particle);
    FIELD(const void *, particle, 0) = data_ov035_02203c40;
    FIELD(u32, particle, 0x9c) = 0;
    FIELD(u32, particle, 0x9c) = genrand_int32();

    s32 scale = func_020918f4((u8 *)particle + 0x9c, 0x1000) << 4;
    func_02094bf0(particle, scale, scale, scale);
    s32 x = func_0209189c((u8 *)particle + 0x9c, -0x800, 0x800);
    s32 z = func_0209189c((u8 *)particle + 0x9c, -0x400, 0x400);
    func_02094bbc(particle, x, 0x1200, z);
    func_020948e4((u8 *)particle + 0x1c, 1, -0x800);
    func_ov035_021fd274(
        particle, (s16)(func_020918f4((u8 *)particle + 0x9c, 30) + 120));
    FIELD(s32, particle, 0xa0) = 0;

    s32 red = 0;
    s32 green = 0;
    s32 blue = 0;
    switch (func_020918f4((u8 *)particle + 0x9c, 7)) {
    case 0:
        red = 31;
        blue = func_0209189c((u8 *)particle + 0x9c, 0, 31);
        break;
    case 1:
        red = 31;
        green = func_0209189c((u8 *)particle + 0x9c, 0, 31);
        break;
    case 2:
        red = func_0209189c((u8 *)particle + 0x9c, 0, 31);
        green = 31;
        break;
    case 3:
        green = 31;
        blue = func_0209189c((u8 *)particle + 0x9c, 0, 31);
        break;
    case 4:
        green = func_0209189c((u8 *)particle + 0x9c, 0, 31);
        blue = 31;
        break;
    case 5:
        red = func_0209189c((u8 *)particle + 0x9c, 0, 31);
        blue = 31;
        break;
    case 6:
        red = 31;
        green = 31;
        blue = 31;
        break;
    }
    FIELD(u16, particle, 0xa4) =
        (u16)(red | (green << 5) | (blue << 10));
    FIELD(u16, particle, 0xa6) =
        (u16)((red / 2) | ((green / 2) << 5) | ((blue / 2) << 10));
    return particle;
}

/*
 * Advances particle rotation +0x60 by 0x400 and applies a random -2..1 change
 * to drift +0xA0, then writes translation +0x10 plus that drift through the
 * common transform helpers. Returns no value; particle/RNG state changes.
 */
extern "C" void func_ov035_021fd9dc(void *particle)
{
    func_020948d4((u8 *)particle + 0x5c,
                  FIELD(s32, particle, 0x60) + 0x400);
    FIELD(s32, particle, 0xa0) +=
        func_0209189c((u8 *)particle + 0x9c, -2, 2);
    func_020948d4((u8 *)particle + 0x0c,
                  FIELD(s32, particle, 0x10) +
                      FIELD(s32, particle, 0xa0));
}

/*
 * Draws the particle after loading translation and rotations +0x40/+0x50/
 * +0x60 from the shared sine/cosine table. It applies unit scale, begins a
 * GX primitive, emits two vertices colored by +0xA4 and +0xA6, closes it, and
 * flushes geometry. Returns no value and directly changes Nintendo DS GX MMIO.
 */
extern "C" void func_ov035_021fda24(void *particle)
{
    s32 ix = ((u16)FIELD(s32, particle, 0x40) >> 4) * 2;
    s32 iy = ((u16)FIELD(s32, particle, 0x50) >> 4) * 2;
    s32 iz = ((u16)FIELD(s32, particle, 0x60) >> 4) * 2;
    REG32(0x04000444) = 0;
    REG32(0x04000470) = FIELD(u32, particle, 0x10);
    REG32(0x04000470) = FIELD(u32, particle, 0x20);
    REG32(0x04000470) = FIELD(u32, particle, 0x30);
    func_020b0880(data_020c9670[ix], data_020c9670[ix + 1]);
    func_020b0844(data_020c9670[iy], data_020c9670[iy + 1]);
    func_020b0808(data_020c9670[iz], data_020c9670[iz + 1]);
    REG32(0x0400046c) = 0x10000;
    REG32(0x0400046c) = 0x10000;
    REG32(0x0400046c) = 0x10000;
    REG32(0x04000500) = 1;
    REG32(0x04000480) = FIELD(u16, particle, 0xa4);
    REG32(0x0400048c) = 6;
    REG32(0x0400048c) = 8;
    REG32(0x04000498) = 0x8fffa;
    REG32(0x04000480) = FIELD(u16, particle, 0xa6);
    REG32(0x04000498) = 0xfff8fffa;
    REG32(0x04000498) = 0xfff80006;
    REG32(0x04000504) = 0;
    REG32(0x04000448) = 1;
}
