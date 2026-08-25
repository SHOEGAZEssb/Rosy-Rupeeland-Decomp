#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes for presentation state and scaled dimensions. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gActorRuntimeCollection[];
extern void ActorRuntimeCollection_SetPendingValue(void *state, u32 value);
extern void Actor_SetAttachmentBaseScale(void *actor, s32 scaleX, s32 scaleY);
#ifdef __cplusplus
}
#endif

/* Queue a value on the global actor runtime collection and return zero. */
s32 GamePhaseActorScriptVm_SetCollectionPendingValue(GamePhaseActorScriptVm *self)
{
    u32 pendingValue = GamePhaseScriptVm_Pop(&self->base);
    ActorRuntimeCollection_SetPendingValue(gActorRuntimeCollection, pendingValue);
    return 0;
}

/* No-op script handler; ignores the VM and returns zero. */
s32 GamePhaseActorScriptVm_PresentationNoOp(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

/* Pop a raw angle into attachment halfword +0x30 and return zero. */
s32 GamePhaseActorScriptVm_SetAttachmentAngle(GamePhaseActorScriptVm *self)
{
    u32 rawAngle = GamePhaseScriptVm_Pop(&self->base);
    u8 *attachment = *(u8 **)((u8 *)self->actor + 0x54);
    *(u16 *)(attachment + 0x30) = (u16)rawAngle;
    return 0;
}

/*
 * Pop an eight-bit-turn angle and store 0x10000-(value<<8) in attachment angle
 * halfword +0x30. Returns zero and changes only presentation state.
 */
s32 GamePhaseActorScriptVm_SetAttachmentAngleFromByte(GamePhaseActorScriptVm *self)
{
    u32 byteAngle = GamePhaseScriptVm_Pop(&self->base);
    u8 *attachment = *(u8 **)((u8 *)self->actor + 0x54);
    *(u16 *)(attachment + 0x30) = (u16)(0x10000 - (byteAngle << 8));
    return 0;
}

/*
 * Pop Y then X attachment scales, clamp each to 0x20..0x200, cache their Q12
 * forms on the actor, and store the unshifted values in attachment halfwords
 * +0x32/+0x34. Returns zero and changes presentation state.
 */
s32 GamePhaseActorScriptVm_SetAttachmentScale(GamePhaseActorScriptVm *self)
{
    s32 scaleY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 scaleX = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *attachment = *(u8 **)((u8 *)self->actor + 0x54);
    if (scaleX < 0x20)
        scaleX = 0x20;
    else if (scaleX > 0x200)
        scaleX = 0x200;
    if (scaleY < 0x20)
        scaleY = 0x20;
    else if (scaleY > 0x200)
        scaleY = 0x200;
    Actor_SetAttachmentBaseScale(self->actor, scaleX << 4, scaleY << 4);
    *(u16 *)(attachment + 0x32) = (u16)scaleX;
    *(u16 *)(attachment + 0x34) = (u16)scaleY;
    return 0;
}
