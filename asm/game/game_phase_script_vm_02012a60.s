; Matching retail form; see src/game/game_phase_script_vm_runtime_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_020bf1f8
.extern genrand_int32

    .global func_02012a60
func_02012a60: ; 0x02012a60
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    bl genrand_int32
    mov r1, r4
    bl func_020bf1f8
    mov r0, r5
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02012a60, . - func_02012a60

