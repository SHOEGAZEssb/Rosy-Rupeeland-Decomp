.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_ov056_0220ec70

.global func_ov056_0220e9e0
func_ov056_0220e9e0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov056_0220ec70
    mov r1, r5, lsl #0x3
    mov r5, #0x0
    add r3, r6, r1, lsl #0x1
    mov lr, r5
.L_0220ea04:
    add r1, r5, r4, lsl #0x3
    mov r1, r1, lsl #0x5
    mov r6, lr
    add r2, r3, r1, lsl #0x1
.L_0220ea14:
    add ip, r6, r5, lsl #0x3
    add r1, r2, r6, lsl #0x1
    add ip, ip, r0, lsl #0x6
    add r6, r6, #0x1
    strh ip, [r1, #0x4]
    cmp r6, #0x8
    blt .L_0220ea14
    add r5, r5, #0x1
    cmp r5, #0x8
    blt .L_0220ea04
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov056_0220e9e0, . - func_ov056_0220e9e0
