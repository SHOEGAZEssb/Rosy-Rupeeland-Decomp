    .text
    .global func_ov000_021fcb4c
func_ov000_021fcb4c:
    ldr r12, [r1, #0x26c]
    ldr r2, [r1, #0x27c]
    ldr r3, [r12, #0x14]
    ldr r1, [r12, #0xc]
    stmia r0, {r1, r2, r3}
    bx lr
    .size func_ov000_021fcb4c, .-func_ov000_021fcb4c
