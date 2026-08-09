.text
; Matching fallback for the portable implementation in src/overlays/ov048/overlay048_display_recovery.c.

.global func_ov048_0220ba54
func_ov048_0220ba54:
    mov r1, r1, lsl #0x1d
    orr r1, r1, #0x80000000
    orr r1, r1, r3, lsl #0x19
    orr r1, r1, r2, lsl #0x18
    ldr r2, [sp, #0x0]
    orr r0, r1, r0, lsl #0x14
    ldr r1, [sp, #0x8]
    orr r0, r0, r2, lsl #0x10
    ldr r2, [sp, #0x4]
    orr r1, r0, r1, lsl #0x8
    ldr r0, .L_0220ba8c
    orr r1, r2, r1
    str r1, [r0, #0x0]
    bx lr
.L_0220ba8c: .word 0x4000064
.size func_ov048_0220ba54, . - func_ov048_0220ba54
