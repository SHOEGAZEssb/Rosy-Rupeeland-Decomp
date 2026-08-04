; Matching retail form; see src/game/game_phase_script_vm_actor_state_opcodes.c.
.text
.extern func_02012704

    .global func_02013094
func_02013094: ; 0x02013094
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r1, [r4, #0x84]
    cmp r0, #0x0
    ldr r0, [r1, #0x14]
    bicne r0, r0, #0x2
    orreq r0, r0, #0x2
    str r0, [r1, #0x14]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02013094, . - func_02013094

