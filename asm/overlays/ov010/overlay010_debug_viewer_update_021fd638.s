    .text
    .extern DebugText_Printf
    .extern data_020f4e14
    .extern data_ov010_021fe9c8
    .extern data_ov010_021fea38
    .extern data_ov010_021fea48
    .extern data_ov010_021fec94
    .extern data_ov010_021fec9c
    .extern data_ov010_021feca0
    .extern data_ov010_021feca4
    .extern data_ov010_021feca8
    .extern data_ov010_021fecb4
    .extern data_ov010_021fecc0
    .extern data_ov010_021feccc
    .extern data_ov010_021fecd8
    .extern data_ov010_021fece0
    .extern data_ov010_021fece8
    .extern data_ov010_021fecf4
    .extern data_ov010_021fed00
    .extern data_ov010_021fed10
    .extern data_ov010_021fed28
    .extern data_ov010_021fed3c
    .extern data_ov010_021fed44
    .extern data_ov010_021fed4c
    .extern func_0207043c
    .extern func_02070454
    .extern func_02070464
    .extern func_020755bc
    .extern func_02075858
    .extern func_02076be8
    .extern func_02076c20
    .extern func_020773a8
    .extern Graphics3DResourceOwner_RenderManagers
    .extern Graphics3DSceneState_Apply
    .extern Graphics3DResourceBinding_GetTextureFormat
    .extern Graphics3DResourceBinding_GetTextureWidthClass
    .extern Graphics3DResourceBinding_GetTextureHeightClass
    .extern func_020b0300
    .extern func_020b0558
    .extern func_ov010_021fce94
    .extern func_ov010_021fd39c
    .extern func_ov010_021fd408
    .extern func_ov010_021fd45c
    .extern func_ov010_021fd520
    .extern func_ov010_021fd564
    .extern func_ov010_021fd5a8
    .extern func_ov010_021fe88c
    .extern func_ov010_021fe8b8
    .extern func_ov010_021fe8f8
    .extern func_ov010_021fe91c
    .extern gDebugFont

/* Exact fallback; see documented control reconstruction in
 * src/overlays/ov010/overlay010_debug_viewer_update.c. */
    .global func_ov010_021fd638
