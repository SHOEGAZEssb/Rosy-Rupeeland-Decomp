    .text
    .extern DebugText_Printf
    .extern data_020f4e14
    .extern data_ov009_021fead0
    .extern data_ov009_021feaf0
    .extern data_ov009_021feb80
    .extern data_ov009_021febc0
    .extern data_ov009_021feedc
    .extern data_ov009_021feee4
    .extern data_ov009_021feef0
    .extern data_ov009_021feef8
    .extern data_ov009_021feefc
    .extern data_ov009_021fef00
    .extern data_ov009_021fef04
    .extern data_ov009_021fef10
    .extern data_ov009_021fef1c
    .extern data_ov009_021fef28
    .extern data_ov009_021fef34
    .extern data_ov009_021fef3c
    .extern data_ov009_021fef44
    .extern data_ov009_021fef50
    .extern data_ov009_021fef5c
    .extern data_ov009_021fef6c
    .extern data_ov009_021fef84
    .extern data_ov009_021fef98
    .extern data_ov009_021fefb4
    .extern func_0207043c
    .extern func_02070958
    .extern func_02070a78
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern GraphicsSpriteState_SetFrameIndex
    .extern GraphicsSpriteState_ResetFrame
    .extern func_02073aa8
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern func_02074dc8
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern GraphicsSpriteRenderer_Printf
    .extern GraphicsSpriteCanvas_DrawRect
    .extern func_ov009_021fce74
    .extern func_ov009_021fd294
    .extern func_ov009_021fd338
    .extern func_ov009_021fd360
    .extern func_ov009_021fd414
    .extern func_ov009_021fd458
    .extern gDebugFont

/* Exact fallback; see documented portable reconstruction and control map in
 * src/overlays/ov009/overlay009_debug_viewer_update.c. */
    .global func_ov009_021fd4e8
