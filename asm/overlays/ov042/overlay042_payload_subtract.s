.text
    .global func_ov042_02209944
func_ov042_02209944:
    ldr r3, [r0, #0x4]
    ldr r2, [r1, #0x4]
    sub r2, r3, r2
    str r2, [r0, #0x4]
    ldr r2, [r0, #0x8]
    ldr r1, [r1, #0x8]
    sub r1, r2, r1
    str r1, [r0, #0x8]
    bx lr
    .size func_ov042_02209944, . - func_ov042_02209944
