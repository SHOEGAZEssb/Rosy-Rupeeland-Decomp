.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern data_020e6adc
.extern data_020e6b74
.extern func_02030acc
.extern func_020337d4
.extern func_02072b68
.extern func_020740c8

.global func_ov083_02212b68
func_ov083_02212b68:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrsh r1, [r5, #0xda]
    cmp r1, #0x1
    bne .L_02212bbc
    ldr r4, [r5, #0x208]
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x17
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02212bbc:
    ldr r0, [r5, #0x298]
    mov r4, #0x100
    cmp r0, #0x0
    mov r1, #0x0
    beq .L_02212bdc
    ldr r0, [r0, #0x29c]
    tst r0, #0x1
    moveq r1, #0x1
.L_02212bdc:
    ldrsh r0, [r5, #0xd6]
    cmp r0, #0x16
    addls pc, pc, r0, lsl #0x2
    b .L_02213150
.L_02212bec:
    b .L_02213150
    b .L_02212eac
    b .L_02212d88
    b .L_02212d88
    b .L_02212d88
    b .L_02212ca4
    b .L_02212ca4
    b .L_02212c48
    b .L_02212d34
    b .L_02212d34
    b .L_02213150
    b .L_02213124
    b .L_02213150
    b .L_02213150
    b .L_02213150
    b .L_02213150
    b .L_02213150
    b .L_02212fa4
    b .L_02212ffc
    b .L_02213080
    b .L_02212f50
    b .L_02213150
    b .L_02212e28
.L_02212c48:
    cmp r1, #0x0
    bne .L_02212ca4
    ldr r7, [r5, #0x54]
    ldrb r0, [r7, #0x38]
    cmp r0, #0x15
    beq .L_02213150
    ldr r6, [r5, #0x208]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r2, [r6, #0xc]
    mov r1, r7
    str r2, [sp, #0x0]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x15
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02212ca4:
    cmp r1, #0x0
    beq .L_02212ce0
    ldr r6, [r5, #0x20c]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    bl func_02072b68
    b .L_02212d10
.L_02212ce0:
    ldr r6, [r5, #0x208]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    bl func_02072b68
.L_02212d10:
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02212d34:
    ldr r6, [r5, #0x208]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02212d88:
    cmp r1, #0x0
    beq .L_02212dcc
    ldr r6, [r5, #0x20c]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl func_02072b68
    b .L_02212e04
.L_02212dcc:
    ldr r6, [r5, #0x208]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl func_02072b68
.L_02212e04:
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02212e28:
    cmp r1, #0x0
    beq .L_02212e58
    ldr r6, [r5, #0x20c]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    b .L_02212e7c
.L_02212e58:
    ldr r6, [r5, #0x208]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
.L_02212e7c:
    ldr r0, [r5, #0x54]
    mov r1, #0x11
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02212eac:
    cmp r1, #0x0
    beq .L_02212ef0
    ldr r4, [r5, #0x20c]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl func_02072b68
    b .L_02212f28
.L_02212ef0:
    ldr r4, [r5, #0x208]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r4, {r2, r3}
    bl func_020740c8
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl func_02072b68
.L_02212f28:
    ldr r1, [r5, #0x54]
    mov r4, #0x0
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02212f50:
    ldr r6, [r5, #0x208]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02212fa4:
    ldrh r1, [r5, #0x4e]
    ldr r0, .L_02213168
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    beq .L_02213150
    ldr r6, [r5, #0x208]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x15
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02212ffc:
    cmp r1, #0x0
    beq .L_0221302c
    ldr r6, [r5, #0x20c]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    b .L_02213050
.L_0221302c:
    ldr r6, [r5, #0x208]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
.L_02213050:
    ldr r0, [r5, #0x54]
    mov r1, #0x10
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02213080:
    ldrh r1, [r5, #0x4e]
    ldr r0, .L_0221316c
    ldr r6, [r5, #0x208]
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    mov r0, r5
    beq .L_022130d8
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x14
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02213150
.L_022130d8:
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r6, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldmib r6, {r2, r3}
    bl func_020740c8
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    b .L_02213150
.L_02213124:
    ldr r0, [r5, #0x54]
    mov r1, #0x12
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_02213150:
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    strh r4, [r0, #0x36]
    ldr r0, [r5, #0x54]
    strh r1, [r0, #0x30]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02213168: .word data_020e6b74
.L_0221316c: .word data_020e6adc
.size func_ov083_02212b68, . - func_ov083_02212b68
