; Matching retail form; see src/game/game_phase_script_vm_actor_action_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global func_02013ea0
func_02013ea0: ; 0x02013ea0
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_02013ea0, . - func_02013ea0

