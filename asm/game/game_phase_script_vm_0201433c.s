; Matching retail form; see src/game/game_phase_script_vm_actor_presentation_opcodes.c.
.text
.extern func_02012704
.extern Actor_SetAttachmentBaseScale

    .global GamePhaseActorScriptVm_SetAttachmentScale
GamePhaseActorScriptVm_SetAttachmentScale: ; 0x0201433c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    mov r4, r0
    mov r0, r6
    bl func_02012704
    mov r5, r0
    cmp r5, #0x20
    movlt r5, #0x20
    blt L_0201436c
    cmp r5, #0x200
    movgt r5, #0x200
L_0201436c:
    cmp r4, #0x20
    movlt r4, #0x20
    blt L_02014380
    cmp r4, #0x200
    movgt r4, #0x200
L_02014380:
    ldr r0, [r6, #0x84]
    mov r1, r5, lsl #0x4
    mov r2, r4, lsl #0x4
    bl Actor_SetAttachmentBaseScale
    ldr r1, [r6, #0x84]
    mov r0, #0x0
    ldr r1, [r1, #0x54]
    strh r5, [r1, #0x32]
    strh r4, [r1, #0x34]
    ldmia sp!, {r4, r5, r6, pc}
    .size GamePhaseActorScriptVm_SetAttachmentScale, . - GamePhaseActorScriptVm_SetAttachmentScale

