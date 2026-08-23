#include "tingle/types.h"

/* Recovered animation-sequence wrapper around the impulse actor update. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_PlayHorizontalSpatialSound(void *actor, u32 packedSound, s32 pitch);
extern void TrackedResourceActorImpulse_Update(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are a sequence actor and three unused callback arguments. Capture the
 * actor's low 15-bit state at 0x1F0. If it starts in state 0 with a nonzero low
 * nibble at 0x4B, request packed sound 0x4283 through
 * Actor_PlayHorizontalSpatialSound. Then run TrackedResourceActorImpulse_Update;
 * if that call changed state 0 to state 1, request packed sound 0x4282. Both
 * sound requests use neutral pitch. Returns nothing;
 * animation and engine state can change without direct hardware access.
 */
void TrackedResourceActorType27_Update(void *actor, u32 unused1, u32 unused2, u32 unused3)
{
    u16 initial_state = FIELD(u16, actor, 0x1f0) & 0x7fff;
    (void)unused1;
    (void)unused2;
    (void)unused3;
    if (initial_state == 0 && (FIELD(u8, actor, 0x4b) & 0x0f) != 0)
        Actor_PlayHorizontalSpatialSound(actor, 0x4283, 0);
    TrackedResourceActorImpulse_Update(actor);
    if (initial_state == 0 && (FIELD(u16, actor, 0x1f0) & 0x7fff) == 1)
        Actor_PlayHorizontalSpatialSound(actor, 0x4282, 0);
}
