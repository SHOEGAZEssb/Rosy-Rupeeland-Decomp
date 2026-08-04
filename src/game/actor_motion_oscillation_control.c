#include "tingle/actor_motion.h"

/* Enable/disable and per-frame sampling controls for actor oscillation. */

extern u8 gSystemState[];

/*
 * Clear oscillation flag 0x2 and reset both embedded interval states. Returns
 * no value and affects no state outside this motion helper.
 */
void func_02009694(ActorMotion *self)
{
    self->field_30 &= ~2;
    func_02009154(&self->state);
}

/*
 * Sample both interval states with the global frame/time word at SystemState
 * offset 0x64 and table mode zero. Store results in state trailing words;
 * returns no value and reads, but does not change, global system state.
 */
void func_020096b0(ActorMotion *self)
{
    self->state.field_18 =
        func_020096f0(&self->state.first, *(s32 *)(gSystemState + 0x64), 0);
    self->state.field_1c =
        func_020096f0(&self->state.second, *(s32 *)(gSystemState + 0x64), 0);
}
