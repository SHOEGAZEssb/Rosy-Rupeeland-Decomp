; Matching retail form; see src/game/extended_callback_state.c.
.text
.global func_020215a4
    .type func_020215a4, @function
func_020215a4:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x8]
    str r1, [r0, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    add sp, sp, #0x10
    bx lr
    .size func_020215a4, .-func_020215a4
