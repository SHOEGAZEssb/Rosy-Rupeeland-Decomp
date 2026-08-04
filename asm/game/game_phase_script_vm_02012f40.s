; Matching retail form; see src/game/game_phase_script_vm_actor_state_opcodes.c.
.text
.extern func_020127f8

    .global func_02012f40
func_02012f40: ; 0x02012f40
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x84]
    ldr r1, [r1, #0x10]
    tst r1, #0x1
    movne r1, #0x1
    moveq r1, #0x0
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_02012f40, . - func_02012f40

