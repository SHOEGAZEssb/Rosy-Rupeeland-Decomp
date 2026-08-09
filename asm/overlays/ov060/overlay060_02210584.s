.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.

.global func_ov060_02210584
func_ov060_02210584:
    ldr r0, [r0, #0x2c]
    cmp r0, #0x0
    movlt r0, #0x1
    movge r0, #0x0
    bx lr
.size func_ov060_02210584, . - func_ov060_02210584
