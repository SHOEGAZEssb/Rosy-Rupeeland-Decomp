; Matching retail form; see src/game/game_phase_progress_controller.c.
.text

    .global func_02027bd4
    .type func_02027bd4, @function
func_02027bd4: ; 0x02027bd4
    mov r3, #0x0
    str r3, [r1, #0x0]
    ldr r0, [r1, #0xc]
    bic r0, r0, #0x1
    bic r2, r0, #0x2
    bic r0, r2, #0x1c
    bic r0, r0, #0xe0
    str r0, [r1, #0xc]
    str r3, [r1, #0x4]
    str r3, [r1, #0x8]
    ldr r0, [r1, #0xc]
    bic r2, r0, #0xf00
    bic r0, r2, #0xf000
    bic r0, r0, #0x1f0000
    str r0, [r1, #0xc]
    str r3, [r1, #0x10]
    mov r2, r3
.L_02027c18:
    add r0, r1, r3
    add r3, r3, #0x1
    strb r2, [r0, #0x14]
    cmp r3, #0xb
    blt .L_02027c18
    strb r2, [r1, #0x1f]
    bx lr
    .size func_02027bd4, . - func_02027bd4

