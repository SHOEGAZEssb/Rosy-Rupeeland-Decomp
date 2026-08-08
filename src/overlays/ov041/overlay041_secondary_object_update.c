#include "tingle/types.h"

/*
 * Overlay 41 secondary scene-object update. This recovered routine advances a
 * vertical threshold, modulates paired audio channels, animates four sinusoidal
 * lane renderers, and increments the object's ten-by-nine value grid.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 func_020befec(s32, s32);
s32 func_020adc90(s32, s32);
void func_0205943c(void *, s32, s32, s32, s32, s32);
u32 genrand_int32(void);
extern void *gSoundContext;
extern const s16 data_020c9670[];
}

static s32 fixed_mul(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/*
 * Position the first special renderer from owner progress, clamped to -0x14000.
 * Mode two stops there. Other modes lower object+0x15C by 0x800 unless owner
 * state is 1/2, apply an inferred easing term while it approaches owner
 * progress, and set sound 0x12D volumes on channels 8/12 from that distance.
 * Four lane records inherit the threshold; their render Y positions receive
 * a sine offset and 0x1000 alignment, while phase/speed wrap at 0xFFFF with a
 * randomized new speed. Finally all 90 grid counters increment. No value is
 * returned; audio state and RNG are affected.
 */
extern "C" void func_ov041_02200a38(void *object)
{
    void *owner = FIELD(void *, object, 0x48);
    s32 rows = FIELD(s32, owner, 0x174);
    s32 progress = FIELD(s32, FIELD(void *, owner, 8), 0xd8);
    s32 span = (rows - 4) * 0x60;
    s32 cycle = func_020befec(progress, span);
    void *special = FIELD(void *, object, 0x5c);
    FIELD(s32, special, 0x34) = cycle * 0x90 - 0xb2000;
    if (FIELD(s32, special, 0x34) > -0x14000)
        FIELD(s32, special, 0x34) = -0x14000;

    if (FIELD(s32, owner, 0x1f4) == 2)
        return;

    s32 ownerState = FIELD(s32, owner, 0x1cc);
    s32 paused = ownerState == 1 || ownerState == 2;
    if (!paused)
        FIELD(s32, object, 0x15c) -= 0x800;
    s32 relative = FIELD(s32, object, 0x15c) - progress;
    if (relative < 0x21c000 && !paused) {
        s32 easing = 0x1000 - func_020adc90(relative, 0x21c000);
        if (easing > 0x1000)
            easing = 0x1000;
        FIELD(s32, object, 0x15c) += fixed_mul(easing, 0x733);
    }

    if (!paused) {
        s32 volume = 0x99 - ((relative >> 12) / 8);
        if (volume < 0)
            volume = 0;
        if (volume > 100)
            volume = 100;
        func_0205943c(gSoundContext, 0x12d, 8, volume, 0, 0);
        if (volume < 10)
            volume = 10;
        func_0205943c(gSoundContext, 0x12d, 12, volume, 0, 0);
    }

    for (s32 lane = 3; lane >= 0; --lane) {
        u8 *record = (u8 *)object + 0x64 + lane * 12;
        FIELD(s32, record, 8) = FIELD(s32, object, 0x15c);
        void *render = FIELD(void *, object, 0x4c + lane * 4);
        FIELD(s32, render, 0x30) = FIELD(s32, record, 4);
        u16 phase = FIELD(u16, object, 0x94 + lane * 2);
        s32 sine = data_020c9670[(phase >> 4) * 2];
        FIELD(s32, render, 0x34) =
            (FIELD(s32, record, 8) - 0x7000 + fixed_mul(sine, 0x5000))
            & -0x1000;
        s32 advanced = phase + FIELD(u16, object, 0x9c + lane * 2);
        if (advanced >= 0xffff) {
            advanced -= 0xffff;
            FIELD(u16, object, 0x9c + lane * 2) =
                (u16)(0x2bc + (genrand_int32() & 0xf) * 0x50);
        }
        FIELD(u16, object, 0x94 + lane * 2) = (u16)advanced;
    }

    for (s32 row = 0; row < 10; ++row) {
        for (s32 column = 0; column < 9; ++column)
            ++FIELD(u16, object, 0xa4 + row * 18 + column * 2);
    }
}
