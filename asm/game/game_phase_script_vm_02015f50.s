; Matching retail form; see src/game/game_phase_script_vm_actor_presentation_rebuild_opcode.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Actor_SetAttachmentEnabled
.extern Actor_SetAttachmentAnimation
.extern Actor_RebuildPrimaryAttachment
.global GamePhaseActorScriptVm_RebuildPrimaryAttachmentPreservingDisplayState
GamePhaseActorScriptVm_RebuildPrimaryAttachmentPreservingDisplayState:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #4
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r8, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    ldr r5, [r5, #0x84]
    mov r1, r8, lsl #16
    ldr r10, [r5, #0x54]
    mov r12, r1, lsr #16
    mov r1, r6, lsl #16
    mov r2, r1, lsr #16
    mov r1, r7, lsl #16
    ldrb r6, [r10, #0x3a]
    ldrsh r7, [r10, #0x36]
    ldrsh r8, [r10, #0x32]
    ldrsh r9, [r10, #0x34]
    ldrsh r10, [r10, #0x30]
    mov r0, r0, lsl #16
    mov r3, r1, lsr #16
    mov r1, r0, lsr #16
    mov r0, r5
    str r12, [sp]
    bl Actor_RebuildPrimaryAttachment
    mov r1, r4
    mov r4, r0
    mov r0, r5
    bl Actor_SetAttachmentAnimation
    strb r6, [r4, #0x3a]
    strh r7, [r4, #0x36]
    strh r8, [r4, #0x32]
    strh r9, [r4, #0x34]
    mov r0, r5
    mov r1, #1
    strh r10, [r4, #0x30]
    bl Actor_SetAttachmentEnabled
    mov r0, #0
    add sp, sp, #4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
    .size GamePhaseActorScriptVm_RebuildPrimaryAttachmentPreservingDisplayState, . - GamePhaseActorScriptVm_RebuildPrimaryAttachmentPreservingDisplayState
