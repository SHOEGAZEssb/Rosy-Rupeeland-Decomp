; Matching retail form; see src/game/game_phase_script_vm_record_dispatch_opcodes.c.
.text
.extern OS_Halt
.extern GamePhaseScriptVm_Pop
.extern GraphicsSubBackground_Configure256ColorText
.extern GraphicsSubBackground_Configure16ColorText
.extern GraphicsSubBackground_SetScroll
.extern GraphicsSubBackground_SetVisible
.extern GraphicsSubBackground_LoadResources
.extern GraphicsSubBackground_ConfigureAlphaBlend
.global func_02016930
func_02016930:
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
    b L_02016a78
    b L_020169a4
    b L_020169bc
    b L_020169d4
    b L_02016a44
    b L_02016a58
    b L_02016a68
    b L_02016a0c
L_020169a4:
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    bl GraphicsSubBackground_Configure256ColorText
    b L_02016a78
L_020169bc:
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    bl GraphicsSubBackground_Configure16ColorText
    b L_02016a78
L_020169d4:
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
    bl GraphicsSubBackground_LoadResources
    b L_02016a78
L_02016a0c:
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
    bl GraphicsSubBackground_LoadResources
    b L_02016a78
L_02016a44:
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl GraphicsSubBackground_SetScroll
    b L_02016a78
L_02016a58:
    mov r0, r4
    mov r1, r5
    bl GraphicsSubBackground_SetVisible
    b L_02016a78
L_02016a68:
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl GraphicsSubBackground_ConfigureAlphaBlend
L_02016a78:
    mov r0, #0
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_02016930, . - func_02016930
