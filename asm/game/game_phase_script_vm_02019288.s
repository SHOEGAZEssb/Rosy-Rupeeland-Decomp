; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern GamePhaseScriptVm_SetResult
.extern gGameWork
.global func_02019288
func_02019288:
    stmdb sp!, {r3, lr}
    ldr r1, L_020192a4
    ldr r1, [r1, #0x0]
    ldr r1, [r1, #0x44]
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_020192a4: .word gGameWork
.size func_02019288, . - func_02019288
