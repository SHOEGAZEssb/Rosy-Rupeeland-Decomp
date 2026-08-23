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
extern void InteractionRecordAllocator_ReleaseOwner(void *handle, void *actor);
extern void Actor_PlayHorizontalSpatialSound(void *actor, u32 packedSound, s32 pitch);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor +0xd0 bit 0x200 and halfword +0x24e, invoke
 * Actor_SaveAndForceFlags, and release this actor's optional +0x274 record
 * reservations. Install callback pair data_020e0224+0x18/+0x1c at
 * +0x218/+0x21c. Request nonzero packed sound data_020e6f94[index +0x4e] at neutral pitch.
 * Finally clear +0x260 bits zero and one, set bit 0x4000, and clear target
 * +0x228. Always returns zero. Actor, allocator, bookkeeping, callback, and
 * sound state may change; Actor_PlayHorizontalSpatialSound is the sound boundary.
 */
s32 ActorExtendedType3_ResetInteractionState(void *self)
{
    u8 *actor = (u8 *)self;
    u16 sound;
    *(u32 *)(actor + 0xd0) &= ~0x200;
    *(u16 *)(actor + 0x24e) = 0;
    Actor_SaveAndForceFlags(actor);
    if (*(void **)(actor + 0x274) != 0)
        InteractionRecordAllocator_ReleaseOwner(*(void **)(actor + 0x274), actor);
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020e0224 + 0x18);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020e0224 + 0x1c);
    sound = data_020e6f94[*(u16 *)(actor + 0x4e)];
    if (sound != 0)
        Actor_PlayHorizontalSpatialSound(actor, sound, 0);
    *(u32 *)(actor + 0x260) = (*(u32 *)(actor + 0x260) & ~3) | 0x4000;
    *(void **)(actor + 0x228) = 0;
    return 0;
}
