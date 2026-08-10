.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_02105310
.extern data_ov085_02214328
.extern data_ov085_02214330
.extern data_ov085_02214348
.extern data_ov085_022143d0
.extern func_0200b04c
.extern Type7MarkerPresentation_SelectAnimation
.extern Type7MarkerPresentation_ReloadResources
.extern func_020593dc
.extern func_ov085_02212d08
.extern func_ov085_02213194
.extern gSoundContext

.global func_ov085_02212ef4
func_ov085_02212ef4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0xd0]
    bic r0, r0, #0x10
    str r0, [r5, #0xd0]
    ldr r0, [r5, #0x14]
    bic r0, r0, #0x40
    str r0, [r5, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02212f8c
    ldr r0, [r5, #0x24c]
    cmp r0, #0x0
    ble .L_02212f8c
    subs r0, r0, #0x1
    str r0, [r5, #0x24c]
    bne .L_02212f8c
    ldr r1, .L_02213174
    mov r0, #0x0
    str r1, [r5, #0x44]
    ldr r2, [r5, #0x3c]
    mov r1, #0x100
    str r2, [r5, #0x8c]
    ldr r2, [r5, #0x40]
    mov r3, r5
    str r2, [r5, #0x90]
    str r0, [r5, #0x40]
    str r0, [r5, #0x3c]
    str r0, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, .L_02213178
    add r1, r1, #0x33
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl func_020593dc
.L_02212f8c:
    mov r0, r5
    bl func_ov085_02212d08
    ldr r0, [r5, #0x10]
    tst r0, #0x1000000
    bne .L_02212fc8
    ldr r0, .L_0221317c
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_02212fc8
    ldr r0, [r5, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02212fd0
.L_02212fc8:
    mov ip, #0x1
    b .L_02212fd4
.L_02212fd0:
    mov ip, #0x0
.L_02212fd4:
    ldr r0, [r5, #0x114]
    mvn r4, #0x0
    cmp r0, #0x0
    bne .L_02213110
    ldr r0, .L_02213180
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x20]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02213184
    bne .L_02213014
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02213014:
    cmp r3, #0x0
    moveq r4, #0x2
    beq .L_02213110
    cmp ip, #0x0
    bne .L_02213110
    ldr r1, .L_02213180
    mov r0, #0x1
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x0]
    mov ip, r0
    cmp r3, r1
    ldr r1, .L_02213188
    bne .L_0221305c
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0221305c:
    cmp ip, #0x0
    beq .L_0221309c
    ldr r1, .L_02213180
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0xa8]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0221318c
    bne .L_02213094
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213094:
    cmp ip, #0x0
    movne r0, #0x0
.L_0221309c:
    cmp r0, #0x0
    movne r4, #0xd
    bne .L_02213110
    ldr r0, .L_02213180
    mov r3, #0x0
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x8]
    mov ip, r3
    cmp r2, r0
    mov lr, #0x1
    ldr r0, .L_02213190
    bne .L_022130e0
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq lr, #0x0
.L_022130e0:
    cmp lr, #0x0
    ldreq r0, [r5, #0x54]
    ldreqb r0, [r0, #0x38]
    cmpeq r0, #0x1a
    moveq ip, #0x1
    cmp ip, #0x0
    beq .L_02213108
    ldr r0, [r5, #0x22c]
    cmp r0, #0x96
    movlt r3, #0x1
.L_02213108:
    cmp r3, #0x0
    movne r4, #0x4
.L_02213110:
    mvn r0, #0x0
    cmp r4, r0
    beq .L_02213150
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x4a]
    cmp r0, #0x0
    beq .L_02213134
    add r0, r5, #0x23c
    bl Type7MarkerPresentation_ReloadResources
.L_02213134:
    add r0, r5, #0x23c
    and r1, r4, #0xff
    bl Type7MarkerPresentation_SelectAnimation
    add r0, r5, #0x23c
    mov r1, #0x1
    bl func_ov085_02213194
    b .L_0221315c
.L_02213150:
    add r0, r5, #0x23c
    mov r1, #0x0
    bl func_ov085_02213194
.L_0221315c:
    add r0, r5, #0x23c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02213174: .word 0x2666
.L_02213178: .word gSoundContext
.L_0221317c: .word data_02105310
.L_02213180: .word data_ov085_02214328
.L_02213184: .word data_ov085_02214348
.L_02213188: .word data_ov085_02214328
.L_0221318c: .word data_ov085_022143d0
.L_02213190: .word data_ov085_02214330
.size func_ov085_02212ef4, . - func_ov085_02212ef4