func_ov010_021fd638: ; 0x021fd638
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x9c
    mov r9, r0
    ldr r1, [r9, #0x50]
    ldrh r1, [r1, #0x2]
    tst r1, #0x8
    beq L_021fd658
    bl func_ov010_021fd39c
L_021fd658:
    ldr r1, [r9, #0x50]
    ldrh r0, [r1, #0x0]
    tst r0, #0x100
    beq L_021fd6fc
    tst r0, #0x20
    beq L_021fd68c
    ldr r1, [r9, #0x158]
    mvn r0, #0x7f
    sub r1, r1, #0x1
    str r1, [r9, #0x158]
    cmp r1, r0
    strlt r0, [r9, #0x158]
    b L_021fd6ac
L_021fd68c:
    tst r0, #0x10
    beq L_021fd6ac
    ldr r0, [r9, #0x158]
    add r0, r0, #0x1
    str r0, [r9, #0x158]
    cmp r0, #0x80
    movge r0, #0x7f
    strge r0, [r9, #0x158]
L_021fd6ac:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x80
    beq L_021fd6d8
    ldr r1, [r9, #0x15c]
    mvn r0, #0x5f
    sub r1, r1, #0x1
    str r1, [r9, #0x15c]
    cmp r1, r0
    strlt r0, [r9, #0x15c]
    b L_021fdae0
L_021fd6d8:
    tst r0, #0x40
    beq L_021fdae0
    ldr r0, [r9, #0x15c]
    add r0, r0, #0x1
    str r0, [r9, #0x15c]
    cmp r0, #0x60
    movge r0, #0x5f
    strge r0, [r9, #0x15c]
    b L_021fdae0
L_021fd6fc:
    ldrh r0, [r1, #0x6]
    tst r0, #0x200
    beq L_021fd720
    ldr r0, [r9, #0x17c]
    add r0, r0, #0x1
    str r0, [r9, #0x17c]
    cmp r0, #0x3
    movge r0, #0x0
    strge r0, [r9, #0x17c]
L_021fd720:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x40
    beq L_021fd748
    ldr r0, [r9, #0x150]
    subs r0, r0, #0x1
    str r0, [r9, #0x150]
    movmi r0, #0xa
    strmi r0, [r9, #0x150]
    b L_021fd768
L_021fd748:
    tst r0, #0x80
    beq L_021fd768
    ldr r0, [r9, #0x150]
    add r0, r0, #0x1
    str r0, [r9, #0x150]
    cmp r0, #0xb
    movge r0, #0x0
    strge r0, [r9, #0x150]
L_021fd768:
    ldr r0, [r9, #0x174]
    cmp r0, #0x0
    bne L_021fd7a4
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x2]
    tst r0, #0x1
    ldrne r1, [r9, #0x8c]
    cmpne r1, #0x0
    beq L_021fd7a4
    mov r0, #0x0
    strb r0, [r1, #0x55]
    str r0, [r1, #0x30]
    ldrh r0, [r1, #0x50]
    bic r0, r0, #0x1
    strh r0, [r1, #0x50]
L_021fd7a4:
    ldr r0, [r9, #0x150]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fdae0
L_021fd7b4: ; jump table
    b L_021fd7e0 ; case 0
    b L_021fd820 ; case 1
    b L_021fd878 ; case 2
    b L_021fd8d4 ; case 3
    b L_021fd944 ; case 4
    b L_021fd978 ; case 5
    b L_021fd9ac ; case 6
    b L_021fd9f0 ; case 7
    b L_021fda24 ; case 8
    b L_021fda58 ; case 9
    b L_021fda88 ; case 10
L_021fd7e0:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdae0
    mov r3, #0x1
    str r3, [sp, #0x0]
    ldr r1, [r9, #0x14c]
    mov r0, r9
    mov r2, #0x0
    bl func_ov010_021fd5a8
    str r0, [r9, #0x14c]
    mov r0, r9
    bl func_ov010_021fd408
    mov r0, r9
    bl func_ov010_021fd45c
    b L_021fdae0
L_021fd820:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdae0
    ldr r1, [r9, #0x14c]
    mov r0, #0x1
    str r0, [sp, #0x0]
    add r0, r9, r1, lsl #0x2
    ldr r2, [r0, #0x134]
    ldr r1, [r0, #0x13c]
    mov r0, r9
    sub r3, r2, #0x1
    mov r2, #0x0
    bl func_ov010_021fd5a8
    ldr r1, [r9, #0x14c]
    add r1, r9, r1, lsl #0x2
    str r0, [r1, #0x13c]
    mov r0, r9
    bl func_ov010_021fd408
    mov r0, r9
    bl func_ov010_021fd45c
    b L_021fdae0
L_021fd878:
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fdae0
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdae0
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r9, #0x84]
    ldr r1, [r9, #0x144]
    ldr r2, [r0, #0x20]
    mov r0, r9
    ldr r3, [r2, #0x4]
    mov r2, #0x0
    sub r3, r3, #0x1
    bl func_ov010_021fd5a8
    mov r1, r0
    str r0, [r9, #0x144]
    ldr r0, [r9, #0x8c]
    and r1, r1, #0xff
    bl func_02076be8
    b L_021fdae0
L_021fd8d4:
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fdae0
    ldr r0, [r9, #0x174]
    cmp r0, #0x0
    bne L_021fdae0
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdae0
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x84]
    ldr r0, [r9, #0x144]
    ldr r2, [r1, #0x24]
    ldr r1, [r9, #0x148]
    add r0, r2, r0, lsl #0x3
    ldrh r3, [r0, #0x2]
    mov r0, r9
    mov r2, #0x0
    sub r3, r3, #0x1
    bl func_ov010_021fd5a8
    mov r1, r0
    str r0, [r9, #0x148]
    ldr r0, [r9, #0x8c]
    and r1, r1, #0xff
    bl func_02076c20
    b L_021fdae0
L_021fd944:
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fdae0
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdae0
    ldr r0, [r9, #0x174]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x174]
    b L_021fdae0
L_021fd978:
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fdae0
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdae0
    ldr r0, [r9, #0x178]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r9, #0x178]
    b L_021fdae0
L_021fd9ac:
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fdae0
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x20
    addne r0, r9, #0x100
    ldrnesh r1, [r0, #0x70]
    subne r1, r1, #0x100
    strneh r1, [r0, #0x70]
    bne L_021fdae0
    tst r0, #0x10
    addne r0, r9, #0x100
    ldrnesh r1, [r0, #0x70]
    addne r1, r1, #0x100
    strneh r1, [r0, #0x70]
    b L_021fdae0
L_021fd9f0:
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fdae0
    mov r0, #0x80
    str r0, [sp, #0x0]
    mov r2, #0x4000
    ldr r1, [r9, #0x164]
    mov r0, r9
    rsb r2, r2, #0x0
    mov r3, #0x4000
    bl func_ov010_021fd520
    str r0, [r9, #0x164]
    b L_021fdae0
L_021fda24:
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fdae0
    mov r0, #0x80
    str r0, [sp, #0x0]
    mov r2, #0x4000
    ldr r1, [r9, #0x168]
    mov r0, r9
    rsb r2, r2, #0x0
    mov r3, #0x4000
    bl func_ov010_021fd520
    str r0, [r9, #0x168]
    b L_021fdae0
L_021fda58:
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fdae0
    mov r2, #0x10
    str r2, [sp, #0x0]
    ldr r1, [r9, #0x16c]
    mov r0, r9
    sub r2, r2, #0x810
    mov r3, #0x800
    bl func_ov010_021fd564
    str r0, [r9, #0x16c]
    b L_021fdae0
L_021fda88:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fdae0
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r1, [r9, #0x154]
    mov r0, r9
    mov r2, #0x0
    mov r3, #0x1f
    bl func_ov010_021fd564
    orr r1, r0, r0, lsl #0x5
    orr r1, r1, r0, lsl #0xa
    mov r1, r1, lsl #0x10
    str r0, [r9, #0x154]
    mov r4, #0x0
    mov r0, r1, lsr #0x10
    ldr r2, L_021fe81c
    mov r1, #0x1f
    mov r3, #0x3f
    str r4, [sp, #0x0]
    bl func_020b0300
L_021fdae0:
    ldr r2, [r9, #0x8c]
    cmp r2, #0x0
    beq L_021fdba4
    ldr r0, [r9, #0x158]
    ldr r1, [r9, #0x15c]
    mov r0, r0, lsl #0x4
    str r0, [r2, #0x20]
    mov r0, r1, lsl #0x4
    str r0, [r2, #0x24]
    mov r0, #0x0
    str r0, [r2, #0x28]
    ldr r0, [r9, #0x174]
    ldr r1, [r9, #0x8c]
    cmp r0, #0x0
    ldreqh r0, [r1, #0x50]
    biceq r0, r0, #0x2
    beq L_021fdb3c
    ldrh r0, [r1, #0x50]
    orr r0, r0, #0x2
    strh r0, [r1, #0x50]
    ldr r1, [r9, #0x8c]
    ldrh r0, [r1, #0x50]
    bic r0, r0, #0x1
L_021fdb3c:
    strh r0, [r1, #0x50]
    ldr r0, [r9, #0x178]
    ldr r1, [r9, #0x8c]
    cmp r0, #0x0
    ldrneh r0, [r1, #0x50]
    orrne r0, r0, #0x200
    ldreqh r0, [r1, #0x50]
    biceq r0, r0, #0x200
    strh r0, [r1, #0x50]
    add r0, r9, #0x100
    ldrsh r1, [r0, #0x70]
    ldr r0, [r9, #0x8c]
    strh r1, [r0, #0x4c]
    ldr r0, [r9, #0x164]
    ldr r1, [r9, #0x8c]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r1, #0x34]
    ldr r0, [r9, #0x168]
    ldr r1, [r9, #0x8c]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r1, #0x38]
    ldr r1, [r9, #0x16c]
    ldr r0, [r9, #0x8c]
    strh r1, [r0, #0x52]
L_021fdba4:
    ldr r0, [r9, #0x88]
    bl func_020773a8
    ldr r1, [r9, #0x8c]
    cmp r1, #0x0
    beq L_021fdbd0
    ldrh r0, [r1, #0x50]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldreqb r0, [r1, #0x55]
    streq r0, [r9, #0x148]
L_021fdbd0:
    ldr r0, L_021fe820
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fe824
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x100
    beq L_021fdc1c
    ldr r1, L_021fe828
    ldr r0, L_021fe824
    str r1, [sp, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, #0x3
    bl DebugText_Printf
    b L_021fe424
L_021fdc1c:
    ldr r2, [r9, #0x14c]
    ldr r1, L_021fe82c
    ldr r0, L_021fe824
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0x1
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    mov r3, #0x6
    bl DebugText_Printf
    ldr r1, [r9, #0x14c]
    ldr r0, L_021fe824
    add r1, r9, r1, lsl #0x2
    ldr r4, [r1, #0x90]
    ldr r1, [r1, #0x13c]
    mov r2, #0x3
    add r1, r4, r1, lsl #0x5
    add r1, r1, #0xc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r2
    mov r1, #0x1
    bl DebugText_Printf
    ldr r5, L_021fe830
    add r7, sp, #0x48
    mov r4, #0x5
L_021fdc84:
    ldmia r5!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne L_021fdc84
    ldr r0, [r5, #0x0]
    ldr r4, L_021fe824
    str r0, [r7, #0x0]
    ldr r0, [sp, #0x4c]
    ldr r7, [sp, #0x98]
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0x8c]
    ldr r8, [sp, #0x84]
    str r0, [sp, #0x38]
    ldr r0, [sp, #0x50]
    ldr r11, [sp, #0x94]
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x88]
    mov r5, #0x0
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x5c]
    add r10, r9, #0x100
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x60]
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x64]
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x68]
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x6c]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x70]
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x74]
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x78]
    str r0, [sp, #0x10]
L_021fdd14:
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fdfbc
    cmp r5, #0xa
    addls pc, pc, r5, lsl #0x2
    b L_021fe08c
L_021fdd2c: ; jump table
    b L_021fdd58 ; case 0
    b L_021fdd80 ; case 1
    b L_021fddb0 ; case 2
    b L_021fdde0 ; case 3
    b L_021fde18 ; case 4
    b L_021fde44 ; case 5
    b L_021fde70 ; case 6
    b L_021fded0 ; case 7
    b L_021fdf14 ; case 8
    b L_021fdf58 ; case 9
    b L_021fdf9c ; case 10
L_021fdd58:
    ldr r0, [r9, #0x14c]
    mov r1, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    mov r3, r7
    bl func_02075858
    b L_021fe08c
L_021fdd80:
    ldr r0, [r9, #0x14c]
    mov r1, #0x1
    add r3, r9, r0, lsl #0x2
    ldr r0, [r3, #0x13c]
    add r2, r5, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r3, #0x134]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x48]
    bl func_02075858
    b L_021fe08c
L_021fddb0:
    ldr r0, [r9, #0x144]
    ldr r3, [sp, #0x3c]
    str r0, [sp, #0x0]
    ldr r0, [r9, #0x84]
    mov r1, #0x1
    ldr r0, [r0, #0x20]
    add r2, r5, #0x5
    ldr r0, [r0, #0x4]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x0]
    bl func_02075858
    b L_021fe08c
L_021fdde0:
    ldr r0, [r9, #0x148]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r2, [r9, #0x84]
    ldr r0, [r9, #0x144]
    ldr r3, [r2, #0x24]
    add r2, r5, #0x5
    add r0, r3, r0, lsl #0x3
    ldrh r0, [r0, #0x2]
    ldr r3, [sp, #0x38]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x0]
    bl func_02075858
    b L_021fe08c
L_021fde18:
    ldr r0, [r9, #0x174]
    ldr r3, [sp, #0x34]
    cmp r0, #0x0
    ldrne r0, L_021fe834
    mov r1, #0x1
    ldreq r0, L_021fe838
    add r2, r5, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    bl func_02075858
    b L_021fe08c
L_021fde44:
    ldr r0, [r9, #0x178]
    ldr r3, [sp, #0x30]
    cmp r0, #0x0
    ldrne r0, L_021fe834
    mov r1, #0x1
    ldreq r0, L_021fe838
    add r2, r5, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    bl func_02075858
    b L_021fe08c
L_021fde70:
    ldrsh r1, [r10, #0x70]
    cmp r1, #0x0
    bge L_021fdea8
    rsb r1, r1, #0x0
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x2c]
    mov r1, #0x1
    add r2, r5, #0x5
    bl func_02075858
    b L_021fe08c
L_021fdea8:
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x28]
    mov r1, #0x1
    add r2, r5, #0x5
    bl func_02075858
    b L_021fe08c
L_021fded0:
    ldr r0, [r9, #0x164]
    mov r1, #0x1
    cmp r0, #0x0
    bge L_021fdefc
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x24]
    add r2, r5, #0x5
    bl func_02075858
    b L_021fe08c
L_021fdefc:
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x20]
    add r2, r5, #0x5
    bl func_02075858
    b L_021fe08c
L_021fdf14:
    ldr r0, [r9, #0x168]
    mov r1, #0x1
    cmp r0, #0x0
    bge L_021fdf40
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x1c]
    add r2, r5, #0x5
    bl func_02075858
    b L_021fe08c
L_021fdf40:
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x18]
    add r2, r5, #0x5
    bl func_02075858
    b L_021fe08c
L_021fdf58:
    ldr r0, [r9, #0x16c]
    mov r1, #0x1
    cmp r0, #0x0
    bge L_021fdf84
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x14]
    add r2, r5, #0x5
    bl func_02075858
    b L_021fe08c
L_021fdf84:
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x10]
    add r2, r5, #0x5
    bl func_02075858
    b L_021fe08c
L_021fdf9c:
    ldr r0, [r9, #0x154]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    mov r3, r8
    bl func_02075858
    b L_021fe08c
L_021fdfbc:
    ldr r0, [r9, #0x12c]
    cmp r0, #0x0
    beq L_021fe08c
    cmp r5, #0xa
    addls pc, pc, r5, lsl #0x2
    b L_021fe08c
L_021fdfd4: ; jump table
    b L_021fe000 ; case 0
    b L_021fe028 ; case 1
    b L_021fe058 ; case 2
    b L_021fe058 ; case 3
    b L_021fe058 ; case 4
    b L_021fe058 ; case 5
    b L_021fe058 ; case 6
    b L_021fe058 ; case 7
    b L_021fe058 ; case 8
    b L_021fe058 ; case 9
    b L_021fe070 ; case 10
L_021fe000:
    ldr r0, [r9, #0x14c]
    mov r1, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    mov r3, r7
    bl func_02075858
    b L_021fe08c
L_021fe028:
    ldr r0, [r9, #0x14c]
    mov r1, #0x1
    add r3, r9, r0, lsl #0x2
    ldr r0, [r3, #0x13c]
    add r2, r5, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r3, #0x134]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x48]
    bl func_02075858
    b L_021fe08c
L_021fe058:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    add r2, r5, #0x5
    mov r3, r11
    bl func_02075858
    b L_021fe08c
L_021fe070:
    ldr r0, [r9, #0x154]
    mov r1, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, r5, #0x5
    mov r3, r8
    bl func_02075858
L_021fe08c:
    add r5, r5, #0x1
    cmp r5, #0xb
    blt L_021fdd14
    ldr r1, L_021fe83c
    ldr r0, L_021fe824
    str r1, [sp, #0x0]
    ldr r1, [r9, #0x150]
    ldr r0, [r0, #0x0]
    add r2, r1, #0x5
    mov r1, #0x1
    mov r3, #0x2
    bl DebugText_Printf
    ldr r0, [r9, #0x8c]
    cmp r0, #0x0
    beq L_021fe2f0
    ldr r1, [r0, #0x14]
    ldr r0, L_021fe824
    ldr r1, [r1, #0x10]
    ldr r3, L_021fe840
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    mov r2, #0x8
    bl func_02075858
    ldr r1, [r9, #0x8c]
    ldr r0, L_021fe824
    ldr r1, [r1, #0x18]
    ldr r3, L_021fe844
    ldr r2, [r1, #0x10]
    mov r1, #0x12
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl func_02075858
    ldr r1, [r9, #0x8c]
    ldr r0, L_021fe824
    ldr r1, [r1, #0x1c]
    ldr r3, L_021fe848
    ldr r2, [r1, #0x10]
    mov r1, #0x12
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl func_02075858
    ldr r1, [r9, #0x8c]
    ldr r0, L_021fe824
    ldr r2, [r1, #0x14]
    mov r1, #0x12
    ldr r3, [r2, #0x18]
    mov r2, #0xc
    str r3, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fe84c
    bl func_02075858
    ldr r1, [r9, #0x8c]
    ldr r0, L_021fe824
    ldr r2, [r1, #0x18]
    mov r1, #0x12
    ldr r3, [r2, #0x18]
    mov r2, #0xd
    str r3, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fe850
    bl func_02075858
    ldr r1, [r9, #0x8c]
    ldr r0, L_021fe824
    ldr r2, [r1, #0x1c]
    mov r1, #0x12
    ldr r3, [r2, #0x18]
    mov r2, #0xe
    str r3, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fe854
    bl func_02075858
    ldr r0, [r9, #0x8c]
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
    ldr r0, L_021fe824
    ldr r3, L_021fe858
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    mov r2, #0x10
    bl func_02075858
    ldr r0, [r9, #0x8c]
    mov r2, #0x11
    ldr r0, [r0, #0x18]
    ldr r1, [r0, #0x20]
    ldrh r0, [r1, #0x4]
    cmp r0, #0x0
    bne L_021fe234
    ldrh r1, [r1, #0x6]
    ldr r0, L_021fe824
    ldr r3, L_021fe85c
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    bl func_02075858
    b L_021fe254
L_021fe234:
    str r0, [sp, #0x0]
    ldrh r1, [r1, #0x6]
    ldr r0, L_021fe824
    ldr r3, L_021fe860
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    bl func_02075858
L_021fe254:
    ldr r8, [r9, #0x8c]
    ldr r5, L_021fe820
    ldrb r4, [r8, #0x55]
    ldr r2, [r8, #0x1c]
    ldr r3, L_021fe864
    str r4, [sp, #0x0]
    ldr r7, [r8, #0x30]
    mov r1, #0x1
    mov r0, r7, asr #0x7
    add r0, r7, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x4]
    ldrb r7, [r8, #0x54]
    ldr r8, [r2, #0x24]
    ldr r0, [r2, #0x28]
    mov r7, r7, lsl #0x3
    ldrh r7, [r8, r7]
    ldr r8, [r2, #0x2c]
    mov r2, #0x15
    add r4, r7, r4
    mov r4, r4, lsl #0x2
    ldrh r0, [r0, r4]
    add r0, r8, r0, lsl #0x2
    ldrh r0, [r0, #0x2]
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x0]
    bl func_02075858
    ldr r0, [r9, #0x174]
    cmp r0, #0x0
    bne L_021fe424
    ldr r1, L_021fe868
    mov r0, r5
    str r1, [sp, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, #0x16
    bl DebugText_Printf
    b L_021fe424
L_021fe2f0:
    ldr r0, [r9, #0x12c]
    cmp r0, #0x0
    beq L_021fe424
    ldr r1, [r0, #0x4]
    ldr r0, L_021fe824
    ldr r1, [r1, #0x10]
    ldr r3, L_021fe840
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    mov r2, #0x8
    bl func_02075858
    ldr r1, [r9, #0x12c]
    ldr r0, L_021fe824
    ldr r1, [r1, #0x8]
    ldr r3, L_021fe844
    ldr r2, [r1, #0x10]
    mov r1, #0x12
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl func_02075858
    ldr r1, [r9, #0x12c]
    ldr r0, L_021fe824
    ldr r1, [r1, #0x4]
    ldr r3, L_021fe84c
    ldr r2, [r1, #0x18]
    mov r1, #0x12
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl func_02075858
    ldr r1, [r9, #0x12c]
    ldr r0, L_021fe824
    ldr r2, [r1, #0x8]
    mov r1, #0x12
    ldr r3, [r2, #0x18]
    mov r2, #0xc
    str r3, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fe850
    bl func_02075858
    ldr r0, [r9, #0x12c]
    ldr r5, [r0, #0x4]
    mov r0, r5
    bl func_02070464
    mov r4, r0
    mov r0, r5
    bl func_02070454
    stmia sp, {r0, r4}
    ldr r0, L_021fe824
    ldr r3, L_021fe86c
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    mov r2, #0xe
    bl func_02075858
    ldr r0, [r9, #0x12c]
    mov r2, #0xf
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x20]
    ldrh r1, [r0, #0x4]
    cmp r1, #0x0
    bne L_021fe40c
    ldrh r1, [r0, #0x6]
    ldr r0, L_021fe824
    ldr r3, L_021fe85c
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x12
    bl func_02075858
    b L_021fe424
L_021fe40c:
    ldr r0, L_021fe824
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, L_021fe870
    mov r1, #0x12
    bl func_02075858
L_021fe424:
    ldr r0, L_021fe824
    ldr r3, L_021fe874
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x17
    bl func_02075858
    bl func_020b0558
    add r0, r9, #0x98
    bl Graphics3DSceneState_Apply
    ldr r0, [r9, #0x17c]
    cmp r0, #0x2
    beq L_021fe618
    cmp r0, #0x0
    moveq r6, #0x1000
    rsbeq r6, r6, #0x0
    beq L_021fe46c
    cmp r0, #0x1
    moveq r6, #0x1000
L_021fe46c:
    ldr r0, [r9, #0x130]
    ldr r0, [r0, #0x4]
    bl func_02070454
    ldr r1, [r9, #0x130]
    mov r5, r0
    ldr r0, [r1, #0x4]
    bl func_02070464
    mov r4, r0
    mov r0, #0x0
    ldr r1, L_021fe878
    mov r2, #0x10000
    str r0, [r1, #0x0]
    ldr r7, [r9, #0x15c]
    ldr r3, [r9, #0x158]
    add r7, r7, #0x100
    mov r7, r7, lsl #0x4
    sub r3, r3, #0x100
    mov r3, r3, lsl #0x4
    str r3, [r1, #0x2c]
    str r7, [r1, #0x2c]
    str r0, [r1, #0x2c]
    str r2, [r1, #0x28]
    str r2, [r1, #0x28]
    mov r2, #0x1000
    str r2, [r1, #0x28]
    mov r1, #0x1f
    str r1, [sp, #0x0]
    mov r1, r0
    str r0, [sp, #0x4]
    mov r2, #0x3
    mov r3, #0x3e
    bl func_ov010_021fe88c
    ldr r7, [r9, #0x130]
    mov r0, r7
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r10, r0
    ldr r0, [r9, #0x130]
    bl Graphics3DResourceBinding_GetTextureWidthClass
    mov r8, r0
    mov r0, r7
    bl Graphics3DResourceBinding_GetTextureHeightClass
    mov r2, r8
    mov r3, r0
    mov r0, r10
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    ldr r7, [r7, #0x10]
    ldr r7, [r7, #0xc]
    str r7, [sp, #0xc]
    bl func_ov010_021fe8b8
    ldr r0, [r9, #0x130]
    ldr r1, [r0, #0x14]
    ldr r7, [r1, #0xc]
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r1, r0
    mov r0, r7
    bl func_ov010_021fe8f8
    mov r1, #0x1
    ldr r3, L_021fe87c
    rsb r0, r1, #0x8000
    str r1, [r3, #0x0]
    str r0, [r3, #-0x80]
    mov r0, r6, lsl #0x10
    mov r1, r0, asr #0x10
    mov r0, #0x0
    mov r2, r1, lsl #0x10
    mov r6, r4, lsl #0xd
    str r0, [r3, #-0x78]
    mov r1, r6
    mov r2, r2, lsr #0x10
    str r0, [r3, #-0x74]!
    str r2, [r3, #0x0]
    bl func_ov010_021fe91c
    mov r0, r4, lsl #0x1
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r5, r5, lsl #0x1
    mov r4, r0, lsr #0x10
    mov r7, r5, lsl #0xc
    ldr r2, L_021fe880
    mov r3, r4, lsl #0x10
    mov r0, r7
    mov r1, r6
    str r3, [r2, #0x0]
    bl func_ov010_021fe91c
    mov r0, r5, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    ldr r2, L_021fe880
    orr r3, r5, r4, lsl #0x10
    mov r0, r7
    mov r1, #0x0
    str r3, [r2, #0x0]
    bl func_ov010_021fe91c
    ldr r1, L_021fe880
    mov r0, #0x0
    str r5, [r1, #0x0]
    str r0, [r1, #0x70]
    mov r0, #0x1
    str r0, [r1, #-0x4c]
L_021fe618:
    ldr r0, [r9, #0x12c]
    cmp r0, #0x0
    beq L_021fe7b8
    ldr r0, [r0, #0x4]
    bl func_02070454
    ldr r1, [r9, #0x12c]
    mov r5, r0
    ldr r0, [r1, #0x4]
    bl func_02070464
    mov r4, r0
    mov r0, #0x0
    ldr r6, L_021fe878
    mov r1, #0x10000
    str r0, [r6, #0x0]
    ldr r3, [r9, #0x15c]
    ldr r2, [r9, #0x158]
    add r3, r3, #0x60
    mov r3, r3, lsl #0x4
    sub r2, r2, #0x80
    mov r2, r2, lsl #0x4
    str r2, [r6, #0x2c]
    str r3, [r6, #0x2c]
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
    bl func_ov010_021fe88c
    ldr r6, [r9, #0x12c]
    mov r0, r6
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r8, r0
    ldr r0, [r9, #0x12c]
    bl Graphics3DResourceBinding_GetTextureWidthClass
    mov r7, r0
    mov r0, r6
    bl Graphics3DResourceBinding_GetTextureHeightClass
    mov r2, r7
    mov r3, r0
    mov r0, r8
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r6, [r6, #0x10]
    mov r1, #0x1
    ldr r6, [r6, #0xc]
    str r6, [sp, #0xc]
    bl func_ov010_021fe8b8
    ldr r0, [r9, #0x12c]
    ldr r1, [r0, #0x14]
    ldr r6, [r1, #0xc]
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r1, r0
    mov r0, r6
    bl func_ov010_021fe8f8
    mov r2, #0x1
    ldr r1, L_021fe87c
    rsb r0, r2, #0x8000
    str r2, [r1, #0x0]
    str r0, [r1, #-0x80]
    mov r0, #0x0
    mov r6, r4, lsl #0xc
    str r0, [r1, #-0x78]
    sub r2, r1, #0x74
    str r0, [r2, #0x0]
    mov r1, r6
    str r0, [r2, #0x0]
    bl func_ov010_021fe91c
    rsb r0, r4, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    mov r7, r5, lsl #0xc
    ldr r2, L_021fe880
    mov r3, r4, lsl #0x10
    mov r0, r7
    mov r1, r6
    str r3, [r2, #0x0]
    bl func_ov010_021fe91c
    mov r0, r5, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    ldr r2, L_021fe880
    orr r3, r5, r4, lsl #0x10
    mov r0, r7
    mov r1, #0x0
    str r3, [r2, #0x0]
    bl func_ov010_021fe91c
    ldr r1, L_021fe880
    mov r0, #0x0
    str r5, [r1, #0x0]
    str r0, [r1, #0x70]
    mov r0, #0x1
    str r0, [r1, #-0x4c]
L_021fe7b8:
    ldr r0, [r9, #0x78]
    add r1, r9, #0xf0
    bl Graphics3DResourceOwner_RenderManagers
    ldr r0, L_021fe884
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x2]
    tst r0, #0x2
    beq L_021fe810
    ldr r0, L_021fe888
    mov r1, #0x10
    str r1, [r9, #0x6c]
    ldr r1, [r0, #0x34]
    ldr r2, [r0, #0x30]
    sub r0, r1, #0x48
    str r0, [sp, #0x44]
    add r1, sp, #0x40
    str r2, [sp, #0x40]
    add r0, r9, #0x24
    ldmia r1, {r1, r2}
    bl func_ov010_021fce94
L_021fe810:
    mov r0, #0x0
    add sp, sp, #0x9c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe81c: .word 0x7fff
L_021fe820: .word data_020f4e14
L_021fe824: .word gDebugFont
L_021fe828: .word data_ov010_021fec94
L_021fe82c: .word data_ov010_021fea48
L_021fe830: .word data_ov010_021fe9c8
L_021fe834: .word data_ov010_021fec9c
L_021fe838: .word data_ov010_021feca0
L_021fe83c: .word data_ov010_021feca4
L_021fe840: .word data_ov010_021feca8
L_021fe844: .word data_ov010_021fecb4
L_021fe848: .word data_ov010_021fecc0
L_021fe84c: .word data_ov010_021feccc
L_021fe850: .word data_ov010_021fecd8
L_021fe854: .word data_ov010_021fece0
L_021fe858: .word data_ov010_021fece8
L_021fe85c: .word data_ov010_021fecf4
L_021fe860: .word data_ov010_021fed00
L_021fe864: .word data_ov010_021fed10
L_021fe868: .word data_ov010_021fed28
L_021fe86c: .word data_ov010_021fed3c
L_021fe870: .word data_ov010_021fed44
L_021fe874: .word data_ov010_021fed4c
L_021fe878: .word 0x4000444
L_021fe87c: .word 0x4000500
L_021fe880: .word 0x4000494
L_021fe884: .word 0x4000540
L_021fe888: .word data_ov010_021fea38

    .size func_ov010_021fd638, . - func_ov010_021fd638
