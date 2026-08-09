.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.

.global func_ov071_022119f4
func_ov071_022119f4:
    add r3, r0, r1, lsl #0x2
    mvn r2, #0x0
    str r2, [r3, #0x964]
    ldr r2, [r0, #0xc34]
    str r2, [r3, #0xb44]
    str r1, [r0, #0xc34]
    bx lr
.size func_ov071_022119f4, . - func_ov071_022119f4
