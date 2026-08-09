.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_02210284
func_ov059_02210284:
    mov r3, #0x0
.L_02210288:
    add r1, r0, r3, lsl #0x2
    ldr r2, [r1, #0x4]
    add r3, r3, #0x1
    ldrh r1, [r2, #0x24]
    cmp r3, #0x10
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    blt .L_02210288
    bx lr
.size func_ov059_02210284, . - func_ov059_02210284
