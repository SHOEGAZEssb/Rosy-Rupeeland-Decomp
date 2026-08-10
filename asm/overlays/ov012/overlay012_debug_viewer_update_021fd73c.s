    .text
    .extern DebugText_Printf
    .extern data_020f4e14
    .extern data_ov012_021fe460
    .extern data_ov012_021fe4d0
    .extern data_ov012_021fe500
    .extern data_ov012_021fe51c
    .extern data_ov012_021fe6ec
    .extern data_ov012_021fe6f4
    .extern data_ov012_021fe6fc
    .extern data_ov012_021fe700
    .extern data_ov012_021fe704
    .extern data_ov012_021fe70c
    .extern data_ov012_021fe714
    .extern data_ov012_021fe71c
    .extern data_ov012_021fe724
    .extern data_ov012_021fe728
    .extern data_ov012_021fe730
    .extern data_ov012_021fe73c
    .extern data_ov012_021fe744
    .extern data_ov012_021fe74c
    .extern func_02070454
    .extern func_02070464
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern func_02075858
    .extern Graphics3DLight_Apply
    .extern Graphics3DSceneState_Apply
    .extern Graphics3DResourceBinding_GetTextureFormat
    .extern Graphics3DResourceBinding_GetTextureWidthClass
    .extern Graphics3DResourceBinding_GetTextureHeightClass
    .extern func_020b0300
    .extern func_020b0558
    .extern func_ov012_021fcef4
    .extern func_ov012_021fcfd4
    .extern func_ov012_021fd044
    .extern func_ov012_021fd148
    .extern func_ov012_021fd5ac
    .extern func_ov012_021fd63c
    .extern func_ov012_021fd668
    .extern func_ov012_021fd6ac
    .extern func_ov012_021fe348
    .extern func_ov012_021fe374
    .extern func_ov012_021fe3b4
    .extern gDebugFont

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov012/overlay012_debug_viewer_update.c. */
    .global func_ov012_021fd73c
