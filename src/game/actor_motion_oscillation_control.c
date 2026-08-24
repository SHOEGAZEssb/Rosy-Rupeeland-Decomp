#include "tingle/actor_motion.h"

/* Enable/disable and per-frame sampling controls for actor oscillation. */

extern u8 gSystemState[];

/*
 * Clear oscillation flag 0x2 and reset both embedded interval states. Returns
 * no value and affects no state outside this motion helper.
 */
void ActorMotion_ClearOscillation(ActorMotion *self)
{
    self->flags &= ~ACTOR_MOTION_FLAG_OSCILLATION;
    ActorMotionState_Reset(&self->state);
}

/*
 * Sample both interval states with the global frame/time word at SystemState
 * offset 0x64 and table mode zero. Store results in state trailing words;
 * returns no value and reads, but does not change, global system state.
 */
void ActorMotion_UpdateOscillation(ActorMotion *self)
{
    self->state.sampledOffsetX =
        ActorMotionOscillation_Sample(&self->state.xOscillation, *(s32 *)(gSystemState + 0x64), 0);
    self->state.sampledOffsetY =
        ActorMotionOscillation_Sample(&self->state.yOscillation, *(s32 *)(gSystemState + 0x64), 0);
}
