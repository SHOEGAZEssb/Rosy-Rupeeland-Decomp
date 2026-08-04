; Matching retail form; see src/game/game_phase_script_vm_actor_action_opcodes.c.
.text
.extern func_02012704

    .global func_02013ea0
func_02013ea0: ; 0x02013ea0
    stmdb sp!, {r3, lr}
    bl func_02012704
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_02013ea0, . - func_02013ea0

