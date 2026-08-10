; Matching retail form; see src/game/game_phase_script_vm_math_opcodes.c.
.text
.extern data_020c9670
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult

    .global func_02012d18
func_02012d18: ; 0x02012d18
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, L_02012d4c
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02012d4c: .word data_020c9670
    .size func_02012d18, . - func_02012d18

