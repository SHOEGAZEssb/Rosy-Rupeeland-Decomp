#include "tingle/game_phase_script_vm.h"

/* Implement a fixed-memory script value write and the bound actor's orientation-step opcode. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02072b68(void *object, u8 value);
extern void func_020330fc(void *actor, s32 selector, s32 valueFx);
extern u8 gSystemState[];
#ifdef __cplusplus
}
#endif

/* Pop a value, store its low halfword at gSystemState+0x5c, and return zero. */
s32 func_02016014(GamePhaseActorScriptVm *self)
{
    *(u16 *)(gSystemState + 0x5c) = (u16)GamePhaseScriptVm_Pop(&self->base);
    return 0;
}

/*
 * Pop a signed step, add its low byte to actor byte 0xe7 modulo 256 and pass
 * that result to func_02072b68 on actor->0x54, then send step<<13 to actor
 * selector 17 through func_020330fc. Returns zero.
 */
s32 func_02016030(GamePhaseActorScriptVm *self)
{
    s32 step = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor_84;
    func_02072b68(*(void **)(actor + 0x54), (u8)(actor[0xe7] + step));
    func_020330fc(actor, 17, step << 13);
    return 0;
}
