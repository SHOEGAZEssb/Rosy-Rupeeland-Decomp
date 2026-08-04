; Matching retail form; see src/game/game_phase_script_vm_actor_local_state_opcodes.c.
.text

    .global func_02013dfc
func_02013dfc: ; 0x02013dfc
    cmp r1, #0x0
    ldr r1, [r0, #0x14]
    bicne r1, r1, #0x200000
    orreq r1, r1, #0x200000
    str r1, [r0, #0x14]
    bx lr
    .size func_02013dfc, . - func_02013dfc

