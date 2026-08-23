#include "tingle/types.h"

/* Smooth shared directional motion and advance the actor-interaction subsystems. */
extern u16 gActorInteractionDirectionIndex;
extern u16 gActorInteractionMagnitude;
extern s32 gActorInteractionSmoothedDisplacement[2];
extern s16 data_020c9670[];
extern u8 gActorInteractionResourceState[];

#ifdef __cplusplus
extern "C" {
#endif
/*
 * Matching-sensitive local ABI declaration: the retail call consumes the X/Y
 * values left live in r0/r1 by the two preceding stores. The canonical helper
 * otherwise takes explicit signed fx32 X/Y arguments; do not normalize this
 * declaration or call without re-establishing this function's exact report.
 */
extern s32 Fx32Vector2_Magnitude(void);
extern void ActorTargetSelection_Populate(void);
extern void func_02053560(void);
extern void ActorRegisteredSubclass_ProcessRegistry(void);
extern void InteractionTimingState_Tick(void);
#ifdef __cplusplus
}
#endif

/*
 * Decode the low byte of gActorInteractionDirectionIndex as the recovered
 * directional-table index, scale its signed pair by three times
 * gActorInteractionMagnitude, and replace both shared motion components with
 * one quarter of three times their old value plus the new fixed-point
 * contribution. If magnitude is zero and Fx32Vector2_Magnitude returns less
 * than 41, clear both components. Advance the four recovered runtime helpers
 * in order, clearing the leading resource-table halfword before
 * InteractionTimingState_Tick. Returns no value; helper calls change global
 * engine state. The matching fallback preserves compiler-sensitive shifts.
 */
void ActorInteractionRuntime_Update(void)
{
    u32 index = (u8)gActorInteractionDirectionIndex * 0x10;
    s32 scale = gActorInteractionMagnitude * 3;
    s32 first = data_020c9670[index];
    s32 second = data_020c9670[index + 1];

    gActorInteractionSmoothedDisplacement[0] =
        (gActorInteractionSmoothedDisplacement[0] * 3 + ((scale * first) >> 12)) >> 2;
    gActorInteractionSmoothedDisplacement[1] =
        (gActorInteractionSmoothedDisplacement[1] * 3 + ((scale * second) >> 12)) >> 2;
    if (gActorInteractionMagnitude == 0 && Fx32Vector2_Magnitude() < 0x29) {
        gActorInteractionSmoothedDisplacement[0] = 0;
        gActorInteractionSmoothedDisplacement[1] = 0;
    }
    ActorTargetSelection_Populate();
    func_02053560();
    ActorRegisteredSubclass_ProcessRegistry();
    *(u16 *)gActorInteractionResourceState = 0;
    InteractionTimingState_Tick();
}
