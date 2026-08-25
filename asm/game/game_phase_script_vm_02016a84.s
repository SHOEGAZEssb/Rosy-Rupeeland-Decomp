; Matching retail form; see src/game/game_phase_script_vm_record_dispatch_opcodes.c.
.text
.extern OS_Halt
.extern GamePhaseScriptVm_Pop
.extern GraphicsMainBackground_Configure16ColorText
.extern GraphicsMainBackground_LoadResources
.extern GraphicsMainBackground_SetScroll
.extern GraphicsMainBackground_SetVisible
.extern GraphicsMainBackground_ConfigureAlphaBlend
.global GamePhaseActorScriptVm_DispatchMainBackgroundCommand
GamePhaseActorScriptVm_DispatchMainBackgroundCommand:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #8
    mov r9, r0
    bl GamePhaseScriptVm_Pop
    mov r8, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    cmp r0, #6
    addls pc, pc, r0, lsl #2
    b L_02016bb4
    b L_02016bb4
    b L_02016af8
    b L_02016b10
    b L_02016b80
    b L_02016b94
    b L_02016ba4
    b L_02016b48
L_02016af8:
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    bl GraphicsMainBackground_Configure16ColorText
    b L_02016bb4
L_02016b10:
    mov r0, r8, lsl #16
    mov r12, r0, lsr #16
    mov r1, r5, lsl #16
    mov r2, r6, lsl #16
    mov r3, r7, lsl #16
    mov r0, r4
    str r12, [sp]
    mov r4, #1
    mov r1, r1, lsr #16
    mov r2, r2, lsr #16
    mov r3, r3, lsr #16
    str r4, [sp, #4]
    bl GraphicsMainBackground_LoadResources
    b L_02016bb4
L_02016b48:
    mov r0, r8, lsl #16
    mov r12, r0, lsr #16
    mov r1, r5, lsl #16
    mov r2, r6, lsl #16
    mov r3, r7, lsl #16
    mov r0, r4
    str r12, [sp]
    mov r4, #0
    mov r1, r1, lsr #16
    mov r2, r2, lsr #16
    mov r3, r3, lsr #16
    str r4, [sp, #4]
    bl GraphicsMainBackground_LoadResources
    b L_02016bb4
L_02016b80:
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl GraphicsMainBackground_SetScroll
    b L_02016bb4
L_02016b94:
    mov r0, r4
    mov r1, r5
    bl GraphicsMainBackground_SetVisible
    b L_02016bb4
L_02016ba4:
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl GraphicsMainBackground_ConfigureAlphaBlend
L_02016bb4:
    mov r0, #0
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size GamePhaseActorScriptVm_DispatchMainBackgroundCommand, . - GamePhaseActorScriptVm_DispatchMainBackgroundCommand
