; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text

    .global func_02012d00
func_02012d00: ; 0x02012d00
    ldr r2, [r0, #0x84]
    mov r0, #0x0
    ldr r1, [r2, #0x14]
    orr r1, r1, #0x20
    str r1, [r2, #0x14]
    bx lr
    .size func_02012d00, . - func_02012d00

