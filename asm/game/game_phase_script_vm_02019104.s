; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern data_021e9e00
.extern GamePhaseScriptVm_Pop
.extern func_0206f914
.global func_02019104
func_02019104:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    ldr r0, L_02019124
    mov r1, r1, lsr #0x10
    bl func_0206f914
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02019124: .word data_021e9e00
.size func_02019104, . - func_02019104
