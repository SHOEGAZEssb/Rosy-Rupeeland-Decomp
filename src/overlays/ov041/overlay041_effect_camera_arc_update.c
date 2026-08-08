#include "tingle/types.h"

/*
 * Overlay 41 camera-relative arc motion. This recovered helper animates record
 * zero on a vertical arc relative to the current view and mirrors its position
 * into the remaining effect records.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_ov041_021fec04(void *, const void *);
u32 genrand_int32(void);
void func_ov041_02202a70(void *);
void Sound_Play(void *, s32, s32);
extern void *gSoundContext;
extern s16 data_020c9670[];
}

/*
 * Move the baseline at object+0x4B4 toward zero, advance its phase by 0x320,
 * and position record zero on a 0x28000-radius vertical arc adjusted by
 * viewY-ownerY. Phase wrap near zero plays sound 0x12D on channel 11. Records
 * 2 through 90 copy record zero each frame. After phase 0x20000 the function
 * enters mode ten, resets phase state, stores the view-relative baseline and
 * horizontal origin, chooses a plus/minus 70 direction offset, and invokes the
 * auxiliary initializer. It returns no value and consumes the PRNG once.
 */
extern "C" void func_ov041_0220232c(void *object)
{
    void *owner = FIELD(void *, object, 0x48);
    void *view = FIELD(void *, owner, 0x14);
    if (FIELD(s32, object, 0x4b4) > 0)
        FIELD(s32, object, 0x4b4) -= 0x1000;

    s32 phase = FIELD(s32, object, 0x930) + 0x320;
    FIELD(s32, object, 0x930) = phase;
    if ((s32)(u16)phase - 0x258 <= 0)
        Sound_Play(gSoundContext, 0x12d, 11);

    u32 direction = ((u16)phase >> 4) * 2;
    s32 sample = data_020c9670[direction + 1];
    s32 viewOffset =
        FIELD(s32, view, 0x15c) - FIELD(s32, owner, 0x194);
    FIELD(s32, object, 0x70) =
        FIELD(s32, object, 0x4b4) + viewOffset +
        (s32)(((s64)sample * 0x28000 + 0x800) >> 12);

    void *recordZero = (u8 *)object + 0x68;
    for (s32 i = 90; i >= 2; --i)
        func_ov041_021fec04((u8 *)recordZero + i * 12, recordZero);

    FIELD(s32, object, 0x4b8) = 0x8000;
    FIELD(s32, object, 0x940) = (0x1000 - sample) >> 1;
    if (phase > 0x20000) {
        FIELD(s32, object, 0x920) = 10;
        FIELD(s32, object, 0x934) = 0;
        FIELD(s32, object, 0x930) = 0;
        FIELD(s32, object, 0x91c) = 0;
        FIELD(s32, object, 0x4b4) = FIELD(s32, view, 0x15c) - 0xc8000;
        FIELD(s32, object, 0x94c) = 80;
        FIELD(s32, object, 0x948) = FIELD(s32, object, 0x6c);
        s32 side = ((genrand_int32() & 1) * 2) - 1;
        FIELD(s32, object, 0x4b8) += side * 70;
        func_ov041_02202a70(object);
    }
}
