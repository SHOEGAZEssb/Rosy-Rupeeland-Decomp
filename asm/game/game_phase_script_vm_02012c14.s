; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text
.extern func_02012704
.extern func_02034be4

    .global func_02012c14
func_02012c14: ; 0x02012c14
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    mov r1, r0
    ldr r0, [r4, #0x84]
    bl func_02034be4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02012c14, . - func_02012c14

