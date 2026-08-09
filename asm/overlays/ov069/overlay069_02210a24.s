.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.

.global func_ov069_02210a24
func_ov069_02210a24:
    mov r1, #0x5a
    sub r3, r1, #0x1
    mov r2, #0x0
.L_02210a30:
    add r1, r0, r3, lsl #0x2
    str r2, [r1, #0x7c0]
    subs r3, r3, #0x1
    bpl .L_02210a30
    bx lr
.size func_ov069_02210a24, . - func_ov069_02210a24
