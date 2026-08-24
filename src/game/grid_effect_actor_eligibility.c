#include "tingle/types.h"

/* Recovered proximity-interaction eligibility predicate for the grid/effect actor. */

extern void *gGamePhaseRuntime;
extern const u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(const void *state);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is an actor. Return one only when the low two state bits at 0x1F0 equal
 * one, the global gate queried with gActorRuntimeCollection is clear, and bit 0x100 is
 * absent from the primary global actor's word 0xD0; otherwise return zero.
 * No actor, SDK, or hardware state is changed.
 */
s32 GridEffectActor_CanBeginDeparture(void *actor)
{
    if ((FIELD(u16, actor, 0x1f0) & 3) == 1 &&
        ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) == 0) {
        void *primary = FIELD(void *, gGamePhaseRuntime, 0x2ea4);
        if ((FIELD(u32, primary, 0xd0) & 0x100) == 0)
            return 1;
    }
    return 0;
}
