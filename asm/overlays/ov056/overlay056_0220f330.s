.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.

.global func_ov056_0220f330
func_ov056_0220f330:
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
.size func_ov056_0220f330, . - func_ov056_0220f330
