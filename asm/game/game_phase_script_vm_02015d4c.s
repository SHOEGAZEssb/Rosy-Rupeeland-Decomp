; Matching retail form; see src/game/game_phase_script_vm_utility_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_020adc40
.global func_02015d4c
func_02015d4c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r9, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r8, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    sub r3, r8, r5
    sub r2, r9, r6
    mul r1, r3, r3
    sub r3, r7, r0
    mla r0, r3, r3, r1
    mla r0, r2, r2, r0
    bl func_020adc40
    mov r1, r0
    mov r0, r4
    mov r1, r1, asr #6
    bl GamePhaseScriptVm_SetResult
    mov r0, #0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_02015d4c, . - func_02015d4c
