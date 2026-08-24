#include "tingle/types.h"

/*
 * Handle registered-subclass interactions and the four-entry global registry
 * used to select a nearby actor at the end of an update interval.
 */
extern s16 gActorRegisteredSubclassCounters[2];
extern void *gActorRegisteredSubclassRegistry[4];
extern u8 *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorTableRecord_ApplyCollisionResponse(void *actor, s32 value,
                                                    s32 zero, s32 extra);
extern void ActorRegisteredSubclass_StartTimedState(void *actor, u16 limit);
extern s32 func_02007868(void *actor);
extern void ActorRegisteredSubclass_TriggerPrimaryInteraction(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Return immediately when actor +0x14 bit two is set. Otherwise forward value
 * r1 and original r2 as the first and fourth non-self arguments of
 * ActorTableRecord_ApplyCollisionResponse, with zero between them. Start or
 * clamp the timed state to gActorRegisteredSubclassCounters[0]*6+16 frames and increment that
 * counter. Returns no value; actor interaction state and the global counter
 * change.
 */
void ActorRegisteredSubclass_ApplyCollisionAndStartTimedState(void *self,
                                                              s32 value,
                                                              s32 extra)
{
    u8 *actor = (u8 *)self;

    if ((*(u32 *)(actor + 0x14) & 2) != 0)
        return;
    ActorTableRecord_ApplyCollisionResponse(actor, value, 0, extra);
    ActorRegisteredSubclass_StartTimedState(
        actor, (u16)(gActorRegisteredSubclassCounters[0] * 6 + 16));
    ++gActorRegisteredSubclassCounters[0];
}

/*
 * Clear all four actor registry slots and both adjacent signed-halfword
 * counters in gActorRegisteredSubclassCounters. Takes no arguments, returns no value, and resets
 * the complete registered-subclass global state.
 */
void ActorRegisteredSubclass_ResetRegistry(void)
{
    s32 i;

    for (i = 0; i < 4; ++i)
        gActorRegisteredSubclassRegistry[i] = 0;
    gActorRegisteredSubclassCounters[1] = 0;
    gActorRegisteredSubclassCounters[0] = 0;
}

/*
 * If counter gActorRegisteredSubclassCounters[1] is nonzero and the primary runtime actor passes
 * func_02007868, scan all four registry slots, selecting the actor whose
 * attachment halfword +0x28 is smallest. Every occupied slot is cleared while
 * scanning. If the selected actor is within squared X/Y distance 1600 of the
 * primary actor (coordinates shifted down 12), invoke
 * ActorRegisteredSubclass_TriggerPrimaryInteraction on it. Finally clear
 * gActorRegisteredSubclassCounters[0]. Returns no value; registry, counter, and actor interaction
 * state may change. A zero [1] counter returns without clearing.
 */
void ActorRegisteredSubclass_ProcessRegistry(void)
{
    u8 *primary;
    u8 *selected = 0;
    s32 minimum = 0x7fffffff;
    s32 i;

    if (gActorRegisteredSubclassCounters[1] == 0)
        return;
    primary = *(u8 **)(gGamePhaseRuntime + 0x2ea4);
    if (func_02007868(primary) != 0) {
        for (i = 0; i < 4; ++i) {
            u8 *candidate = (u8 *)gActorRegisteredSubclassRegistry[i];
            if (candidate != 0) {
                s32 rank = *(u16 *)(*(u8 **)(candidate + 0x54) + 0x28);
                if (rank < minimum) {
                    minimum = rank;
                    selected = candidate;
                }
                gActorRegisteredSubclassRegistry[i] = 0;
            }
        }
        if (selected != 0) {
            s32 dy = (*(s32 *)(primary + 0x20) >> 12) -
                     (*(s32 *)(selected + 0x20) >> 12);
            s32 dx = (*(s32 *)(primary + 0x1c) >> 12) -
                     (*(s32 *)(selected + 0x1c) >> 12);
            if (dy * dy + dx * dx < 1600)
                ActorRegisteredSubclass_TriggerPrimaryInteraction(selected);
        }
    }
    gActorRegisteredSubclassCounters[0] = 0;
}

/* Return one without reading inputs or changing state. */
s32 ActorRegisteredSubclass_AlwaysTrue(void)
{
    return 1;
}
