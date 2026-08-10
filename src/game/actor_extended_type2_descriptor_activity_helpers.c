#include "tingle/types.h"

/*
 * Recovered extended type-two actor descriptor/activity helpers. They expose
 * packed descriptor values and gate bookkeeping or repeated activity probes.
 */
extern u8 data_020e83a5[];
extern u8 data_020e8380[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_ApplyMotionImpulse(void *actor);
#ifdef __cplusplus
}
#endif

/* Return signed descriptor byte +0x25 for actor index +0x4e; state is unchanged. */
s32 ActorExtendedType2_GetDescriptorValue25(const void *self)
{
    const u8 *actor = (const u8 *)self;
    return *(s8 *)(data_020e83a5 + *(u16 *)(actor + 0x4e) * 0x30);
}

/*
 * Extract descriptor halfword +0x2e bits zero through three as a signed nibble
 * and return one when value is at least that threshold, otherwise zero. Inputs
 * and descriptor data are read only; no SDK or hardware operation occurs.
 */
s32 ActorExtendedType2_IsValueAtLeastDescriptorThreshold0(const void *self, s32 value)
{
    const u8 *actor = (const u8 *)self;
    s16 encoded = *(s16 *)(data_020e8380 + *(u16 *)(actor + 0x4e) * 0x30 + 0x2e);
    s32 threshold = ((s32)((u32)(u16)encoded << 28)) >> 28;
    return value >= threshold;
}

/*
 * Invoke Actor_ApplyMotionImpulse(actor) unless actor +0x260 bit 0x8000 is set. The routine
 * has no meaningful return value and may change actor bookkeeping; no direct
 * SDK or hardware operation occurs.
 */
void ActorExtendedType2_ApplyMotionImpulseIfEnabled(void *self)
{
    u8 *actor = (u8 *)self;
    if ((*(u32 *)(actor + 0x260) & 0x8000) == 0)
        Actor_ApplyMotionImpulse(actor);
}

/*
 * Return zero when actor +0x10 bit 0x1000000 or +0x14 bits one/two are set.
 * Otherwise probe the condition +0x260 bit one set and virtual +0xa8 inactive;
 * return one if it succeeds. If it fails, retail code repeats the identical
 * probe once, allowing a stateful virtual query a second chance, and returns
 * that result. Actor flags are read only, but virtual +0xa8 may have observable
 * engine effects; no direct hardware operation occurs.
 */
s32 ActorExtendedType2_IsInteractionActive(void *self)
{
    u8 *actor = (u8 *)self;
    s32 active;
    if ((*(u32 *)(actor + 0x10) & 0x1000000) != 0 ||
        (*(u32 *)(actor + 0x14) & 6) != 0)
        return 0;
    active = ((*(u32 *)(actor + 0x260) & 2) != 0 &&
              (*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) == 0);
    if (active)
        return 1;
    active = ((*(u32 *)(actor + 0x260) & 2) != 0 &&
              (*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) == 0);
    return active != 0;
}
