#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes for presentation state and scaled dimensions. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_02105310[];
extern void ActorRuntimeCollection_SetPendingValue(void *state, u32 value);
extern void Actor_SetAttachmentBaseScale(void *actor, s32 scaleX, s32 scaleY);
#ifdef __cplusplus
}
#endif

/* Pop a value, pass it to data_02105310 through ActorRuntimeCollection_SetPendingValue, and return zero. */
s32 func_020142cc(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    ActorRuntimeCollection_SetPendingValue(data_02105310, value);
    return 0;
}

/* No-op script handler; ignores the VM and returns zero. */
s32 func_020142ec(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

/* Pop a raw angle into attachment halfword +0x30 and return zero. */
s32 GamePhaseActorScriptVm_SetAttachmentAngle(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    u8 *object = *(u8 **)((u8 *)self->actor + 0x54);
    *(u16 *)(object + 0x30) = (u16)value;
    return 0;
}

/*
 * Pop an eight-bit-turn angle and store 0x10000-(value<<8) in attachment angle
 * halfword +0x30. Returns zero and changes only presentation state.
 */
s32 GamePhaseActorScriptVm_SetAttachmentAngleFromByte(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    u8 *object = *(u8 **)((u8 *)self->actor + 0x54);
    *(u16 *)(object + 0x30) = (u16)(0x10000 - (value << 8));
    return 0;
}

/*
 * Pop Y then X attachment scales, clamp each to 0x20..0x200, cache their Q12
 * forms on the actor, and store the unshifted values in attachment halfwords
 * +0x32/+0x34. Returns zero and changes presentation state.
 */
s32 GamePhaseActorScriptVm_SetAttachmentScale(GamePhaseActorScriptVm *self)
{
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *object = *(u8 **)((u8 *)self->actor + 0x54);
    if (first < 0x20)
        first = 0x20;
    else if (first > 0x200)
        first = 0x200;
    if (second < 0x20)
        second = 0x20;
    else if (second > 0x200)
        second = 0x200;
    Actor_SetAttachmentBaseScale(self->actor, first << 4, second << 4);
    *(u16 *)(object + 0x32) = (u16)first;
    *(u16 *)(object + 0x34) = (u16)second;
    return 0;
}
