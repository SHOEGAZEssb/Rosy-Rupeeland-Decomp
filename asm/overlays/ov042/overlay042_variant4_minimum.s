.text
    .global func_ov042_02209cbc
func_ov042_02209cbc:
    ldr r1, [r0, #0x74]
    cmp r1, #0x64
    movlt r1, #0x64
    strlt r1, [r0, #0x74]
    movlt r1, #0xa
    strltb r1, [r0, #0x8b]
    bx lr
    .size func_ov042_02209cbc, . - func_ov042_02209cbc
