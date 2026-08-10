; Matching retail form; see src/game/game_phase_script_vm_packed_runtime_query_opcode.c.
.text
.extern data_021052fc
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.global func_02016bc0
func_02016bc0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #8
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    ldr r1, L_02016c78
    mov r5, r0
    ldr r0, [r1]
    mov r1, r6
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r2, r7
    ldr r3, [r0]
    ldr r3, [r3, #0x2c]
    blx r3
    str r0, [sp]
    str r0, [sp, #4]
    cmp r5, #0
    beq L_02016c34
    cmp r5, #1
    beq L_02016c48
    cmp r5, #2
    beq L_02016c5c
    b L_02016c6c
L_02016c34:
    mov r1, r0, lsl #27
    mov r0, r4
    mov r1, r1, asr #27
    bl GamePhaseScriptVm_SetResult
    b L_02016c6c
L_02016c48:
    mov r1, r0, lsl #22
    mov r0, r4
    mov r1, r1, lsr #27
    bl GamePhaseScriptVm_SetResult
    b L_02016c6c
L_02016c5c:
    mov r1, r0, lsl #18
    mov r0, r4
    mov r1, r1, lsr #28
    bl GamePhaseScriptVm_SetResult
L_02016c6c:
    mov r0, #0
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_02016c78: .word data_021052fc
    .size func_02016bc0, . - func_02016bc0
