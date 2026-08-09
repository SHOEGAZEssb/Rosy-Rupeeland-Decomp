.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02215188
func_ov075_02215188:
    ldr r1, [r0, #0x298]
    cmp r1, #0x0
    addne r1, r1, #0x200
    movne r2, #0x0
    strneh r2, [r1, #0xa4]
    strneh r2, [r1, #0xa6]
    ldr r1, [r0, #0x2a4]
    cmp r1, #0x0
    ldr r1, [r0, #0x260]
    orrne r1, r1, #0x20
    biceq r1, r1, #0x20
    str r1, [r0, #0x260]
    bx lr
.size func_ov075_02215188, . - func_ov075_02215188
