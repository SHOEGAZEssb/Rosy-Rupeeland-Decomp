#include "tingle/types.h"

/* Overlay 25 effect render callbacks, event dispatch, and small lifecycle helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_Play(void *, s32, s32);
extern void func_020954e0(void *);
extern void func_020954f4(void *);
#ifdef __cplusplus
}
#endif

static s32 fixed_to_integer(s32 value)
{
    /* The recovered correction makes signed 20.12 conversion truncate at zero. */
    return (value + (s32)((u32)(value >> 11) >> 20)) >> 12;
}

/*
 * Render-position callback for the effect controller. It converts base fixed-
 * point x +0x10 and combined y +0x20/+0x30 to integer sprite coordinates,
 * writes them to both primary sprites, and offsets both secondary sprites by
 * signed +0xA8 on x. Four sprite positions change; returns void.
 */
extern "C" void func_ov025_021ff0c8(void *object)
{
    s32 x = fixed_to_integer(FIELD(s32, object, 0x10));
    s32 y = fixed_to_integer(FIELD(s32, object, 0x20) +
                             FIELD(s32, object, 0x30));
    void *primary[2] = { FIELD(void *, object, 0xe8),
                         FIELD(void *, object, 0xf0) };
    void *secondary[2] = { FIELD(void *, object, 0xec),
                           FIELD(void *, object, 0xf4) };
    for (s32 i = 0; i < 2; ++i) {
        FIELD(u16, primary[i], 0x2c) = (u16)x;
        FIELD(u16, primary[i], 0x2e) = (u16)y;
        FIELD(u16, secondary[i], 0x2c) =
            (u16)(x + FIELD(s32, object, 0xa8));
        FIELD(u16, secondary[i], 0x2e) = (u16)y;
    }
}

/*
 * Dispatches a recovered effect event from `event`. Type zero invokes one of
 * two SDK effect hooks according to argument +4 and returns 2. Type one splits
 * the low halfword argument into a high sound group (bits 7+) and low 7-bit ID,
 * plays it through gSoundContext, and returns 2. Other types return 1.
 */
extern "C" s32 func_ov025_021ff158(void *object, const void *event)
{
    s32 type = FIELD(s32, event, 0);
    if (type == 0) {
        if (FIELD(s32, event, 4)) func_020954e0(object);
        else func_020954f4(object);
        return 2;
    }
    if (type == 1) {
        u16 packed = (u16)FIELD(s32, event, 4);
        Sound_Play(gSoundContext, packed >> 7, packed & 0x7f);
        return 2;
    }
    return 1;
}
