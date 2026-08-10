#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement actor-script opcodes that wait for and query movement completion. */

#ifdef __cplusplus
extern "C" {
#endif
extern u32 *ActorRuntimeTriple_Assign(void *object, u32 first, u32 second, u32 third);
extern void Actor_SetVelocity(void *actor, const VecFx32Object *value);
#ifdef __cplusplus
}
#endif

/*
 * If actor flag 0x40 is still set, rewind the opcode by two bytes and return
 * one so the VM polls again later. Once clear, normalize the actor's auxiliary
 * state: type byte 1 clears bit 1 at actor->0x54->0x24, three four-word blocks
 * at offsets 0x38/0x88/0x98 are zeroed, and Actor_SetVelocity receives a zero
 * vector. Returns zero after that cleanup.
 */
s32 GamePhaseActorScriptVm_WaitForMovementCompletion(GamePhaseActorScriptVm *self)
{
    u8 *actor = (u8 *)self->actor;
    VecFx32Object zero;
    if ((*(u32 *)(actor + 0x10) & 0x40) != 0) {
        self->base.cursor -= 2;
        return 1;
    }
    if (actor[0xe6] == 1)
        *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) &= (u16)~2;
    ActorRuntimeTriple_Assign(actor + 0x38, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x88, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x98, 0, 0, 0);
    func_0200500c(&zero, 0, 0, 0);
    Actor_SetVelocity(actor, &zero);
    func_02005058(&zero);
    return 0;
}

/* Push whether actor flag 0x40 is set and return zero. */
s32 GamePhaseActorScriptVm_IsMovementActive(GamePhaseActorScriptVm *self)
{
    u32 flags = *(u32 *)((u8 *)self->actor + 0x10);
    GamePhaseScriptVm_SetResult(&self->base, (flags & 0x40) != 0);
    return 0;
}
