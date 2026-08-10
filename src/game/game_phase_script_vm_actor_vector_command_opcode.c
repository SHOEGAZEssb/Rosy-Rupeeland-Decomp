#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement a script opcode that sends a scaled vector command to the bound actor. */

/*
 * Pop a command followed by Z, Y, and X components; scale each component by
 * 16; construct a temporary vector; invoke bound-actor virtual slot 46 with
 * the vector and command; destroy the vector; and return zero.
 */
s32 GamePhaseActorScriptVm_DispatchActorScaledVectorCommand(GamePhaseActorScriptVm *self)
{
    typedef void (*Method)(void *, const VecFx32Object *, s32);
    VecFx32Object vector;
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 z = (s32)GamePhaseScriptVm_Pop(&self->base) << 4;
    s32 y = (s32)GamePhaseScriptVm_Pop(&self->base) << 4;
    s32 x = (s32)GamePhaseScriptVm_Pop(&self->base) << 4;
    void *actor = self->actor;
    Method method;
    VecFx32Object_InitComponents(&vector, x, y, z);
    method = *(Method *)((u8 *)*(void **)actor + 0xb8);
    method(actor, &vector, command);
    VecFx32Object_Destroy(&vector);
    return 0;
}
