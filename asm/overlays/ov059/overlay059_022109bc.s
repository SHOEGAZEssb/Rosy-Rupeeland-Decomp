.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_022109bc
func_ov059_022109bc:
    ldrsh ip, [r0, #0x0]
    mov r3, #0x0
    b .L_022109e0
.L_022109c8:
    add r2, r0, r3, lsl #0x1
    ldrsh r2, [r2, #0x8]
    cmp r1, r2
    moveq r0, r3
    bxeq lr
    add r3, r3, #0x1
.L_022109e0:
    cmp r3, ip
    blt .L_022109c8
    mvn r0, #0x0
    bx lr
.size func_ov059_022109bc, . - func_ov059_022109bc