func_ov012_021fd73c: ; 0x021fd73c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x70
    mov r9, r0
    ldr r1, [r9, #0x50]
    ldrh r1, [r1, #0x2]
    tst r1, #0x8
    beq L_021fd75c
    bl func_ov012_021fd5ac
L_021fd75c:
    ldr r1, [r9, #0x50]
    ldrh r0, [r1, #0x0]
    tst r0, #0x100
    beq L_021fd800
    tst r0, #0x20
    beq L_021fd790
    ldr r1, [r9, #0x198]
    mvn r0, #0x7f
    sub r1, r1, #0x1
    str r1, [r9, #0x198]
    cmp r1, r0
    strlt r0, [r9, #0x198]
    b L_021fd7b0
L_021fd790:
    tst r0, #0x10
    beq L_021fd7b0
    ldr r0, [r9, #0x198]
    add r0, r0, #0x1
    str r0, [r9, #0x198]
    cmp r0, #0x80
    movge r0, #0x7f
    strge r0, [r9, #0x198]
L_021fd7b0:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x80
    beq L_021fd7dc
    ldr r1, [r9, #0x19c]
    mvn r0, #0x5f
    sub r1, r1, #0x1
    str r1, [r9, #0x19c]
    cmp r1, r0
    strlt r0, [r9, #0x19c]
    b L_021fdaf4
L_021fd7dc:
    tst r0, #0x40
    beq L_021fdaf4
    ldr r0, [r9, #0x19c]
    add r0, r0, #0x1
    str r0, [r9, #0x19c]
    cmp r0, #0x60
    movge r0, #0x5f
    strge r0, [r9, #0x19c]
    b L_021fdaf4
L_021fd800:
    ldrh r0, [r1, #0x6]
    tst r0, #0x200
    beq L_021fd820
    ldr r0, [r9, #0x1b0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x1b0]
L_021fd820:
    ldr r0, [r9, #0x44]
    mov r0, r0, lsl #0x16
    movs r0, r0, asr #0x1f
    beq L_021fd850
    ldr r1, [r9, #0x1a8]
    ldr r0, [r9, #0x64]
    add r0, r1, r0, lsl #0x7
    str r0, [r9, #0x1a8]
    ldr r1, [r9, #0x1a4]
    ldr r0, [r9, #0x68]
    add r0, r1, r0, lsl #0x7
    str r0, [r9, #0x1a4]
L_021fd850:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x40
    beq L_021fd878
    ldr r0, [r9, #0x190]
    subs r0, r0, #0x1
    str r0, [r9, #0x190]
    movmi r0, #0xa
    strmi r0, [r9, #0x190]
    b L_021fd898
L_021fd878:
    tst r0, #0x80
    beq L_021fd898
    ldr r0, [r9, #0x190]
    add r0, r0, #0x1
    str r0, [r9, #0x190]
    cmp r0, #0xb
    movge r0, #0x0
    strge r0, [r9, #0x190]
L_021fd898:
    ldr r0, [r9, #0x190]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fdaf4
L_021fd8a8: ; jump table
    b L_021fd8d4 ; case 0
    b L_021fd914 ; case 1
    b L_021fd9e4 ; case 2
    b L_021fda08 ; case 3
    b L_021fda30 ; case 4
    b L_021fda5c ; case 5
    b L_021fd954 ; case 6
    b L_021fd984 ; case 7
    b L_021fd9b4 ; case 8
    b L_021fda80 ; case 9
    b L_021fdadc ; case 10
L_021fd8d4:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdaf4
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r2, [r9, #0x184]
    ldr r1, [r9, #0x188]
    mov r0, r9
    sub r3, r2, #0x1
    mov r2, #0x0
    bl func_ov012_021fd6ac
    str r0, [r9, #0x188]
    mov r0, r9
    bl func_ov012_021fd63c
    b L_021fdaf4
L_021fd914:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdaf4
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r9, #0x15c]
    ldr r1, [r9, #0x18c]
    ldr r2, [r0, #0x20]
    mov r0, r9
    ldr r3, [r2, #0x4]
    mov r2, #0x0
    sub r3, r3, #0x1
    bl func_ov012_021fd6ac
    str r0, [r9, #0x18c]
    b L_021fdaf4
L_021fd954:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x20
    ldrne r0, [r9, #0x1a4]
    subne r0, r0, #0x100
    strne r0, [r9, #0x1a4]
    bne L_021fdaf4
    tst r0, #0x10
    ldrne r0, [r9, #0x1a4]
    addne r0, r0, #0x100
    strne r0, [r9, #0x1a4]
    b L_021fdaf4
L_021fd984:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x20
    ldrne r0, [r9, #0x1a8]
    subne r0, r0, #0x100
    strne r0, [r9, #0x1a8]
    bne L_021fdaf4
    tst r0, #0x10
    ldrne r0, [r9, #0x1a8]
    addne r0, r0, #0x100
    strne r0, [r9, #0x1a8]
    b L_021fdaf4
L_021fd9b4:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x20
    ldrne r0, [r9, #0x1ac]
    subne r0, r0, #0x100
    strne r0, [r9, #0x1ac]
    bne L_021fdaf4
    tst r0, #0x10
    ldrne r0, [r9, #0x1ac]
    addne r0, r0, #0x100
    strne r0, [r9, #0x1ac]
    b L_021fdaf4
L_021fd9e4:
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x1a0]
    mov r0, r9
    mov r2, #0x0
    mov r3, #0x6
    bl func_ov012_021fd668
    str r0, [r9, #0x1a0]
    b L_021fdaf4
L_021fda08:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdaf4
    ldr r0, [r9, #0x1b4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x1b4]
    b L_021fdaf4
L_021fda30:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdaf4
    ldr r0, [r9, #0x1b8]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x1b8]
    bl func_ov012_021fd044
    b L_021fdaf4
L_021fda5c:
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x1c0]
    mov r0, r9
    mov r2, #0x0
    mov r3, #0x1f
    bl func_ov012_021fd668
    str r0, [r9, #0x1c0]
    b L_021fdaf4
L_021fda80:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdaf4
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x194]
    mov r0, r9
    mov r2, #0x0
    mov r3, #0x1f
    bl func_ov012_021fd668
    orr r1, r0, r0, lsl #0x5
    orr r1, r1, r0, lsl #0xa
    mov r1, r1, lsl #0x10
    str r0, [r9, #0x194]
    mov r4, #0x0
    mov r0, r1, lsr #0x10
    ldr r2, L_021fe2dc
    mov r1, #0x1f
    mov r3, #0x3f
    str r4, [sp, #0x0]
    bl func_020b0300
    b L_021fdaf4
L_021fdadc:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    ldrne r0, [r9, #0x1bc]
    rsbne r0, r0, #0x1
    strne r0, [r9, #0x1bc]
L_021fdaf4:
    ldr r1, [r9, #0x198]
    mov r0, #0x0
    mov r1, r1, lsl #0x4
    str r1, [r9, #0x160]
    ldr r1, [r9, #0x19c]
    ldr r2, L_021fe2e0
    mov r1, r1, lsl #0x4
    str r1, [r9, #0x164]
    str r0, [r9, #0x168]
    ldr r0, [r9, #0x1a4]
    ldr r1, L_021fe2e4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x178]
    ldr r0, [r9, #0x1a8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x17c]
    ldr r0, [r9, #0x1ac]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x180]
    ldr r0, [r9, #0x1a0]
    ldr r0, [r2, r0, lsl #0x2]
    str r0, [r9, #0x174]
    str r0, [r9, #0x170]
    str r0, [r9, #0x16c]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fe2e8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x100
    beq L_021fdba8
    ldr r1, L_021fe2ec
    ldr r0, L_021fe2e8
    str r1, [sp, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, #0x3
    bl DebugText_Printf
    b L_021fdfbc
L_021fdba8:
    ldr r1, L_021fe2f0
    ldr r0, L_021fe2e8
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x6
    bl DebugText_Printf
    ldr r2, [r9, #0x7c]
    ldr r1, [r9, #0x188]
    mov r0, #0x18
    mla r0, r1, r0, r2
    add r1, r0, #0x4
    str r1, [sp, #0x0]
    ldr r0, L_021fe2e8
    mov r2, #0x3
    ldr r0, [r0, #0x0]
    mov r3, r2
    mov r1, #0x1
    bl DebugText_Printf
    ldr r6, L_021fe2f4
    add r5, sp, #0x38
    mov r4, #0x3
L_021fdc04:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne L_021fdc04
    ldmia r6, {r0, r1}
    stmia r5, {r0, r1}
    ldr r0, [sp, #0x3c]
    ldr r11, [sp, #0x60]
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x40]
    ldr r10, [sp, #0x6c]
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x44]
    ldr r6, [sp, #0x64]
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x48]
    ldr r7, [sp, #0x68]
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x4c]
    ldr r8, [sp, #0x58]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x50]
    ldr r4, L_021fe2e8
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x54]
    mov r5, #0x0
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x5c]
    str r0, [sp, #0x10]
L_021fdc78:
    cmp r5, #0xa
    addls pc, pc, r5, lsl #0x2
    b L_021fdf10
L_021fdc84: ; jump table
    b L_021fdcb0 ; case 0
    b L_021fdcd8 ; case 1
    b L_021fde28 ; case 2
    b L_021fde50 ; case 3
    b L_021fde7c ; case 4
    b L_021fdea8 ; case 5
    b L_021fdd08 ; case 6
    b L_021fdd68 ; case 7
    b L_021fddc8 ; case 8
    b L_021fdec8 ; case 9
    b L_021fdee8 ; case 10
L_021fdcb0:
    ldr r0, [r9, #0x188]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r9, #0x184]
    add r2, r5, #0x5
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x38]
    bl func_02075858
    b L_021fdf10
L_021fdcd8:
    ldr r0, [r9, #0x18c]
    ldr r3, [sp, #0x2c]
    str r0, [sp, #0x0]
    ldr r0, [r9, #0x15c]
    mov r1, #0x1
    ldr r0, [r0, #0x20]
    add r2, r5, #0x5
    ldr r0, [r0, #0x4]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x0]
    bl func_02075858
    b L_021fdf10
L_021fdd08:
    ldr r1, [r9, #0x1a4]
    cmp r1, #0x0
    bge L_021fdd40
    rsb r1, r1, #0x0
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x28]
    mov r1, #0x1
    add r2, r5, #0x5
    bl func_02075858
    b L_021fdf10
L_021fdd40:
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x24]
    mov r1, #0x1
    add r2, r5, #0x5
    bl func_02075858
    b L_021fdf10
L_021fdd68:
    ldr r1, [r9, #0x1a8]
    cmp r1, #0x0
    bge L_021fdda0
    rsb r1, r1, #0x0
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x20]
    mov r1, #0x1
    add r2, r5, #0x5
    bl func_02075858
    b L_021fdf10
L_021fdda0:
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x1c]
    mov r1, #0x1
    add r2, r5, #0x5
    bl func_02075858
    b L_021fdf10
L_021fddc8:
    ldr r1, [r9, #0x1ac]
    cmp r1, #0x0
    bge L_021fde00
    rsb r1, r1, #0x0
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x18]
    mov r1, #0x1
    add r2, r5, #0x5
    bl func_02075858
    b L_021fdf10
L_021fde00:
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x14]
    mov r1, #0x1
    add r2, r5, #0x5
    bl func_02075858
    b L_021fdf10
L_021fde28:
    ldr r2, [r9, #0x1a0]
    ldr r0, L_021fe2f8
    ldr r3, [sp, #0x10]
    ldr r0, [r0, r2, lsl #0x2]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    bl func_02075858
    b L_021fdf10
L_021fde50:
    ldr r0, [r9, #0x1b4]
    mov r1, #0x1
    cmp r0, #0x0
    ldrne r0, L_021fe2fc
    add r2, r5, #0x5
    ldreq r0, L_021fe300
    mov r3, r11
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    bl func_02075858
    b L_021fdf10
L_021fde7c:
    ldr r0, [r9, #0x1b8]
    mov r1, #0x1
    cmp r0, #0x0
    ldrne r0, L_021fe304
    add r2, r5, #0x5
    ldreq r0, L_021fe308
    mov r3, r10
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    bl func_02075858
    b L_021fdf10
L_021fdea8:
    ldr r0, [r9, #0x1c0]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    mov r3, r6
    bl func_02075858
    b L_021fdf10
L_021fdec8:
    ldr r0, [r9, #0x194]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    mov r3, r7
    bl func_02075858
    b L_021fdf10
L_021fdee8:
    ldr r0, [r9, #0x1bc]
    mov r1, #0x1
    cmp r0, #0x0
    ldreq r0, L_021fe30c
    add r2, r5, #0x5
    ldrne r0, L_021fe310
    mov r3, r8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    bl func_02075858
L_021fdf10:
    add r5, r5, #0x1
    cmp r5, #0xb
    blt L_021fdc78
    ldr r1, L_021fe314
    ldr r0, L_021fe2e8
    str r1, [sp, #0x0]
    ldr r1, [r9, #0x190]
    ldr r0, [r0, #0x0]
    add r2, r1, #0x5
    mov r1, #0x1
    mov r3, #0x2
    bl DebugText_Printf
    ldr r0, [r9, #0x15c]
    ldr r1, [r9, #0x18c]
    ldr r2, [r0, #0x24]
    mov r0, #0xc
    mla r0, r1, r0, r2
    ldr r1, [r0, #0x8]
    ldr r0, L_021fe2e8
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fe318
    mov r1, #0x12
    mov r2, #0x6
    bl func_02075858
    ldr r1, [r9, #0x15c]
    ldr r0, L_021fe2e8
    ldr r1, [r1, #0x10]
    ldr r3, L_021fe31c
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    mov r2, #0x8
    bl func_02075858
    ldr r1, [r9, #0x15c]
    ldr r0, L_021fe2e8
    ldr r2, [r1, #0x18]
    mov r1, #0x12
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    ldr r3, L_021fe320
    bl func_02075858
L_021fdfbc:
    ldr r0, [r9, #0x15c]
    ldr r1, [r9, #0x18c]
    ldr r2, [r0, #0x24]
    mov r0, #0xc
    mla r0, r1, r0, r2
    ldr r1, [r0, #0x8]
    ldr r0, L_021fe2e4
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fe324
    mov r1, #0x1
    mov r2, #0x16
    bl func_02075858
    ldr r0, L_021fe2e4
    ldr r3, L_021fe328
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x17
    bl func_02075858
    bl func_020b0558
    ldr r1, [r9, #0x1bc]
    add r0, r9, #0x80
    str r1, [r9, #0x80]
    bl Graphics3DSceneState_Apply
    ldr r0, L_021fe32c
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r9, #0x1b4]
    mov r5, #0x3
    cmp r0, #0x0
    movne r5, #0x2
    mov r6, #0x0
    add r4, r9, #0x114
L_021fe040:
    mov r1, r6
    add r0, r4, r6, lsl #0x4
    bl Graphics3DLight_Apply
    add r6, r6, #0x1
    cmp r6, #0x4
    blt L_021fe040
    ldr r1, L_021fe2dc
    ldr r0, L_021fe330
    mov r2, r5
    str r1, [r0, #0x0]
    ldr r0, [r9, #0x1c0]
    mov r1, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x1
    mov r3, #0x8
    str r1, [sp, #0x4]
    bl func_ov012_021fe348
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov012_021fe374
    add r0, r9, #0x158
    bl func_ov012_021fcef4
    ldr r1, [r9, #0x18c]
    add r0, r9, #0x158
    bl func_ov012_021fcfd4
    ldr r0, L_021fe334
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r0, [r9, #0x1b0]
    cmp r0, #0x0
    beq L_021fe284
    ldr r0, [r9, #0x154]
    ldr r0, [r0, #0x4]
    bl func_02070454
    ldr r1, [r9, #0x154]
    mov r4, r0
    ldr r0, [r1, #0x4]
    bl func_02070464
    mov r5, r0
    ldr r6, L_021fe32c
    mov r0, #0x0
    str r0, [r6, #0x0]
    ldr r2, [r9, #0x198]
    ldr r3, [r9, #0x19c]
    sub r2, r2, #0x100
    add r3, r3, #0x100
    mov r2, r2, lsl #0x4
    str r2, [r6, #0x2c]
    mov r3, r3, lsl #0x4
    str r3, [r6, #0x2c]
    mov r1, #0x10000
    str r0, [r6, #0x2c]
    str r1, [r6, #0x28]
    str r1, [r6, #0x28]
    mov r1, #0x1000
    str r1, [r6, #0x28]
    mov r1, #0x1f
    str r1, [sp, #0x0]
    mov r1, r0
    str r0, [sp, #0x4]
    mov r2, #0x3
    mov r3, #0x3e
    bl func_ov012_021fe348
    ldr r6, [r9, #0x154]
    mov r0, r6
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r8, r0
    ldr r0, [r9, #0x154]
    bl Graphics3DResourceBinding_GetTextureWidthClass
    mov r7, r0
    mov r0, r6
    bl Graphics3DResourceBinding_GetTextureHeightClass
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    ldr r6, [r6, #0x10]
    mov r3, r0
    ldr r6, [r6, #0xc]
    mov r2, r7
    mov r0, r8
    str r6, [sp, #0xc]
    bl func_ov012_021fe374
    ldr r0, [r9, #0x154]
    bl Graphics3DResourceBinding_GetTextureFormat
    cmp r0, #0x2
    moveq r6, #0x1
    movne r6, #0x0
    ldr r0, [r9, #0x154]
    ldr r1, L_021fe338
    ldr r2, [r0, #0x14]
    mov r0, #0x1
    ldr r3, [r2, #0xc]
    rsb r2, r6, #0x4
    mov r2, r3, lsr r2
    str r2, [r1, #0x0]
    str r0, [r1, #0x54]
    rsb r0, r0, #0x8000
    mov r6, r5, lsl #0xd
    str r0, [r1, #-0x2c]
    mov r0, #0x0
    str r0, [r1, #-0x24]
    sub r2, r1, #0x20
    str r0, [r2, #0x0]
    mov r1, r6
    str r0, [r2, #0x0]
    bl func_ov012_021fe3b4
    mov r0, r5, lsl #0x1
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r5, r4, lsl #0x1
    mov r4, r0, lsr #0x10
    mov r7, r5, lsl #0xc
    ldr r2, L_021fe33c
    mov r3, r4, lsl #0x10
    mov r0, r7
    mov r1, r6
    str r3, [r2, #0x0]
    bl func_ov012_021fe3b4
    mov r0, r5, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    ldr r2, L_021fe33c
    orr r3, r5, r4, lsl #0x10
    mov r0, r7
    mov r1, #0x0
    str r3, [r2, #0x0]
    bl func_ov012_021fe3b4
    ldr r1, L_021fe33c
    mov r0, #0x0
    str r5, [r1, #0x0]
    str r0, [r1, #0x70]
    mov r0, #0x1
    str r0, [r1, #-0x4c]
L_021fe284:
    ldr r0, L_021fe340
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x2]
    tst r0, #0x2
    beq L_021fe2d0
    ldr r0, L_021fe344
    mov r1, #0x10
    str r1, [r9, #0x6c]
    ldr r1, [r0, #0x14]
    ldr r2, [r0, #0x10]
    sub r0, r1, #0x48
    str r0, [sp, #0x34]
    add r1, sp, #0x30
    str r2, [sp, #0x30]
    add r0, r9, #0x24
    ldmia r1, {r1, r2}
    bl func_ov012_021fd148
L_021fe2d0:
    mov r0, #0x0
    add sp, sp, #0x70
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe2dc: .word 0x7fff
L_021fe2e0: .word data_ov012_021fe51c
L_021fe2e4: .word data_020f4e14
L_021fe2e8: .word gDebugFont
L_021fe2ec: .word data_ov012_021fe6ec
L_021fe2f0: .word data_ov012_021fe6f4
L_021fe2f4: .word data_ov012_021fe460
L_021fe2f8: .word data_ov012_021fe500
L_021fe2fc: .word data_ov012_021fe6fc
L_021fe300: .word data_ov012_021fe700
L_021fe304: .word data_ov012_021fe704
L_021fe308: .word data_ov012_021fe70c
L_021fe30c: .word data_ov012_021fe714
L_021fe310: .word data_ov012_021fe71c
L_021fe314: .word data_ov012_021fe724
L_021fe318: .word data_ov012_021fe728
L_021fe31c: .word data_ov012_021fe730
L_021fe320: .word data_ov012_021fe73c
L_021fe324: .word data_ov012_021fe744
L_021fe328: .word data_ov012_021fe74c
L_021fe32c: .word 0x4000444
L_021fe330: .word 0x40004c0
L_021fe334: .word 0x4000448
L_021fe338: .word 0x40004ac
L_021fe33c: .word 0x4000494
L_021fe340: .word 0x4000540
L_021fe344: .word data_ov012_021fe4d0
    .size func_ov012_021fd73c, . - func_ov012_021fd73c
