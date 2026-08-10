#include "tingle/types.h"

/* Recovered animation-sequence wrapper around the impulse actor update. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020349b8(void *actor, u32 sequence, s32 argument);
extern void TrackedResourceActorImpulse_Update(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are a sequence actor and three unused callback arguments. Capture the
 * actor's low 15-bit state at 0x1F0. If it starts in state 0 with a nonzero low
 * nibble at 0x4B, request sequence 0x4283 through func_020349b8. Then run the
 * impulse update TrackedResourceActorImpulse_Update; if that call changed state 0 to state 1, request
 * sequence 0x4282. Both sequence requests use argument zero. Returns nothing;
 * animation and engine state can change without direct hardware access.
 */
void func_02052170(void *actor, u32 unused1, u32 unused2, u32 unused3)
{
    u16 initial_state = FIELD(u16, actor, 0x1f0) & 0x7fff;
    (void)unused1;
    (void)unused2;
    (void)unused3;
    if (initial_state == 0 && (FIELD(u8, actor, 0x4b) & 0x0f) != 0)
        func_020349b8(actor, 0x4283, 0);
    TrackedResourceActorImpulse_Update(actor);
    if (initial_state == 0 && (FIELD(u16, actor, 0x1f0) & 0x7fff) == 1)
        func_020349b8(actor, 0x4282, 0);
}
