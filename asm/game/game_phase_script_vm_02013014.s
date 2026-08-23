; Matching retail form; see src/game/game_phase_script_vm_actor_state_opcodes.c.
.text
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition

    .global GamePhaseActorScriptVm_GetAttachmentByte38
GamePhaseActorScriptVm_GetAttachmentByte38: ; 0x02013014
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x84]
    ldr r1, [r1, #0x54]
    ldrb r1, [r1, #0x38]
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size GamePhaseActorScriptVm_GetAttachmentByte38, . - GamePhaseActorScriptVm_GetAttachmentByte38

