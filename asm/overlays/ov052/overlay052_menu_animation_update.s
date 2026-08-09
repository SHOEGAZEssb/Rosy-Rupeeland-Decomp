.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern data_ov052_0220e240
.extern func_02092e9c
.extern func_02093360
.extern func_02093998
.extern func_020939c8
.extern func_020939d8

.global func_ov052_0220e064
func_ov052_0220e064:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    movs r6, r1
    mov r5, r0
    mov r4, r2
    beq .L_0220e114
    ldrsh r0, [r5, #0x4]
    cmp r0, #0x2
    bne .L_0220e094
    ldr r0, [r5, #0x10]
    bl func_02093998
    b .L_0220e0a4
.L_0220e094:
    cmp r0, #0x1
    cmpne r0, #0x3
    moveq r0, #0x2
    streqh r0, [r5, #0x4]
.L_0220e0a4:
    ldr r0, [r5, #0x10]
    bl func_020939d8
    ldr r0, [r5, #0x10]
    mov r1, r6
    mov r2, #0x0
    bl func_02092e9c
    ldr r0, [r5, #0x10]
    ldr r1, .L_0220e148
    bl func_02093360
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    ldrne r0, [r5, #0x10]
    ldrne r0, [r0, #0xe8]
    moveq r0, #0x0
    str r0, [r5, #0x28]
    cmp r4, #0x0
    beq .L_0220e0f8
    ldr r0, [r5, #0x10]
    bl func_020939c8
.L_0220e0f8:
    mov r0, #0x10000
    ldr r1, [r5, #0x8]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x1
    str r0, [r5, #0x8]
    b .L_0220e140
.L_0220e114:
    ldr r0, [r5, #0x10]
    bl func_02093998
    ldrsh r0, [r5, #0x4]
    cmp r0, #0x2
    moveq r0, #0x1
    streqh r0, [r5, #0x4]
    mov r0, #0x10000
    ldr r1, [r5, #0x8]
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r0, [r5, #0x8]
.L_0220e140:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_0220e148: .word data_ov052_0220e240
.size func_ov052_0220e064, . - func_ov052_0220e064
