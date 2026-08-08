.text
    .global func_ov042_0220ab98
func_ov042_0220ab98:
    add ip, r0, r1, lsl #0x2
    ldr r3, [ip, #0x4c]
    ldrh r2, [r3, #0x42]
    tst r2, #0x4
    orreq r2, r2, #0x4
    streqh r2, [r3, #0x42]
    ldreq r2, [r0, #0x18c]
    streq r2, [ip, #0xec]
    streq r1, [r0, #0x18c]
    bx lr
    .size func_ov042_0220ab98, . - func_ov042_0220ab98
