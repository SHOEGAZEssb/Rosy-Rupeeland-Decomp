.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_022179e0
func_ov088_022179e0:
    str r1, [r0, #0x0]
    ldr r1, [sp, #0x0]
    stmib r0, {r2, r3}
    str r1, [r0, #0xc]
    bx lr
.size func_ov088_022179e0, . - func_ov088_022179e0
