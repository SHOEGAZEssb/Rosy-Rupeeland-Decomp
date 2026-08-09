.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_ov056_0220f298
.extern func_ov056_0220f2c8

.global func_ov056_0220f200
func_ov056_0220f200:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    ldr r8, [sp, #0x30]
    mov r10, r0
    str r1, [sp, #0x4]
    mov r9, r2
    add r4, r3, r3, lsr #0x1f
    mov r5, #0x0
.L_0220f220:
    mov r6, #0x0
.L_0220f224:
    mov r7, r6, lsl #0x1
    mov r0, r10
    mov r1, r9
    mov r3, r5
    add r2, r7, #0x1
    bl func_ov056_0220f2c8
    mov r11, r0
    mov r2, r7
    mov r0, r10
    mov r1, r9
    mov r3, r5
    bl func_ov056_0220f2c8
    orr r0, r0, r11, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x0]
    ldr r1, [sp, #0x4]
    mov r0, r10
    add r2, r6, r4, asr #0x1
    add r3, r8, r5
    bl func_ov056_0220f298
    add r6, r6, #0x1
    cmp r6, #0x20
    blt .L_0220f224
    add r5, r5, #0x1
    cmp r5, #0x40
    blt .L_0220f220
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov056_0220f200, . - func_ov056_0220f200
