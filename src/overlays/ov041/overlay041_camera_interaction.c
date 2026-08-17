#include "tingle/types.h"

/*
 * Overlay 41 camera interaction update. This recovered routine integrates a
 * damped target displacement, applies mode bounds and shake, builds a temporary
 * transform, routes it to linked scene objects, and arms the next capture.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 SignedAbsoluteValue(s32);
u32 genrand_int32(void);
void VecFx32Object_InitCopy(void *, const void *);
s32 func_020a6990(void *, s32, s32);
void func_020a6aa8(void *, void *, s32);
void Sound_PlayDirectSequence(void *, s32, s32);
void func_ov041_021fffc8(void *, void *);
void func_ov070_02211dcc(void *, void *);
void func_ov041_02203434(void *, void *);
void func_ov041_02200ce8(void *, void *);
void func_020a214c(void *, void *, s32);
void func_ov041_021fe56c(void *);
void VecFx32Object_Destroy(void *);
extern void *gSoundContext;
}

static s32 mul_fixed(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

static s32 clamp_axis(s32 value, s32 limit)
{
    if (SignedAbsoluteValue(value) > limit)
        return value < 0 ? -limit : limit;
    if (SignedAbsoluteValue(value) <= 0x19a)
        return 0;
    return value;
}

/*
 * Integrate the camera toward target fields 0x1A0/0x1A4 using damping at
 * 0x1AC, with a smaller velocity cap in modes 0/2. Mode-one state can add
 * random shake. The resulting temporary transform is offset for alternating
 * capture banks, dispatched to every live scene subsystem, then destroyed.
 * This consumes RNG and updates camera, animation, audio, and capture state.
 */
extern "C" void func_ov041_021feec8(void *owner)
{
    s32 mode = FIELD(s32, owner, 0x1f4);
    s32 limit = (mode == 0 || mode == 2) ? 0x4800 : 0x8000;
    s32 predictedX = mul_fixed(FIELD(s32, owner, 0x1a0), 0xbd7);
    s32 velocityX = mul_fixed(predictedX - FIELD(s32, owner, 0x190),
                              FIELD(s32, owner, 0x1ac));
    s32 velocityY = mul_fixed(FIELD(s32, owner, 0x1a4) -
                              FIELD(s32, owner, 0x194),
                              FIELD(s32, owner, 0x1ac));
    FIELD(s32, owner, 0x190) += clamp_axis(velocityX, limit);
    FIELD(s32, owner, 0x194) += clamp_axis(velocityY, limit);

    if (FIELD(s32, owner, 0x1cc) == 1) {
        s32 strength = (0x96 - FIELD(s32, owner, 0x1d0)) * 100;
        if (strength > 0x1000)
            strength = 0x1000;
        if (strength < 0)
            strength = 0;
        FIELD(s32, owner, 0x190) += strength * ((s32)(genrand_int32() % 10) - 5);
        FIELD(s32, owner, 0x194) += strength * ((s32)(genrand_int32() % 10) - 5);
    }

    if (mode == 0 || mode == 2) {
        if (FIELD(s32, owner, 0x194) < 0xc0000)
            FIELD(s32, owner, 0x194) = 0xc0000;
        s32 maximum = (FIELD(s32, owner, 0x174) - 3) * 0x60 << 12;
        if (FIELD(s32, owner, 0x194) > maximum)
            FIELD(s32, owner, 0x194) = maximum;
    }

    FIELD(s32, owner, 0x1b4) =
        (FIELD(s32, owner, 0x1b0) - FIELD(s32, owner, 0x194)) >> 2;
    FIELD(s32, owner, 0x1b0) = FIELD(s32, owner, 0x194);

    u8 transform[0x10];
    VecFx32Object_InitCopy(transform, (u8 *)owner + 0x18c);
    if (FIELD(s32, owner, 0x1ec) == 0)
        FIELD(s32, transform, 8) -= 0xc0000;

    if (FIELD(s32, owner, 0x1cc) == 1 &&
        FIELD(s32, owner, 0x1d0) > 0x2d) {
        if (func_020a6990((u8 *)owner + 0x1c, 0, 6) != 0) {
            FIELD(s32, owner, 0x1cc) = 2;
            Sound_PlayDirectSequence(gSoundContext, 0x5f, 0x7f);
        }
        if (FIELD(s32, owner, 0x1ec) != 0)
            func_020a6aa8((u8 *)owner + 0x1c, transform, 4);
    }

    if (FIELD(s32, owner, 0x1f8) == 0) {
        func_ov041_021fffc8(FIELD(void *, owner, 0x10), transform);
        func_ov070_02211dcc(FIELD(void *, owner, 8), transform);
        if (FIELD(void *, owner, 0x0c) != 0)
            func_ov041_02203434(FIELD(void *, owner, 0x0c), transform);
        if (mode == 0 || mode == 2)
            func_ov041_02200ce8(FIELD(void *, owner, 0x14), transform);
    }
    func_020a214c(FIELD(void *, owner, 0x18), transform, 0);
    func_ov041_021fe56c(owner);
    VecFx32Object_Destroy(transform);
}
