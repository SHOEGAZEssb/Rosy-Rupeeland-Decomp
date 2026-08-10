.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern data_020e6f94
.extern data_ov084_022145d4
.extern data_ov084_022145e4
.extern data_ov084_022145ec
.extern Actor_SaveAndForceFlags
.extern func_020349b8
.extern ActorExtendedType2_UpdateFrame
.extern func_020435f4
.extern func_02045184

.global func_ov084_02213f38
func_ov084_02213f38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x260]
    mov r4, #0x0
    tst r0, #0x2
    beq .L_02213f84
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02213f88
.L_02213f84:
    mov r0, #0x0
.L_02213f88:
    cmp r0, #0x0
    beq .L_02213fc8
    ldr r0, .L_022140d8
    ldr r2, [r5, #0x218]
    ldr r0, [r0, #0x10]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022140dc
    bne .L_02213fc0
    ldr r1, [r5, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02213fc0:
    cmp r3, #0x0
    moveq r4, #0x1
.L_02213fc8:
    cmp r4, #0x0
    beq .L_022140cc
    mov r0, r5
    bl func_020435f4
    add r1, r5, #0x200
    ldrsh r2, [r1, #0x98]
    cmp r2, r0
    addlt r0, r2, #0x1
    strlth r0, [r1, #0x98]
    blt .L_022140cc
    ldr r0, .L_022140d8
    ldr r2, [r5, #0x218]
    ldr r0, [r0, #0x18]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022140e0
    bne .L_02214020
    ldr r1, [r5, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02214020:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_022140cc
    add r1, r5, #0x200
    ldrh r3, [r1, #0x9a]
    mov r2, #0x0
    mov r0, r5
    bic r3, r3, #0x1
    orr r3, r3, #0x1
    strh r3, [r1, #0x9a]
    ldr r3, [r5, #0xd0]
    bic r3, r3, #0x200
    str r3, [r5, #0xd0]
    strh r2, [r1, #0x4e]
    bl Actor_SaveAndForceFlags
    ldr r0, [r5, #0x274]
    cmp r0, #0x0
    beq .L_02214078
    mov r1, r5
    bl func_02045184
.L_02214078:
    ldr r0, .L_022140d8
    ldr r1, .L_022140e4
    ldr r2, [r0, #0x8]
    ldr r0, [r0, #0xc]
    str r2, [r5, #0x218]
    str r0, [r5, #0x21c]
    ldrh r0, [r5, #0x4e]
    mov r0, r0, lsl #0x1
    ldrh r1, [r1, r0]
    cmp r1, #0x0
    beq .L_022140b0
    mov r0, r5
    mov r2, #0x0
    bl func_020349b8
.L_022140b0:
    ldr r1, [r5, #0x260]
    add r0, r5, #0x200
    bic r1, r1, #0x3
    orr r1, r1, #0x4000
    str r1, [r5, #0x260]
    mov r1, #0x0
    strh r1, [r0, #0x98]
.L_022140cc:
    mov r0, r5
    bl ActorExtendedType2_UpdateFrame
    ldmia sp!, {r3, r4, r5, pc}
.L_022140d8: .word data_ov084_022145d4
.L_022140dc: .word data_ov084_022145e4
.L_022140e0: .word data_ov084_022145ec
.L_022140e4: .word data_020e6f94
.size func_ov084_02213f38, . - func_ov084_02213f38
