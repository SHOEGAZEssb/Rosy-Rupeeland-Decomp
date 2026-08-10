.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern data_ov092_0221c2d6
.extern func_02004fe0
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern func_02059278
.extern func_0205929c
.extern func_02059344
.extern func_02072b68
.extern func_020befec
.extern func_ov092_022177e0
.extern func_ov092_02217810
.extern func_ov092_02217834
.extern func_ov092_02218380
.extern func_ov092_02218394
.extern func_ov092_02218528
.extern func_ov092_022191f4
.extern gGameWork
.extern gSoundContext
.extern gSystemState

.global func_ov092_022192c8
func_ov092_022192c8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x74
    mov r6, r0
    add r1, r6, #0x200
    ldrsh r0, [r1, #0x9c]
    ldr r4, [r6, #0x254]
    cmp r0, #0x32
    ldr r5, [r4, #0x54]
    bgt .L_02219310
    cmp r0, #0x32
    bge .L_02219598
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_022196b4
.L_02219300:
    b .L_02219328
    b .L_02219364
    b .L_022193d0
    b .L_02219574
.L_02219310:
    cmp r0, #0x33
    bgt .L_02219320
    beq .L_022195c0
    b .L_022196b4
.L_02219320:
    cmp r0, #0x63
    b .L_022196b4
.L_02219328:
    ldrh r0, [r5, #0x24]
    orr r0, r0, #0x10
    strh r0, [r5, #0x24]
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldrsb r0, [r1, #0xa1]
    cmp r0, #0x0
    beq .L_022196b4
    ldr r0, .L_022196bc
    ldrh r0, [r0, #0x4]
    tst r0, #0x400
    movne r0, #0x1
    strneh r0, [r1, #0x9c]
    b .L_022196b4
.L_02219364:
    mov r3, #0x0
    ldr r1, .L_022196c0
    str r3, [sp, #0x0]
    add r0, r6, #0x258
    mov r2, #0x26
    bl func_ov092_022177e0
    ldrh r2, [r5, #0x24]
    mov r0, r5
    mov r1, #0x0
    bic r2, r2, #0x11
    strh r2, [r5, #0x24]
    ldrh r2, [r5, #0x24]
    orr r2, r2, #0x2
    strh r2, [r5, #0x24]
    bl func_02072b68
    ldr r1, [r4, #0x14]
    mov r0, #0x0
    bic r1, r1, #0x2
    bic r1, r1, #0x4
    str r1, [r4, #0x14]
    ldr r1, [r6, #0x254]
    str r0, [r1, #0x104]
    str r0, [r1, #0x10c]
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x9c]
    add r1, r1, #0x1
    strh r1, [r0, #0x9c]
.L_022193d0:
    add r0, r6, #0x258
    add r1, r4, #0x18
    bl func_ov092_02217810
    ldr r1, [r4, #0x1c]
    mov r0, #0x18000
    str r1, [r4, #0x2c]
    ldr r1, [r4, #0x20]
    str r1, [r4, #0x30]
    str r0, [r4, #0x24]
    str r0, [r4, #0x34]
    ldrb r0, [r6, #0x263]
    cmp r0, #0x0
    beq .L_02219440
    ldrh r1, [r5, #0x24]
    add r0, r6, #0x200
    mov r2, #0x63
    orr r1, r1, #0x10
    strh r1, [r5, #0x24]
    ldr r3, [r4, #0x14]
    ldr r1, .L_022196c4
    orr r3, r3, #0x6
    str r3, [r4, #0x14]
    strh r2, [r0, #0x9c]
    ldr r0, [r1, #0x0]
    mov r1, #0x94
    mov r2, #0x0
    bl func_0205929c
    b .L_022196b4
.L_02219440:
    ldr r0, [r6, #0x254]
    ldr r0, [r0, #0x10c]
    cmp r0, #0x0
    beq .L_022194fc
    add r1, r6, #0x200
    mov r2, #0x3
    strh r2, [r1, #0x9c]
    mov r0, r5
    mov r1, #0x2
    bl func_02072b68
    ldrh r2, [r5, #0x24]
    ldr r0, .L_022196c8
    mov r1, #0x0
    bic r2, r2, #0x3
    strh r2, [r5, #0x24]
    ldr r3, [r4, #0x14]
    mov r2, #0x2
    orr r3, r3, #0x6
    str r3, [r4, #0x14]
    ldr r0, [r0, #0x0]
    bl func_ov092_02218380
    ldr r1, .L_022196c8
    add r3, r0, #0x32
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x2
    bl func_ov092_02218394
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x84]
    mov r2, #0x0
    sub r1, r1, #0x4b0
    strh r1, [r0, #0x84]
    ldrsh r1, [r0, #0x84]
    cmp r1, #0x0
    movlt r1, #0x0
    strlth r1, [r0, #0x84]
    ldr r0, .L_022196c4
    mov r1, #0x94
    ldr r0, [r0, #0x0]
    bl func_0205929c
    ldr r2, [r4, #0x1c]
    ldr r1, .L_022196cc
    mov r0, r6
    mov r2, r2, asr #0xc
    mov r3, #0x64
    bl func_ov092_02218528
    b .L_022196b4
.L_022194fc:
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x58]
    cmp r0, #0x1
    bne .L_0221953c
    ldr r0, .L_022196c4
    mov r1, #0x94
    ldr r0, [r0, #0x0]
    bl func_02059344
    cmp r0, #0x0
    bne .L_022196b4
    ldr r0, .L_022196c4
    mov r1, #0x94
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    b .L_022196b4
.L_0221953c:
    cmp r0, #0x24
    blt .L_022196b4
    ldr r0, .L_022196c4
    mov r1, #0x94
    ldr r0, [r0, #0x0]
    bl func_02059344
    cmp r0, #0x0
    beq .L_022196b4
    ldr r0, .L_022196c4
    mov r1, #0x94
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    b .L_022196b4
.L_02219574:
    ldrh r2, [r5, #0x24]
    and r0, r2, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    orrne r0, r2, #0x10
    strneh r0, [r5, #0x24]
    movne r0, #0x63
    strneh r0, [r1, #0x9c]
    b .L_022196b4
.L_02219598:
    ldr r0, .L_022196c4
    mov r1, #0x94
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    add r0, r6, #0x200
    mov r1, #0x33
    strh r1, [r0, #0x9c]
    mov r1, #0x0
    strh r1, [r0, #0x9e]
.L_022195c0:
    add r0, sp, #0x64
    bl func_02004fe0
    add r0, sp, #0x54
    mov r1, #0x180000
    mov r2, #0xa0000
    mov r3, #0x10000
    bl func_0200500c
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x9e]
    mov r1, #0x3c
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r5, r0
    add r0, sp, #0x44
    mov r1, #0x180000
    mov r2, #0x44000
    mov r3, #0x10000
    bl func_0200500c
    add r0, r6, #0x258
    add r1, sp, #0x64
    bl func_ov092_02217834
    mov r0, #0x18000
    str r0, [sp, #0x70]
    add r0, sp, #0x14
    add r1, sp, #0x64
    add r2, sp, #0x44
    add r3, sp, #0x54
    bl func_ov092_022191f4
    mov r2, r5
    add r0, sp, #0x4
    add r1, sp, #0x14
    bl VecFx32Bezier_Evaluate3D
    add r0, r4, #0x18
    add r1, sp, #0x4
    bl func_020050a4
    mov r1, r0
    add r0, r4, #0x28
    bl func_020050a4
    add r0, sp, #0x4
    bl func_02005058
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x9e]
    add r1, r1, #0x1
    strh r1, [r0, #0x9e]
    ldrsh r1, [r0, #0x9e]
    cmp r1, #0x3c
    blt .L_02219694
    mov r1, #0x63
    strh r1, [r0, #0x9c]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
.L_02219694:
    add r0, sp, #0x14
    bl VecFx32Triple_Destroy
    add r0, sp, #0x44
    bl func_02005058
    add r0, sp, #0x54
    bl func_02005058
    add r0, sp, #0x64
    bl func_02005058
.L_022196b4:
    add sp, sp, #0x74
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_022196bc: .word gSystemState
.L_022196c0: .word data_ov092_0221c2d6
.L_022196c4: .word gSoundContext
.L_022196c8: .word gGameWork
.L_022196cc: .word 0xb98a
.size func_ov092_022192c8, . - func_ov092_022192c8
