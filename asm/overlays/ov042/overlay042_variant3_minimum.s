.text
    .global func_ov042_02209344
func_ov042_02209344:
    ldr r1, [r0, #0x78]
    cmp r1, #0x64
    movlt r1, #0x64
    strlt r1, [r0, #0x78]
    movlt r1, #0xa
    strltb r1, [r0, #0x8f]
    bx lr
    .size func_ov042_02209344, . - func_ov042_02209344
