; Matching retail form; see src/game/game_phase_script_vm_utility_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_020be328
.global func_02015e40
func_02015e40:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    bl func_020be328
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0
    ldmia sp!, {r4, pc}
    .size func_02015e40, . - func_02015e40
