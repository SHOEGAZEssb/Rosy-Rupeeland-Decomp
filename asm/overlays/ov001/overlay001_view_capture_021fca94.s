    .text
    .global func_ov001_021fca94
func_ov001_021fca94: ; 0x021fca94
    ldr ip, [r1, #0x1bc]
    ldr r2, [r1, #0x1cc]
    ldr r3, [ip, #0x14]
    ldr r1, [ip, #0xc]
    stmia r0, {r1, r2, r3}
    bx lr
    .size func_ov001_021fca94, .-func_ov001_021fca94
