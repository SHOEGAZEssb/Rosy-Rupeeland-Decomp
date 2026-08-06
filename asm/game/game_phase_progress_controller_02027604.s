; Matching retail form; see src/game/game_phase_progress_controller.c.
.text

    .global func_02027604
    .type func_02027604, @function
func_02027604: ; 0x02027604
    mov r3, #0x0
    str r3, [r0, #0x0]
    str r3, [r0, #0x4]
    str r3, [r0, #0x10]
    str r3, [r0, #0x14]
    str r3, [r0, #0x18]
    str r3, [r0, #0x1c]
    str r3, [r0, #0x20]
    str r3, [r0, #0x24]
    str r3, [r0, #0x28]
    mov r1, #0x1
    str r1, [r0, #0x38]
    mov r2, r3
.L_02027638:
    add r1, r0, r3
    add r3, r3, #0x1
    strb r2, [r1, #0x2c]
    cmp r3, #0xb
    blt .L_02027638
    bx lr
    .size func_02027604, . - func_02027604

