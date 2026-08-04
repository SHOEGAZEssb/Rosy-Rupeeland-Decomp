; Matching retail form; see src/game/game_phase_script_vm_effect_state_opcodes.c.
.text
.extern func_02012704

    .global func_02013ed8
func_02013ed8: ; 0x02013ed8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    strb r0, [r4, #0x90]
    ldr r1, [r4, #0x8c]
    mov r0, #0x0
    orr r1, r1, #0x2
    str r1, [r4, #0x8c]
    ldmia sp!, {r4, pc}
    .size func_02013ed8, . - func_02013ed8

