; Matching retail form; see src/game/game_phase_script_vm_misc_runtime_opcodes.c.
.text
.extern data_021f5f18
.extern GamePhaseScriptVm_Pop
.extern func_02098020
.global func_02019f4c
func_02019f4c:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, L_02019f68
    bl func_02098020
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02019f68: .word data_021f5f18
.size func_02019f4c, . - func_02019f4c
