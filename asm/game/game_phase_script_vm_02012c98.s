; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global func_02012c98
func_02012c98: ; 0x02012c98
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    str r0, [r4, #0x88]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02012c98, . - func_02012c98