func_ov009_021fd4e8: ; 0x021fd4e8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xd0
    mov r9, r0
    ldr r1, [r9, #0x50]
    ldrh r1, [r1, #0x2]
    tst r1, #0x8
    beq L_021fd508
    bl func_ov009_021fd294
L_021fd508:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x200
    beq L_021fd530
    ldr r0, [r9, #0xec]
    add r0, r0, #0x1
    str r0, [r9, #0xec]
    cmp r0, #0x3
    movge r0, #0x0
    strge r0, [r9, #0xec]
L_021fd530:
    ldr r0, [r9, #0xec]
    mov r1, #0x4000000
    cmp r0, #0x0
    ldreq r0, [r1, #0x0]
    biceq r0, r0, #0x1f00
    orreq r0, r0, #0x1800
    streq r0, [r1, #0x0]
    beq L_021fd574
    cmp r0, #0x1
    ldreq r0, [r1, #0x0]
    biceq r0, r0, #0x1f00
    orreq r0, r0, #0x1400
    streq r0, [r1, #0x0]
    ldrne r0, [r1, #0x0]
    bicne r0, r0, #0x1f00
    orrne r0, r0, #0x1000
    strne r0, [r1, #0x0]
L_021fd574:
    ldr r1, [r9, #0x50]
    ldrh r0, [r1, #0x0]
    tst r0, #0x100
    beq L_021fd610
    tst r0, #0x20
    beq L_021fd5a4
    ldr r0, [r9, #0xf0]
    subs r0, r0, #0x1
    str r0, [r9, #0xf0]
    movmi r0, #0x0
    strmi r0, [r9, #0xf0]
    b L_021fd5c4
L_021fd5a4:
    tst r0, #0x10
    beq L_021fd5c4
    ldr r0, [r9, #0xf0]
    add r0, r0, #0x1
    str r0, [r9, #0xf0]
    cmp r0, #0x100
    movge r0, #0xff
    strge r0, [r9, #0xf0]
L_021fd5c4:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021fd5ec
    ldr r0, [r9, #0xf4]
    subs r0, r0, #0x1
    str r0, [r9, #0xf4]
    movmi r0, #0x0
    strmi r0, [r9, #0xf4]
    b L_021fdd84
L_021fd5ec:
    tst r0, #0x80
    beq L_021fdd84
    ldr r0, [r9, #0xf4]
    add r0, r0, #0x1
    str r0, [r9, #0xf4]
    cmp r0, #0xc0
    movge r0, #0xbf
    strge r0, [r9, #0xf4]
    b L_021fdd84
L_021fd610:
    ldr r0, [r9, #0x11c]
    cmp r0, #0x0
    bne L_021fda8c
    ldrh r0, [r1, #0x6]
    tst r0, #0x40
    beq L_021fd640
    ldr r0, [r9, #0xe0]
    subs r0, r0, #0x1
    str r0, [r9, #0xe0]
    movmi r0, #0xe
    strmi r0, [r9, #0xe0]
    b L_021fd660
L_021fd640:
    tst r0, #0x80
    beq L_021fd660
    ldr r0, [r9, #0xe0]
    add r0, r0, #0x1
    str r0, [r9, #0xe0]
    cmp r0, #0xf
    movge r0, #0x0
    strge r0, [r9, #0xe0]
L_021fd660:
    ldr r0, [r9, #0x10c]
    cmp r0, #0x0
    bne L_021fd688
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x2]
    tst r0, #0x1
    ldrne r0, [r9, #0x88]
    cmpne r0, #0x0
    beq L_021fd688
    bl GraphicsSpriteState_ResetFrame
L_021fd688:
    ldr r0, [r9, #0xe0]
    cmp r0, #0xe
    addls pc, pc, r0, lsl #0x2
    b L_021fdd84
L_021fd698: ; jump table
    b L_021fd6d4 ; case 0
    b L_021fd718 ; case 1
    b L_021fd7e0 ; case 2
    b L_021fd83c ; case 3
    b L_021fd8ac ; case 4
    b L_021fd8d4 ; case 5
    b L_021fd8fc ; case 6
    b L_021fd924 ; case 7
    b L_021fd95c ; case 8
    b L_021fd980 ; case 9
    b L_021fd9a4 ; case 10
    b L_021fd9c8 ; case 11
    b L_021fda00 ; case 12
    b L_021fda44 ; case 13
    b L_021fda6c ; case 14
L_021fd6d4:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r1, [r9, #0xa4]
    mov r0, r9
    mov r2, #0x0
    mov r3, #0x5
    bl func_ov009_021fd458
    str r0, [r9, #0xa4]
    mov r0, r9
    bl func_ov009_021fd338
    mov r0, r9
    bl func_ov009_021fd360
    b L_021fdd84
L_021fd718:
    ldr r1, [r9, #0x50]
    ldrh r0, [r1, #0x0]
    tst r0, #0x400
    ldrh r0, [r1, #0x6]
    beq L_021fd790
    tst r0, #0x30
    beq L_021fdd84
    mov r6, #0x0
    mov r5, #0x1
    mov r4, r6
L_021fd740:
    ldr r1, [r9, #0xa4]
    mov r0, r9
    str r5, [sp, #0x0]
    add r1, r9, r1, lsl #0x2
    ldr r3, [r1, #0xa8]
    ldr r1, [r1, #0xc0]
    mov r2, r4
    sub r3, r3, #0x1
    bl func_ov009_021fd458
    ldr r1, [r9, #0xa4]
    add r6, r6, #0x1
    add r1, r9, r1, lsl #0x2
    str r0, [r1, #0xc0]
    cmp r6, #0xa
    blt L_021fd740
    mov r0, r9
    bl func_ov009_021fd338
    mov r0, r9
    bl func_ov009_021fd360
    b L_021fdd84
L_021fd790:
    tst r0, #0x30
    beq L_021fdd84
    ldr r1, [r9, #0xa4]
    mov r0, #0x1
    str r0, [sp, #0x0]
    add r0, r9, r1, lsl #0x2
    ldr r2, [r0, #0xa8]
    ldr r1, [r0, #0xc0]
    mov r0, r9
    sub r3, r2, #0x1
    mov r2, #0x0
    bl func_ov009_021fd458
    ldr r1, [r9, #0xa4]
    add r1, r9, r1, lsl #0x2
    str r0, [r1, #0xc0]
    mov r0, r9
    bl func_ov009_021fd338
    mov r0, r9
    bl func_ov009_021fd360
    b L_021fdd84
L_021fd7e0:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fdd84
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r9, #0x80]
    ldr r1, [r9, #0xd8]
    ldr r2, [r0, #0x20]
    mov r0, r9
    ldr r3, [r2, #0x4]
    mov r2, #0x0
    sub r3, r3, #0x1
    bl func_ov009_021fd458
    mov r1, r0
    str r0, [r9, #0xd8]
    ldr r0, [r9, #0x88]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fdd84
L_021fd83c:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fdd84
    ldr r0, [r9, #0x10c]
    cmp r0, #0x0
    bne L_021fdd84
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x80]
    ldr r0, [r9, #0xd8]
    ldr r2, [r1, #0x24]
    ldr r1, [r9, #0xdc]
    add r0, r2, r0, lsl #0x3
    ldrh r3, [r0, #0x2]
    mov r0, r9
    mov r2, #0x0
    sub r3, r3, #0x1
    bl func_ov009_021fd458
    mov r1, r0
    str r0, [r9, #0xdc]
    ldr r0, [r9, #0x88]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetFrameIndex
    b L_021fdd84
L_021fd8ac:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    ldr r0, [r9, #0x10c]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x10c]
    b L_021fdd84
L_021fd8d4:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    ldr r0, [r9, #0x110]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x110]
    b L_021fdd84
L_021fd8fc:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    ldr r0, [r9, #0x114]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x114]
    b L_021fdd84
L_021fd924:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x20
    addne r0, r9, #0x100
    ldrnesh r1, [r0, #0x8]
    subne r1, r1, #0x100
    strneh r1, [r0, #0x8]
    bne L_021fdd84
    tst r0, #0x10
    addne r0, r9, #0x100
    ldrnesh r1, [r0, #0x8]
    addne r1, r1, #0x100
    strneh r1, [r0, #0x8]
    b L_021fdd84
L_021fd95c:
    mov r2, #0x10
    str r2, [sp, #0x0]
    ldr r1, [r9, #0xfc]
    mov r0, r9
    sub r2, r2, #0x210
    mov r3, #0x200
    bl func_ov009_021fd414
    str r0, [r9, #0xfc]
    b L_021fdd84
L_021fd980:
    mov r2, #0x10
    str r2, [sp, #0x0]
    ldr r1, [r9, #0x100]
    mov r0, r9
    sub r2, r2, #0x210
    mov r3, #0x200
    bl func_ov009_021fd414
    str r0, [r9, #0x100]
    b L_021fdd84
L_021fd9a4:
    mov r2, #0x10
    str r2, [sp, #0x0]
    ldr r1, [r9, #0x104]
    mov r0, r9
    sub r2, r2, #0x810
    mov r3, #0x800
    bl func_ov009_021fd414
    str r0, [r9, #0x104]
    b L_021fdd84
L_021fd9c8:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    ldr r0, [r9, #0xf8]
    cmp r0, #0x1
    moveq r0, #0x2
    movne r0, #0x1
    str r0, [r9, #0xf8]
    mov r0, r9
    bl func_ov009_021fd338
    mov r0, r9
    bl func_ov009_021fd360
    b L_021fdd84
L_021fda00:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r1, [r9, #0xe8]
    mov r0, r9
    mov r2, #0x0
    mov r3, #0x1f
    bl func_ov009_021fd414
    orr r1, r0, r0, lsl #0x5
    str r0, [r9, #0xe8]
    orr r1, r1, r0, lsl #0xa
    mov r0, #0x5000000
    strh r1, [r0, #0x0]
    b L_021fdd84
L_021fda44:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    ldr r0, [r9, #0x118]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x118]
    b L_021fdd84
L_021fda6c:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x31
    movne r0, #0x0
    strne r0, [r9, #0xe4]
    movne r0, #0x1
    strne r0, [r9, #0x11c]
    b L_021fdd84
L_021fda8c:
    cmp r0, #0x1
    bne L_021fdd84
    ldrh r0, [r1, #0x6]
    tst r0, #0x40
    beq L_021fdab8
    ldr r0, [r9, #0xe4]
    subs r0, r0, #0x1
    str r0, [r9, #0xe4]
    movmi r0, #0x7
    strmi r0, [r9, #0xe4]
    b L_021fdad8
L_021fdab8:
    tst r0, #0x80
    beq L_021fdad8
    ldr r0, [r9, #0xe4]
    add r0, r0, #0x1
    str r0, [r9, #0xe4]
    cmp r0, #0x8
    movge r0, #0x0
    strge r0, [r9, #0xe4]
L_021fdad8:
    ldr r0, [r9, #0xe4]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b L_021fdd84
L_021fdae8: ; jump table
    b L_021fdb08 ; case 0
    b L_021fdb70 ; case 1
    b L_021fdbd8 ; case 2
    b L_021fdc40 ; case 3
    b L_021fdc74 ; case 4
    b L_021fdcc0 ; case 5
    b L_021fdcf0 ; case 6
    b L_021fdd70 ; case 7
L_021fdb08:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fdd84
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    mov r0, #0x10
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x120]
    mov r0, r9
    mov r2, #0x0
    mov r3, #0x200
    bl func_ov009_021fd414
    str r0, [r9, #0x120]
    ldr r0, [r9, #0x88]
    ldr r1, [r9, #0x120]
    ldr r0, [r0, #0x18]
    ldr r2, [r9, #0x124]
    ldr r3, [r9, #0x128]
    bl func_02070958
    ldr r0, L_021fe9c8
    ldr r1, [r9, #0x88]
    ldr r0, [r0, #0x0]
    bl func_02074dc8
    b L_021fdd84
L_021fdb70:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fdd84
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    mov r0, #0x10
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x124]
    mov r0, r9
    mov r2, #0x0
    mov r3, #0x200
    bl func_ov009_021fd414
    str r0, [r9, #0x124]
    ldr r0, [r9, #0x88]
    ldr r1, [r9, #0x120]
    ldr r0, [r0, #0x18]
    ldr r2, [r9, #0x124]
    ldr r3, [r9, #0x128]
    bl func_02070958
    ldr r0, L_021fe9c8
    ldr r1, [r9, #0x88]
    ldr r0, [r0, #0x0]
    bl func_02074dc8
    b L_021fdd84
L_021fdbd8:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fdd84
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    mov r0, #0x10
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x128]
    mov r0, r9
    mov r2, #0x0
    mov r3, #0x200
    bl func_ov009_021fd414
    str r0, [r9, #0x128]
    ldr r0, [r9, #0x88]
    ldr r1, [r9, #0x120]
    ldr r0, [r0, #0x18]
    ldr r2, [r9, #0x124]
    ldr r3, [r9, #0x128]
    bl func_02070958
    ldr r0, L_021fe9c8
    ldr r1, [r9, #0x88]
    ldr r0, [r0, #0x0]
    bl func_02074dc8
    b L_021fdd84
L_021fdc40:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x12c]
    ldr r3, [r9, #0x130]
    mov r0, r9
    mov r2, #0x0
    bl func_ov009_021fd414
    str r0, [r9, #0x12c]
    b L_021fdd84
L_021fdc74:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    ldr r0, [r9, #0x88]
    mov r1, #0x1
    ldr r2, [r0, #0x18]
    mov r0, r9
    ldr r2, [r2, #0x20]
    str r1, [sp, #0x0]
    ldrh r4, [r2, #0x4]
    ldrh r3, [r2, #0x6]
    ldr r1, [r9, #0x130]
    ldr r2, [r9, #0x12c]
    mul r3, r4, r3
    sub r3, r3, #0x1
    bl func_ov009_021fd414
    str r0, [r9, #0x130]
    b L_021fdd84
L_021fdcc0:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    mov r2, #0x1
    str r2, [sp, #0x0]
    ldr r1, [r9, #0x134]
    mov r0, r9
    mov r3, #0x10
    bl func_ov009_021fd414
    str r0, [r9, #0x134]
    b L_021fdd84
L_021fdcf0:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fdd84
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdd84
    tst r0, #0x10
    ldrne r1, [r9, #0x138]
    ldrne r0, [r9, #0x134]
    addne r0, r1, r0
    strne r0, [r9, #0x138]
    bne L_021fdd38
    tst r0, #0x20
    ldrne r1, [r9, #0x138]
    ldrne r0, [r9, #0x134]
    subne r0, r1, r0
    strne r0, [r9, #0x138]
L_021fdd38:
    ldr r1, [r9, #0x138]
    ldr r2, [r9, #0x88]
    mov r0, r1, asr #0x3
    add r1, r1, r0, lsr #0x1c
    ldr r0, [r2, #0x18]
    ldr r2, [r9, #0x12c]
    ldr r3, [r9, #0x130]
    mov r1, r1, asr #0x4
    bl func_02070a78
    ldr r0, L_021fe9c8
    ldr r1, [r9, #0x88]
    ldr r0, [r0, #0x0]
    bl func_02074dc8
    b L_021fdd84
L_021fdd70:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x31
    movne r0, #0x0
    strne r0, [r9, #0x11c]
L_021fdd84:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fde4c
    ldr r2, [r9, #0xf4]
    ldr r1, [r9, #0x84]
    ldr r0, [r9, #0xf0]
    str r0, [r1, #0x18]
    str r2, [r1, #0x1c]
    ldr r0, [r9, #0x10c]
    ldr r1, [r9, #0x88]
    cmp r0, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x2
    bicne r0, r0, #0x1
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r9, #0x110]
    ldr r1, [r9, #0x88]
    cmp r0, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x40
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x40
    strh r0, [r1, #0x24]
    ldr r0, [r9, #0x114]
    ldr r1, [r9, #0x88]
    cmp r0, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x80
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x80
    strh r0, [r1, #0x24]
    add r0, r9, #0x100
    ldrsh r1, [r0, #0x8]
    ldr r0, [r9, #0x88]
    strh r1, [r0, #0x30]
    ldr r1, [r9, #0xfc]
    ldr r0, [r9, #0x88]
    cmp r1, #0x0
    moveq r1, #0x8
    strh r1, [r0, #0x32]
    ldr r1, [r9, #0x100]
    ldr r0, [r9, #0x88]
    cmp r1, #0x0
    moveq r1, #0x8
    strh r1, [r0, #0x34]
    ldr r1, [r9, #0x104]
    ldr r0, [r9, #0x88]
    strh r1, [r0, #0x36]
L_021fde4c:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x800
    bne L_021fde64
    ldr r0, [r9, #0x84]
    bl GraphicsSpriteGroup_AdvanceAnimations
L_021fde64:
    ldr r1, [r9, #0x88]
    ldrh r0, [r1, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldreqb r0, [r1, #0x39]
    streq r0, [r9, #0xdc]
    ldr r0, L_021fe9c8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fe9cc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x100
    beq L_021fdecc
    ldr r1, L_021fe9d0
    ldr r0, L_021fe9cc
    str r1, [sp, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, #0x3
    bl DebugText_Printf
    b L_021fe984
L_021fdecc:
    ldr r0, [r9, #0x44]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fdf54
    ldr r2, [r9, #0x58]
    ldr r0, [r9, #0xf0]
    mov r1, #0x1
    sub r0, r2, r0
    str r0, [sp, #0x0]
    ldr r3, [r9, #0x5c]
    ldr r2, [r9, #0xf4]
    ldr r0, L_021fe9c8
    sub r2, r3, r2
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fe9d4
    mov r2, r1
    bl GraphicsSpriteRenderer_Printf
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fdf54
    ldr r1, [r9, #0x58]
    ldr r2, [r9, #0x5c]
    bl func_02073aa8
    cmp r0, #0x0
    beq L_021fdf54
    ldr r1, L_021fe9d8
    ldr r0, L_021fe9c8
    str r1, [sp, #0x0]
    mov r2, #0x1
    ldr r0, [r0, #0x0]
    mov r3, r2
    mov r1, #0xa
    bl DebugText_Printf
L_021fdf54:
    ldr r2, [r9, #0xa4]
    ldr r1, L_021fe9dc
    ldr r0, L_021fe9cc
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0x1
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    mov r3, #0x6
    bl DebugText_Printf
    ldr r1, [r9, #0xa4]
    ldr r0, L_021fe9cc
    add r1, r9, r1, lsl #0x2
    ldr r4, [r1, #0x8c]
    ldr r1, [r1, #0xc0]
    mov r2, #0x3
    add r1, r4, r1, lsl #0x5
    add r1, r1, #0xc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r2
    mov r1, #0x1
    bl DebugText_Printf
    ldr r6, L_021fe9e0
    add r5, sp, #0x80
    mov r4, #0x5
L_021fdfbc:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne L_021fdfbc
    ldr r5, L_021fe9e4
    add r4, sp, #0x60
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r0, [r9, #0x11c]
    cmp r0, #0x0
    bne L_021fe3fc
    ldr r0, [sp, #0xc0]
    ldr r11, [sp, #0xb8]
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x84]
    ldr r10, [sp, #0xbc]
    str r0, [sp, #0x40]
    ldr r0, [sp, #0xc4]
    ldr r7, [sp, #0xc8]
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0x88]
    ldr r8, [sp, #0xcc]
    str r0, [sp, #0x38]
    ldr r0, [sp, #0x8c]
    ldr r5, L_021fe9cc
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x90]
    mov r6, #0x0
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x94]
    add r4, r9, #0x100
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x98]
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x9c]
    str r0, [sp, #0x24]
    ldr r0, [sp, #0xa0]
    str r0, [sp, #0x20]
    ldr r0, [sp, #0xa4]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0xa8]
    str r0, [sp, #0x18]
    ldr r0, [sp, #0xac]
    str r0, [sp, #0x14]
    ldr r0, [sp, #0xb0]
    str r0, [sp, #0x10]
    ldr r0, [sp, #0xb4]
    str r0, [sp, #0xc]
L_021fe084:
    cmp r6, #0xe
    addls pc, pc, r6, lsl #0x2
    b L_021fe3c8
L_021fe090: ; jump table
    b L_021fe0cc ; case 0
    b L_021fe0f4 ; case 1
    b L_021fe124 ; case 2
    b L_021fe160 ; case 3
    b L_021fe1a4 ; case 4
    b L_021fe1d0 ; case 5
    b L_021fe1fc ; case 6
    b L_021fe228 ; case 7
    b L_021fe26c ; case 8
    b L_021fe2b0 ; case 9
    b L_021fe2f4 ; case 10
    b L_021fe338 ; case 11
    b L_021fe368 ; case 12
    b L_021fe388 ; case 13
    b L_021fe3b4 ; case 14
L_021fe0cc:
    ldr r0, [r9, #0xa4]
    ldr r3, [sp, #0x44]
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x0]
    mov r1, #0x1
    add r2, r6, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe0f4:
    ldr r0, [r9, #0xa4]
    mov r1, #0x1
    add r3, r9, r0, lsl #0x2
    ldr r0, [r3, #0xc0]
    add r2, r6, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r3, #0xa8]
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x0]
    ldr r3, [sp, #0x80]
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe124:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fe3c8
    ldr r0, [r9, #0xd8]
    ldr r3, [sp, #0x40]
    str r0, [sp, #0x0]
    ldr r0, [r9, #0x80]
    mov r1, #0x1
    ldr r0, [r0, #0x20]
    add r2, r6, #0x5
    ldr r0, [r0, #0x4]
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe160:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fe3c8
    ldr r0, [r9, #0xdc]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r2, [r9, #0x80]
    ldr r0, [r9, #0xd8]
    ldr r3, [r2, #0x24]
    add r2, r6, #0x5
    add r0, r3, r0, lsl #0x3
    ldrh r0, [r0, #0x2]
    ldr r3, [sp, #0x3c]
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe1a4:
    ldr r0, [r9, #0x10c]
    ldr r3, [sp, #0x38]
    cmp r0, #0x0
    ldrne r0, L_021fe9e8
    mov r1, #0x1
    ldreq r0, L_021fe9ec
    add r2, r6, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe1d0:
    ldr r0, [r9, #0x110]
    ldr r3, [sp, #0x34]
    cmp r0, #0x0
    ldrne r0, L_021fe9e8
    mov r1, #0x1
    ldreq r0, L_021fe9ec
    add r2, r6, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe1fc:
    ldr r0, [r9, #0x114]
    ldr r3, [sp, #0x30]
    cmp r0, #0x0
    ldrne r0, L_021fe9e8
    mov r1, #0x1
    ldreq r0, L_021fe9ec
    add r2, r6, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe228:
    ldrsh r0, [r4, #0x8]
    mov r1, #0x1
    cmp r0, #0x0
    bge L_021fe254
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    ldr r3, [sp, #0x2c]
    add r2, r6, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe254:
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    ldr r3, [sp, #0x28]
    add r2, r6, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe26c:
    ldr r0, [r9, #0xfc]
    mov r1, #0x1
    cmp r0, #0x0
    bge L_021fe298
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    ldr r3, [sp, #0x24]
    add r2, r6, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe298:
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    ldr r3, [sp, #0x20]
    add r2, r6, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe2b0:
    ldr r0, [r9, #0x100]
    mov r1, #0x1
    cmp r0, #0x0
    bge L_021fe2dc
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    ldr r3, [sp, #0x1c]
    add r2, r6, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe2dc:
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    ldr r3, [sp, #0x18]
    add r2, r6, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe2f4:
    ldr r0, [r9, #0x104]
    mov r1, #0x1
    cmp r0, #0x0
    bge L_021fe320
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    ldr r3, [sp, #0x14]
    add r2, r6, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe320:
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    ldr r3, [sp, #0x10]
    add r2, r6, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe338:
    ldr r0, [r9, #0xf8]
    mov r1, #0x1
    cmp r0, #0x2
    ldr r0, [r5, #0x0]
    add r2, r6, #0x5
    bne L_021fe35c
    ldr r3, [sp, #0xc]
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe35c:
    mov r3, r11
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe368:
    ldr r0, [r9, #0xe8]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    add r2, r6, #0x5
    mov r3, r10
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe388:
    ldr r0, [r9, #0x118]
    mov r1, #0x1
    cmp r0, #0x0
    ldrne r0, L_021fe9e8
    add r2, r6, #0x5
    ldreq r0, L_021fe9ec
    mov r3, r7
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteRenderer_Printf
    b L_021fe3c8
L_021fe3b4:
    ldr r0, [r5, #0x0]
    mov r1, #0x1
    add r2, r6, #0x5
    mov r3, r8
    bl GraphicsSpriteRenderer_Printf
L_021fe3c8:
    add r6, r6, #0x1
    cmp r6, #0xf
    blt L_021fe084
    ldr r1, L_021fe9f0
    ldr r0, L_021fe9cc
    str r1, [sp, #0x0]
    ldr r1, [r9, #0xe0]
    ldr r0, [r0, #0x0]
    add r2, r1, #0x5
    mov r1, #0x1
    mov r3, #0x2
    bl DebugText_Printf
    b L_021fe578
L_021fe3fc:
    cmp r0, #0x1
    bne L_021fe578
    ldr r0, [sp, #0x64]
    ldr r11, [sp, #0x70]
    str r0, [sp, #0x4c]
    ldr r0, [sp, #0x68]
    ldr r10, [sp, #0x74]
    ldr r6, [sp, #0x78]
    ldr r7, [sp, #0x7c]
    ldr r8, [sp, #0x6c]
    ldr r4, L_021fe9cc
    str r0, [sp, #0x48]
    mov r5, #0x0
L_021fe430:
    cmp r5, #0x7
    addls pc, pc, r5, lsl #0x2
    b L_021fe548
L_021fe43c: ; jump table
    b L_021fe45c ; case 0
    b L_021fe47c ; case 1
    b L_021fe49c ; case 2
    b L_021fe4bc ; case 3
    b L_021fe4dc ; case 4
    b L_021fe4fc ; case 5
    b L_021fe51c ; case 6
    b L_021fe534 ; case 7
L_021fe45c:
    ldr r0, [r9, #0x120]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x60]
    add r2, r5, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe548
L_021fe47c:
    ldr r0, [r9, #0x124]
    ldr r3, [sp, #0x4c]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    add r2, r5, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe548
L_021fe49c:
    ldr r0, [r9, #0x128]
    ldr r3, [sp, #0x48]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    add r2, r5, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fe548
L_021fe4bc:
    ldr r0, [r9, #0x12c]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    mov r3, r11
    bl GraphicsSpriteRenderer_Printf
    b L_021fe548
L_021fe4dc:
    ldr r0, [r9, #0x130]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    mov r3, r10
    bl GraphicsSpriteRenderer_Printf
    b L_021fe548
L_021fe4fc:
    ldr r0, [r9, #0x134]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    mov r3, r6
    bl GraphicsSpriteRenderer_Printf
    b L_021fe548
L_021fe51c:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    add r2, r5, #0x5
    mov r3, r7
    bl GraphicsSpriteRenderer_Printf
    b L_021fe548
L_021fe534:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    add r2, r5, #0x5
    mov r3, r8
    bl GraphicsSpriteRenderer_Printf
L_021fe548:
    add r5, r5, #0x1
    cmp r5, #0x8
    blt L_021fe430
    ldr r1, L_021fe9f0
    ldr r0, L_021fe9cc
    str r1, [sp, #0x0]
    ldr r1, [r9, #0xe4]
    ldr r0, [r0, #0x0]
    add r2, r1, #0x5
    mov r1, #0x1
    mov r3, #0x2
    bl DebugText_Printf
L_021fe578:
    ldr r0, [r9, #0x88]
    cmp r0, #0x0
    beq L_021fe94c
    ldr r0, [r0, #0x14]
    mov r4, #0x8
    ldr r1, [r0, #0x10]
    ldr r0, L_021fe9cc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fe9f4
    mov r2, r4
    mov r1, #0x12
    bl GraphicsSpriteRenderer_Printf
    ldr r1, [r9, #0x88]
    ldr r0, L_021fe9cc
    ldr r1, [r1, #0x18]
    ldr r3, L_021fe9f8
    ldr r2, [r1, #0x10]
    mov r1, #0x12
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl GraphicsSpriteRenderer_Printf
    ldr r1, [r9, #0x88]
    ldr r0, L_021fe9cc
    ldr r1, [r1, #0x1c]
    ldr r3, L_021fe9fc
    ldr r2, [r1, #0x10]
    mov r1, #0x12
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl GraphicsSpriteRenderer_Printf
    ldr r0, [r9, #0x88]
    ldr r0, [r0, #0x14]
    ldr r2, [r0, #0x18]
    cmp r2, #0x8000
    ble L_021fe638
    ldr r1, L_021fea00
    ldr r0, L_021fe9cc
    stmia sp, {r1, r2}
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    mov r2, #0xc
    mov r3, #0x1
    add r4, r4, #0x5
    bl DebugText_Printf
    b L_021fe658
L_021fe638:
    ldr r0, L_021fe9cc
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fea00
    mov r1, #0x12
    mov r2, #0xc
    add r4, r4, #0x5
    bl GraphicsSpriteRenderer_Printf
L_021fe658:
    ldr r1, [r9, #0x88]
    ldr r0, L_021fe9cc
    ldr r1, [r1, #0x18]
    ldr r3, L_021fea04
    ldr r1, [r1, #0x18]
    mov r2, r4
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    bl GraphicsSpriteRenderer_Printf
    ldr r1, [r9, #0x88]
    ldr r0, L_021fe9cc
    ldr r1, [r1, #0x1c]
    ldr r3, L_021fea08
    ldr r1, [r1, #0x18]
    add r2, r4, #0x1
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    bl GraphicsSpriteRenderer_Printf
    ldr r0, [r9, #0x88]
    ldr r0, [r0, #0x14]
    bl func_0207043c
    mov r1, r0, asr #0x4
    add r0, r0, r1, lsr #0x1b
    mov r0, r0, asr #0x5
    add r1, r0, #0x3
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r0, r0, asr #0x2
    str r0, [sp, #0x0]
    ldr r0, L_021fe9cc
    mov r1, #0x12
    ldr r0, [r0, #0x0]
    add r2, r4, #0x3
    ldr r3, L_021fea0c
    bl GraphicsSpriteRenderer_Printf
    ldr r1, [r9, #0x88]
    ldr r0, L_021fe9cc
    ldr r2, [r1, #0x1c]
    mov r1, #0x12
    ldr r3, [r2, #0x20]
    add r2, r4, #0x4
    ldr r5, [r3, #0x24]
    ldr r3, L_021fea10
    str r5, [sp, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Printf
    add r2, r4, #0x5
    ldr r1, [r9, #0x88]
    ldr r0, L_021fe9cc
    ldr r3, [r1, #0x18]
    mov r1, #0x12
    ldr r5, [r3, #0x20]
    ldr r3, L_021fea14
    ldrh r4, [r5, #0x4]
    str r4, [sp, #0x0]
    ldrh r4, [r5, #0x6]
    str r4, [sp, #0x4]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Printf
    ldr r8, [r9, #0x88]
    ldr r10, L_021fe9c8
    ldr r1, [r8, #0x1c]
    ldrb r7, [r8, #0x39]
    ldr r4, [r1, #0x2c]
    ldr r0, [r1, #0x28]
    ldr r5, [r1, #0x24]
    ldr r6, [r1, #0x30]
    ldrb r3, [r8, #0x38]
    mov r1, #0x1
    mov r2, #0x15
    mov r3, r3, lsl #0x3
    ldrh r5, [r5, r3]
    ldr r3, L_021fea18
    add r5, r5, r7
    mov r5, r5, lsl #0x2
    ldrh r0, [r0, r5]
    mov r11, r0, lsl #0x2
    add r5, r4, r0, lsl #0x2
    ldrh r0, [r4, r11]
    add r6, r6, r0, lsl #0x3
    str r7, [sp, #0x0]
    ldr r4, [r8, #0x20]
    mov r0, r4, asr #0x7
    add r0, r4, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x4]
    ldrh r0, [r5, #0x2]
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x0]
    bl GraphicsSpriteRenderer_Printf
    ldr r0, [r9, #0x10c]
    cmp r0, #0x0
    bne L_021fe7f4
    ldr r1, L_021fea1c
    mov r0, r10
    str r1, [sp, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, #0x16
    bl DebugText_Printf
L_021fe7f4:
    ldr r0, [r9, #0x118]
    cmp r0, #0x0
    beq L_021fe94c
    mov r7, #0x0
    add r4, sp, #0x5a
    b L_021fe940
L_021fe80c:
    ldrh r1, [r6, #0x0]
    strh r1, [sp, #0x58]
    ldrh r0, [r6, #0x2]
    mov r2, r1, lsl #0x18
    mov ip, r2, lsr #0x18
    strh r0, [sp, #0x5a]
    ldrh r1, [r6, #0x4]
    mov r0, r0, lsl #0x17
    mov r11, r0, lsr #0x17
    strh r1, [sp, #0x5c]
    ldrh r3, [r6, #0x6]
    tst r11, #0x100
    subne r11, r11, #0x200
    mov r1, r3, lsl #0x1c
    strh r3, [sp, #0x5e]
    mov r10, r1, lsr #0x1c
    ldr r1, [r9, #0x88]
    mov r0, r3, lsl #0x18
    ldrh r2, [r1, #0x24]
    mov r8, r0, lsr #0x1c
    tst ip, #0x80
    and r0, r2, #0x40
    mov r0, r0, lsl #0x10
    subne ip, ip, #0x100
    movs r0, r0, lsr #0x10
    beq L_021fe8a4
    ldrh r3, [r4, #0x0]
    add r0, r11, r10, lsl #0x3
    rsb r11, r0, #0x0
    bic r0, r3, #0x1000
    mov r3, r3, lsl #0x13
    mov r3, r3, lsr #0x1f
    eor r3, r3, #0x1
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    mov r3, r3, lsl #0x1f
    orr r0, r0, r3, lsr #0x13
    strh r0, [r4, #0x0]
L_021fe8a4:
    and r0, r2, #0x80
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_021fe8e4
    ldrh r2, [r4, #0x0]
    add r0, ip, r8, lsl #0x3
    rsb ip, r0, #0x0
    bic r0, r2, #0x2000
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x1f
    eor r2, r2, #0x1
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x1f
    orr r0, r0, r2, lsr #0x12
    strh r0, [r4, #0x0]
L_021fe8e4:
    ldr r3, [r1, #0x0]
    ldrsh r0, [r1, #0x2e]
    ldr r2, [r3, #0x18]
    ldrsh r1, [r1, #0x2c]
    ldr r3, [r3, #0x1c]
    add r1, r2, r1
    add r0, r3, r0
    add r2, ip, r0
    add r0, r2, r8, lsl #0x3
    sub r0, r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0xf
    str r0, [sp, #0x4]
    ldr r0, L_021fe9c8
    add r1, r11, r1
    add r3, r1, r10, lsl #0x3
    ldr r0, [r0, #0x0]
    add r1, r1, #0x1
    add r2, r2, #0x1
    sub r3, r3, #0x1
    bl GraphicsSpriteCanvas_DrawRect
    add r7, r7, #0x1
    add r6, r6, #0x8
L_021fe940:
    ldrh r0, [r5, #0x2]
    cmp r7, r0
    blt L_021fe80c
L_021fe94c:
    ldr r0, [r9, #0xe0]
    mov r1, #0x1
    cmp r0, #0x1
    mov r2, #0x17
    bne L_021fe974
    ldr r0, L_021fe9c8
    ldr r3, L_021fea20
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Printf
    b L_021fe984
L_021fe974:
    ldr r0, L_021fe9c8
    ldr r3, L_021fea24
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Printf
L_021fe984:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x2]
    tst r0, #0x2
    beq L_021fe9bc
    ldr r0, L_021fea28
    add r1, sp, #0x50
    ldr r2, [r0, #0x24]
    ldr r3, [r0, #0x20]
    sub r0, r2, #0x48
    str r0, [sp, #0x54]
    str r3, [sp, #0x50]
    add r0, r9, #0x24
    ldmia r1, {r1, r2}
    bl func_ov009_021fce74
L_021fe9bc:
    mov r0, #0x0
    add sp, sp, #0xd0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe9c8: .word data_020f4e14
L_021fe9cc: .word gDebugFont
L_021fe9d0: .word data_ov009_021feedc
L_021fe9d4: .word data_ov009_021feee4
L_021fe9d8: .word data_ov009_021feef0
L_021fe9dc: .word data_ov009_021febc0
L_021fe9e0: .word data_ov009_021feaf0
L_021fe9e4: .word data_ov009_021fead0
L_021fe9e8: .word data_ov009_021feef8
L_021fe9ec: .word data_ov009_021feefc
L_021fe9f0: .word data_ov009_021fef00
L_021fe9f4: .word data_ov009_021fef04
L_021fe9f8: .word data_ov009_021fef10
L_021fe9fc: .word data_ov009_021fef1c
L_021fea00: .word data_ov009_021fef28
L_021fea04: .word data_ov009_021fef34
L_021fea08: .word data_ov009_021fef3c
L_021fea0c: .word data_ov009_021fef44
L_021fea10: .word data_ov009_021fef50
L_021fea14: .word data_ov009_021fef5c
L_021fea18: .word data_ov009_021fef6c
L_021fea1c: .word data_ov009_021fef84
L_021fea20: .word data_ov009_021fef98
L_021fea24: .word data_ov009_021fefb4
L_021fea28: .word data_ov009_021feb80

    .size func_ov009_021fd4e8, . - func_ov009_021fd4e8
