; Matching retail form; see src/game/game_phase_script_vm_actor_state_opcodes.c.
.text
.extern func_02012704

    .global func_02013074
func_02013074: ; 0x02013074
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r1, [r4, #0x84]
    ldr r1, [r1, #0x54]
    strh r0, [r1, #0x36]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02013074, . - func_02013074

