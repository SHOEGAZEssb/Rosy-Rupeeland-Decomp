; Matching retail form; see src/game/game_phase_script_vm_sound_utility_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern func_02099114
.global func_0201a540
func_0201a540:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    bl func_02099114
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_0201a540, . - func_0201a540
