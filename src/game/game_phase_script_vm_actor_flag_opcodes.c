#include "tingle/game_phase_script_vm.h"

/* Implement paired actor-flag script opcodes and a fixed-point root query. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adc40(s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop a boolean and mirror it into actor word flag 0x10 and halfword flag 0x40
 * at actor->0x54->0x24. Returns zero.
 */
s32 GamePhaseActorScriptVm_SetActorFlag10AndAttachmentFlag40(GamePhaseActorScriptVm *self)
{
    u32 enabled = GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor;
    u32 *actorFlags = (u32 *)(actor + 0x10);
    u16 *objectFlags = (u16 *)(*(u8 **)(actor + 0x54) + 0x24);
    if (enabled != 0) {
        *actorFlags |= 0x10;
        *objectFlags |= 0x40;
    } else {
        *actorFlags &= ~0x10u;
        *objectFlags &= (u16)~0x40;
    }
    return 0;
}

/* Pop a boolean and set or clear halfword flag 0x80 at actor->0x54->0x24. */
s32 GamePhaseActorScriptVm_SetAttachmentFlag80(GamePhaseActorScriptVm *self)
{
    u32 enabled = GamePhaseScriptVm_Pop(&self->base);
    u16 *flags = (u16 *)(*(u8 **)((u8 *)self->actor + 0x54) + 0x24);
    if (enabled != 0)
        *flags |= 0x80;
    else
        *flags &= (u16)~0x80;
    return 0;
}

/* Pop a boolean and set or clear halfword flag 0x20 at actor->0x54->0x24. */
s32 GamePhaseActorScriptVm_SetAttachmentFlag20(GamePhaseActorScriptVm *self)
{
    u32 enabled = GamePhaseScriptVm_Pop(&self->base);
    u16 *flags = (u16 *)(*(u8 **)((u8 *)self->actor + 0x54) + 0x24);
    if (enabled != 0)
        *flags |= 0x20;
    else
        *flags &= (u16)~0x20;
    return 0;
}

/* Pop a value, push func_020adc40's fixed-point root result, and return zero. */
s32 GamePhaseActorScriptVm_ComputeFixedPointRoot(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_SetResult(&self->base, func_020adc40(value));
    return 0;
}
