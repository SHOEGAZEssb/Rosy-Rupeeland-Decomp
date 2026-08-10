#include "tingle/types.h"

/*
 * Recovered extended type-two actor long-delay audio transition. It maintains
 * a state-11 wait, emits variant-dependent sounds, and arms a callback at expiry.
 */
extern void *gSoundContext;
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern s32 ActorExtendedType2_GetDescriptorValue25(void *actor);
extern void func_020593dc(void *soundContext, s32 soundId, s32 mode,
                          void *actor, s32 zero, s32 scale);
#ifdef __cplusplus
}
#endif

/*
 * When signed counter +0x25a is zero, choose threshold +0x258 in [480,959]. If
 * signed byte +0x27e is zero, classify actor with ActorExtendedType2_GetDescriptorValue25: result zero
 * emits sound 0x90 and result one emits 0x1c6, both in mode two with trailing
 * parameters zero and 0x100. Before threshold, clear actor +0x260 bit zero,
 * set mode byte +0x24c to four, and enter state 11. At threshold, install global
 * member pair +0xe8/+0xec at +0x220/+0x224, set +0x260 bit 0x400000, and, when
 * byte +0x27e is zero and classification returns zero, emit sound 0x90 in mode
 * three. Increment +0x25a and always return zero. Actor, random, classification,
 * callback, and sound state may change; func_020593dc crosses the sound boundary.
 */
s32 ActorExtendedType2_UpdateLongDelayAudio(void *self)
{
    u8 *actor = (u8 *)self;
    s16 counter = *(s16 *)(actor + 0x25a);

    if (counter == 0) {
        *(u16 *)(actor + 0x258) =
            (u16)(func_020ada8c((s32)(genrand_int32() & 0x7fffffff), 480) + 480);
        if (*(s8 *)(actor + 0x27e) == 0) {
            s32 variant = ActorExtendedType2_GetDescriptorValue25(actor);
            if (variant == 0)
                func_020593dc(gSoundContext, 0x90, 2, actor, 0, 0x100);
            else if (variant == 1)
                func_020593dc(gSoundContext, 0x1c6, 2, actor, 0, 0x100);
        }
    } else if (counter >= *(u16 *)(actor + 0x258)) {
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0xe8);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0xec);
        *(u32 *)(actor + 0x260) |= 0x400000;
        if (*(s8 *)(actor + 0x27e) == 0 && ActorExtendedType2_GetDescriptorValue25(actor) == 0)
            func_020593dc(gSoundContext, 0x90, 3, actor, 0, 0x100);
    } else {
        *(u32 *)(actor + 0x260) &= ~1;
        actor[0x24c] = 4;
        *(u16 *)(actor + 0xd6) = 11;
    }
    ++*(s16 *)(actor + 0x25a);
    return 0;
}
