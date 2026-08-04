; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text

    .global func_02012cb0
func_02012cb0: ; 0x02012cb0
    ldr r1, [r0, #0x88]
    subs r1, r1, #0x1
    str r1, [r0, #0x88]
    movmi r0, #0x0
    ldrpl r1, [r0, #0x4]
    subpl r1, r1, #0x2
    strpl r1, [r0, #0x4]
    movpl r0, #0x1
    bx lr
    .size func_02012cb0, . - func_02012cb0

