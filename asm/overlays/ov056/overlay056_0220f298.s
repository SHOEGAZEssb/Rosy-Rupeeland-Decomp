.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.

.global func_ov056_0220f298
func_ov056_0220f298:
    cmp r2, #0x0
    bxlt lr
    cmp r2, #0x80
    bxge lr
    cmp r3, #0x0
    bxlt lr
    cmp r3, #0x100
    ldrlth ip, [sp, #0x0]
    movlt r2, r2, lsl #0x1
    addlt r0, r1, r3, lsl #0x8
    strlth ip, [r2, r0]
    bx lr
.size func_ov056_0220f298, . - func_ov056_0220f298
