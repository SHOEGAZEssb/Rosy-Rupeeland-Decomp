.text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern data_ov040_022038a0
    .extern data_ov040_02203e3c
    .global func_ov040_02202244
func_ov040_02202244:
    cmp r1, #0x1
    mov r2, #0x0
    bne .Lmode2
    mov r1, #0x1
    str r1, [r0, #0x854]
    str r2, [r0, #0x850]
    ldr r1, .Lbase_table
    str r2, [r0, #0x840]
    ldr r2, [r1, #0x94]
    str r2, [r0, #0x84c]
    ldr r1, [r1, #0x98]
    str r1, [r0, #0x844]
    bx lr
.Lmode2:
    cmp r1, #0x2
    bne .Lindexed
    mov r1, #0x2
    str r1, [r0, #0x854]
    str r2, [r0, #0x850]
    ldr r1, .Lbase_table
    str r2, [r0, #0x840]
    ldr r2, [r1, #0x7c]
    str r2, [r0, #0x84c]
    ldr r1, [r1, #0x80]
    str r1, [r0, #0x844]
    bx lr
.Lindexed:
    str r1, [r0, #0x854]
    str r2, [r0, #0x850]
    ldr r3, .Lpair_table
    str r2, [r0, #0x840]
    ldr r2, [r3, r1, lsl #2]
    ldr r2, [r2]
    str r2, [r0, #0x84c]
    ldr r1, [r3, r1, lsl #2]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x844]
    bx lr
.Lbase_table: .word data_ov040_022038a0
.Lpair_table: .word data_ov040_02203e3c
    .size func_ov040_02202244, .-func_ov040_02202244
