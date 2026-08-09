.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_02213710
func_ov081_02213710:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x208]
    str r1, [r0, #0x20c]
    mov r1, #0x0
    str r1, [r0, #0x22c]
    str r1, [r0, #0x230]
    str r3, [r0, #0x234]
    add sp, sp, #0x10
    bx lr
.size func_ov081_02213710, . - func_ov081_02213710
