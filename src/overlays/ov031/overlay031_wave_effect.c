#include "tingle/types.h"

/* Overlay 31 double-buffered 192-line waveform and signed offset generation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s8 data_ov031_021fe5fc[];
extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern s32 func_02091a70(s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Initializes a 0x4A4-byte waveform generator from `mode` and fade duration
 * `duration`. It clears both 192-entry signed-halfword wave buffers; fills both
 * 192-byte offset buffers with zero, or -16 for mode 1; selects buffer 0; clears
 * phases/counters +0x488..+0x490; and initializes notch/marker positions to
 * 0x3C/0x82. Returns void; only generator memory changes.
 */
extern "C" void func_ov031_021fce00(void *effect, s32 mode, s32 duration)
{
    FIELD(s32, effect, 0x480) = mode;
    FIELD(s32, effect, 0x49c) = duration;
    FIELD(s32, effect, 0x4a0) = 0;
    FIELD(s32, effect, 0x484) = 0;
    s8 initialOffset = mode == 1 ? -16 : 0;
    for (s32 i = 0; i < 0xc0; ++i) {
        FIELD(s16, effect, 0x180 + i * 2) = 0;
        FIELD(s16, effect, i * 2) = 0;
        FIELD(s8, effect, 0x3c0 + i) = initialOffset;
        FIELD(s8, effect, 0x300 + i) = initialOffset;
    }
    FIELD(s32, effect, 0x488) = 0;
    FIELD(s32, effect, 0x48c) = 0;
    FIELD(s32, effect, 0x490) = 0;
    FIELD(s32, effect, 0x494) = 0x3c;
    FIELD(s32, effect, 0x498) = 0x82;
}

/*
 * Lightweight initialization for a caller that preserves existing buffers:
 * stores `mode`/+0x480 and `duration`/+0x49C and clears elapsed time +0x4A0.
 * Returns void; only those three generator words change.
 */
extern "C" void func_ov031_021fce84(void *effect, s32 mode, s32 duration)
{
    FIELD(s32, effect, 0x480) = mode;
    FIELD(s32, effect, 0x49c) = duration;
    FIELD(s32, effect, 0x4a0) = 0;
}

/*
 * Generates one 192-line frame into the buffer selected by +0x484. It advances
 * elapsed fade time toward +0x49C, derives a 0..0x100 amplitude (fade-in for mode
 * 1, fade-out for mode 2), combines two sine waves with independently randomized
 * amplitudes, writes a repeating five-byte pattern from 0x021FE5FC, cuts a moving
 * 32-line notch, inserts 10/14 marker bytes, and scales signed offsets around -16
 * by the fade amplitude. It then advances phases by -0x12C/+0x2BC, pattern phase
 * by one, notch position by one, and marker position modulo 250. Returns void;
 * PRNG state and the selected waveform/offset buffers and counters change. Fixed-
 * point shifts follow the recovered arithmetic; the visual labels are inferred.
 */
extern "C" void func_ov031_021fce98(void *effect)
{
    s8 pattern[5];
    for (s32 i = 0; i < 5; ++i)
        pattern[i] = data_ov031_021fe5fc[i];
    s32 buffer = FIELD(s32, effect, 0x484);
    s16 *wave = (s16 *)effect + buffer * 0xc0;
    s8 *offset = (s8 *)effect + 0x300 + buffer * 0xc0;
    s32 elapsed = FIELD(s32, effect, 0x4a0);
    s32 duration = FIELD(s32, effect, 0x49c);
    if (elapsed < duration)
        FIELD(s32, effect, 0x4a0) = ++elapsed;
    s32 scale = 0x100;
    if (FIELD(s32, effect, 0x480) == 1)
        scale = func_02091a70(0, 0x100, duration, elapsed);
    else if (FIELD(s32, effect, 0x480) == 2)
        scale = func_02091a70(0x100, 0, duration, elapsed);

    s32 amplitudeA = (genrand_int32() & 0xfff) * 10;
    s32 amplitudeB = (genrand_int32() & 0xfff) * 5;
    for (s32 i = 0; i < 0xc0; ++i) {
        u16 phaseA = (u16)(FIELD(s32, effect, 0x48c) + i * 0x1414);
        u16 phaseB = (u16)(FIELD(s32, effect, 0x488) + i * 0x5dc);
        s64 first = (s64)data_020c9670[phaseA >> 4] * amplitudeA;
        s64 second = (s64)data_020c9670[phaseB >> 4] * amplitudeB;
        wave[i] = (s16)(((first + 0x800) >> 24) +
                        ((second + 0x800) >> 24));
        offset[i] = pattern[(FIELD(s32, effect, 0x490) + i) % 5];
    }
    s32 notch = (FIELD(s32, effect, 0x494) / 2) % 0xe6 - 0x20;
    for (s32 i = 0; i < 0x20; ++i, ++notch) {
        if (notch >= 0 && notch < 0xc0)
            offset[notch] -= 3;
    }
    s32 marker = FIELD(s32, effect, 0x498);
    if (marker < 0xc0) {
        offset[marker] = 10;
        if (marker + 1 < 0xc0)
            offset[marker + 1] = 14;
    }
    for (s32 i = 0; i < 0xc0; ++i)
        offset[i] = (s8)(((offset[i] + 16) * scale) / 256 - 16);
    FIELD(s32, effect, 0x488) -= 0x12c;
    FIELD(s32, effect, 0x48c) += 0x2bc;
    ++FIELD(s32, effect, 0x490);
    ++FIELD(s32, effect, 0x494);
    FIELD(s32, effect, 0x498) = (marker + 1) % 0xfa;
}

/*
 * Returns signed waveform sample `index` from the buffer opposite +0x484, which
 * is the completed/read buffer in the recovered double-buffer convention. No
 * memory, SDK, or hardware state changes.
 */
extern "C" s32 func_ov031_021fd160(void *effect, s32 index)
{
    s32 readBuffer = 1 - FIELD(s32, effect, 0x484);
    return FIELD(s16, effect, readBuffer * 0x180 + index * 2);
}

/*
 * Returns signed offset byte `index` from the buffer opposite +0x484. No memory,
 * SDK, or hardware state changes.
 */
extern "C" s32 func_ov031_021fd17c(void *effect, s32 index)
{
    s32 readBuffer = 1 - FIELD(s32, effect, 0x484);
    return FIELD(s8, effect, 0x300 + readBuffer * 0xc0 + index);
}
