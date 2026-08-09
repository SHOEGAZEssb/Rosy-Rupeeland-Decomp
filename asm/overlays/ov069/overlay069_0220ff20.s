.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.

.global func_ov069_0220ff20
func_ov069_0220ff20:
    str r1, [r0, #0x338]
    cmp r1, #0x0
    movgt r1, #0x0
    movle r1, #0x1000
    str r1, [r0, #0x330]
    bx lr
.size func_ov069_0220ff20, . - func_ov069_0220ff20
