.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_022119e4
func_ov059_022119e4:
    ldr r0, [r0, #0x50]
    mov r2, r1, lsl #0x7
    sub r0, r0, #0x2d
    cmp r0, r1, lsl #0x7
    bgt .L_02211a0c
    add r1, r2, #0x80
    add r0, r0, #0xc0
    cmp r1, r0
    movlt r0, #0x1
    bxlt lr
.L_02211a0c:
    mov r0, #0x0
    bx lr
.size func_ov059_022119e4, . - func_ov059_022119e4
