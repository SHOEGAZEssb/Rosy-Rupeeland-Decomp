.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.

.global func_ov069_02211594
func_ov069_02211594:
    mov r1, #0x5a
    sub r3, r1, #0x1
    mov r2, #0x0
.L_022115a0:
    add r1, r0, r3, lsl #0x2
    ldr r1, [r1, #0x7c0]
    cmp r1, #0x0
    addne r2, r2, #0x1
    subs r3, r3, #0x1
    bpl .L_022115a0
    mov r0, r2
    bx lr
.size func_ov069_02211594, . - func_ov069_02211594
