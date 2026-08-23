#include "tingle/actor_pair_state.h"

/* Implement small derived-actor virtual overrides by forwarding to recovered base helpers. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_SetInteractionFlag2000(void *actor);
extern s32 Actor_ClearInteractionFlag2000(void *actor);
extern s32 Actor_PollInteractionIconState(void *actor);
extern u32 Actor_TestQueryPointAndClearFlag2000(void *actor, const void *query);
#ifdef __cplusplus
}
#endif

/*
 * Forward actor to ActorContactState_RemoveContact when a tracked pair ends,
 * ignoring the other
 * actor. Returns no value; the base helper owns all observable state changes.
 */
void ActorDerivedRuntime_HandlePairEnded(ActorPairActor *actor,
                                         ActorPairActor *other)
{
    (void)other;
    ActorContactState_RemoveContact(actor);
}

/* Accept recovered virtual inputs, change no state, and return no value. */
void ActorDerivedRuntime_NoOp(void)
{
}

/*
 * Set actor interaction flag 0x2000, discard the helper's result, and return
 * one to accept the query. No query coordinates are inspected here.
 */
s32 ActorDerivedRuntime_AcceptInteractionQuery(void *actor)
{
    (void)Actor_SetInteractionFlag2000(actor);
    return 1;
}

/*
 * Clear actor interaction flag 0x2000, poll the optional interaction icon's
 * active state, and return the poll wrapper's confirmed zero result.
 */
s32 ActorDerivedRuntime_ClearInteractionQueryState(void *actor)
{
    (void)Actor_ClearInteractionFlag2000(actor);
    return Actor_PollInteractionIconState(actor);
}

/*
 * Test the query against actor geometry, clearing flag 0x2000 on a miss, and
 * return the base helper's result unchanged.
 */
u32 ActorDerivedRuntime_TestInteractionQuery(void *actor, const void *query)
{
    return Actor_TestQueryPointAndClearFlag2000(actor, query);
}
