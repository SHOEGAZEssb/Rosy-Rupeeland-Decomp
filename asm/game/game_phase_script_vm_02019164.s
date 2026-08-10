; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern data_02105300
.extern GamePhaseTouchPrompt_SetEnabled
.extern GamePhaseScriptVm_Pop
.global func_02019164
func_02019164:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    ldr r2, L_02019188
    mov r1, r0
    ldr r0, [r2, #0x0]
    ldr r0, [r0, #0x8]
    bl GamePhaseTouchPrompt_SetEnabled
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02019188: .word data_02105300
.size func_02019164, . - func_02019164
