#include "tingle/types.h"

/*
 * Recovered extended type-three actor state reset. It clears transition state,
 * updates an optional handle, installs callbacks, and emits an indexed sound.
 */
extern u8 data_020e0224[];
extern u16 data_020e6f94[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SaveAndForceFlags(void *actor);
extern void func_02045184(void *handle, void *actor);
extern void func_020349b8(void *actor, u32 sound, s32 extra);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor +0xd0 bit 0x200 and halfword +0x24e, invoke Actor_SaveAndForceFlags, and if
 * handle +0x274 exists notify it through func_02045184(handle,actor). Install
 * callback pair data_020e0224+0x18/+0x1c at +0x218/+0x21c. Play nonzero sound
 * data_020e6f94[index +0x4e] with extra zero. Finally clear +0x260 bits zero
 * and one, set bit 0x4000, and clear target +0x228. Always returns zero. Actor,
 * handle, bookkeeping, callback, and sound state may change; func_020349b8 is
 * the sound boundary and there is no direct hardware access.
 */
s32 ActorExtendedType3_ResetInteractionState(void *self)
{
    u8 *actor = (u8 *)self;
    u16 sound;
    *(u32 *)(actor + 0xd0) &= ~0x200;
    *(u16 *)(actor + 0x24e) = 0;
    Actor_SaveAndForceFlags(actor);
    if (*(void **)(actor + 0x274) != 0)
        func_02045184(*(void **)(actor + 0x274), actor);
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020e0224 + 0x18);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020e0224 + 0x1c);
    sound = data_020e6f94[*(u16 *)(actor + 0x4e)];
    if (sound != 0)
        func_020349b8(actor, sound, 0);
    *(u32 *)(actor + 0x260) = (*(u32 *)(actor + 0x260) & ~3) | 0x4000;
    *(void **)(actor + 0x228) = 0;
    return 0;
}
