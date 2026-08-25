#include "tingle/game_phase_script_vm.h"

/* Implement the script opcode that rebuilds an actor presentation object while preserving its display fields. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_RebuildPrimaryAttachment(
    void *actor, u16 creationOperandA, u16 creationOperandB,
    u16 creationOperandC, u16 creationOperandD);
extern void Actor_SetAttachmentAnimation(void *actor, u32 value);
extern void Actor_SetAttachmentEnabled(void *actor, u32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop a command and four u16 creation parameters, create a replacement
 * presentation object through Actor_RebuildPrimaryAttachment, apply the
 * command to the actor, copy the previous object's byte at 0x3a and signed
 * halfwords at 0x30..0x36 into the replacement, request actor update value
 * one, and return zero.
 */
s32 GamePhaseActorScriptVm_RebuildPrimaryAttachmentPreservingDisplayState(GamePhaseActorScriptVm *self)
{
    u32 animation = GamePhaseScriptVm_Pop(&self->base);
    u16 creationOperandD = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 creationOperandC = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 creationOperandB = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 creationOperandA = (u16)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor;
    u8 *oldAttachment = *(u8 **)(actor + 0x54);
    u8 savedByte3a = oldAttachment[0x3a];
    s16 savedHalfword36 = *(s16 *)(oldAttachment + 0x36);
    s16 savedScaleX = *(s16 *)(oldAttachment + 0x32);
    s16 savedScaleY = *(s16 *)(oldAttachment + 0x34);
    s16 savedAngle = *(s16 *)(oldAttachment + 0x30);
    u8 *newAttachment = (u8 *)Actor_RebuildPrimaryAttachment(
        actor, creationOperandA, creationOperandB, creationOperandC,
        creationOperandD);

    Actor_SetAttachmentAnimation(actor, animation);
    newAttachment[0x3a] = savedByte3a;
    *(s16 *)(newAttachment + 0x36) = savedHalfword36;
    *(s16 *)(newAttachment + 0x32) = savedScaleX;
    *(s16 *)(newAttachment + 0x34) = savedScaleY;
    *(s16 *)(newAttachment + 0x30) = savedAngle;
    Actor_SetAttachmentEnabled(actor, 1);
    return 0;
}
