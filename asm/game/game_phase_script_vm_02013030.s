; Matching retail form; see src/game/game_phase_script_vm_actor_state_opcodes.c.
.text

    .global func_02013030
func_02013030: ; 0x02013030
    ldr r1, [r0, #0x84]
    ldr r2, [r1, #0x54]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x84]
    ldr r1, [r1, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    movne r0, #0x0
    ldreq r1, [r0, #0x4]
    subeq r1, r1, #0x2
    streq r1, [r0, #0x4]
    moveq r0, #0x1
    bx lr
    .size func_02013030, . - func_02013030

