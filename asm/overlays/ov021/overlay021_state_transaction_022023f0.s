    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_transaction.c. */
    .extern data_021f5128
    .extern data_ov021_02202cd0
    .extern data_ov021_02202d38
    .extern data_ov021_02202d58
    .extern data_ov021_02202d68
    .extern data_ov021_02202d90
    .extern data_ov021_02202fb8
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GamePhaseCurrencyHud_GetCurrency
    .extern GamePhaseCurrencyHud_AddCurrency
    .extern func_02062ca8
    .extern GraphicsSpriteText_FormatDecimal
    .extern func_0207ab48
    .extern func_0207c4cc
    .extern func_0207c5c8
    .extern func_0209189c
    .extern func_02092260
    .extern func_02092288
    .extern func_02092c8c
    .extern func_020939d8
    .extern func_020948e4
    .extern func_02094cf0
    .extern func_02095224
    .extern func_ov002_021fbe68
    .extern func_ov021_021fd1cc
    .extern func_ov021_021fd39c
    .extern func_ov021_021fd490
    .extern func_ov021_021fd7c0
    .extern func_ov021_021fe144
    .extern func_ov021_021fe6b0
    .extern func_ov021_021fee14
    .extern func_ov021_021fee54
    .extern func_ov021_021feea4
    .extern func_ov021_021ff050
    .extern func_ov021_021ff0c8
    .extern func_ov021_021ff0e0
    .extern func_ov021_021ff1d0
    .extern func_ov021_021ff274
    .extern func_ov021_021ff380
    .extern func_ov021_021ff3ac
    .extern func_ov021_021ff3d8
    .extern func_ov021_021ffa10
    .extern func_ov045_0220b924
    .extern func_ov045_0220b9b8
    .extern func_ov045_0220bc34
    .extern func_ov045_0220bc40
    .extern func_ov045_0220bd90
    .extern func_ov045_0220bdb0
    .extern func_ov045_0220bdd0
    .extern func_ov045_0220bdf0
    .extern gHeapContext
    .extern gLupyContext
    .extern Heap_Alloc

.global func_ov021_022023f0
func_ov021_022023f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x1e
    bgt L_02202458
    bge L_02202998
    cmp r1, #0x14
    bgt L_0220244c
    bge L_022028e0
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b L_02202ba8
L_02202420: ; jump table
    b L_0220247c ; case 0
    b L_0220249c ; case 1
    b L_022024fc ; case 2
    b L_02202544 ; case 3
    b L_0220270c ; case 4
    b L_02202ba8 ; case 5
    b L_02202ba8 ; case 6
    b L_02202ba8 ; case 7
    b L_02202ba8 ; case 8
    b L_02202ba8 ; case 9
    b L_022028a0 ; case 10
L_0220244c:
    cmp r1, #0x15
    beq L_02202940
    b L_02202ba8
L_02202458:
    cmp r1, #0x33
    bgt L_02202470
    bge L_02202b28
    cmp r1, #0x32
    beq L_02202aa8
    b L_02202ba8
L_02202470:
    cmp r1, #0x34
    beq L_02202b84
    b L_02202ba8
L_0220247c:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_0220249c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ba8
    mov r0, r4
    mov r1, #0x6c
    bl func_02092260
    ldr r1, L_02202bb8
    ldr r3, L_02202bbc
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022024d4
    bl func_ov045_0220bc40
L_022024d4:
    ldr r1, L_02202bc0
    str r0, [r4, #0x384]
    mov r2, #0x0
    bl func_02094cf0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ba8
L_022024fc:
    ldr r0, [r4, #0x384]
    bl func_02095224
    cmp r0, #0x0
    beq L_02202ba8
    add r0, r4, #0x2cc
    mov r1, #0x3c
    mov r2, #0x5a
    bl func_0209189c
    mov r0, r0, lsl #0x10
    ldr r2, [r4, #0x384]
    mov r0, r0, asr #0x10
    str r0, [r2, #0x7c]
    mov r1, #0x0
    str r1, [r2, #0x80]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b L_02202ba8
L_02202544:
    ldr r0, [r4, #0x384]
    bl func_ov021_021ff0c8
    cmp r0, #0x0
    beq L_02202ba8
    mov r0, r4
    mov r1, #0x6c
    bl func_02092288
    ldr r0, [r4, #0x2c8]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_022026f4
L_02202570: ; jump table
    b L_022026f4 ; case 0
    b L_02202584 ; case 1
    b L_022025d0 ; case 2
    b L_02202618 ; case 3
    b L_02202690 ; case 4
L_02202584:
    mov r0, r4
    mov r1, #0x6a
    bl func_02092260
    ldr r0, [r4, #0x2bc]
    ldr r1, [r4, #0x394]
    ldr r0, [r0, #0x8]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    ldr r0, [r4, #0x384]
    bgt L_022025b4
    bl func_ov045_0220bd90
    b L_022025c0
L_022025b4:
    bl func_ov045_0220bdf0
    mov r0, r4
    bl func_ov021_021ff380
L_022025c0:
    mov r0, r4
    mov r1, #0x6
    bl func_ov021_021ff0e0
    b L_022026f4
L_022025d0:
    mov r0, r4
    mov r1, #0x6b
    bl func_02092260
    ldr r0, [r4, #0x384]
    bl func_ov045_0220bdb0
    mov r0, r4
    bl func_ov021_021ff3ac
    ldr r1, [r4, #0x2bc]
    add r0, r4, #0x3b8
    ldr r1, [r1, #0x4]
    ldr r2, L_02202bc4
    ldr r1, [r1, #0x14]
    mov r3, #0x0
    bl GraphicsSpriteText_FormatDecimal
    mov r0, r4
    mov r1, #0x9
    bl func_ov021_021ff0e0
    b L_022026f4
L_02202618:
    mov r0, r4
    mov r1, #0x6a
    bl func_02092260
    ldr r1, [r4, #0x2bc]
    ldr r0, [r4, #0x394]
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x10]
    cmp r0, r1, lsl #0x1
    ldr r0, [r4, #0x384]
    blt L_02202668
    bl func_ov045_0220bd90
    mov r0, #0x1
    str r0, [r4, #0x3e8]
    ldr r0, [r4, #0x2bc]
    mov r1, #0x4
    bl func_0207c4cc
    mov r1, r0
    mov r0, r4
    bl func_ov021_021ff1d0
    b L_022026f4
L_02202668:
    bl func_ov045_0220bdf0
    mov r0, r4
    bl func_ov021_021ff380
    ldr r0, [r4, #0x2bc]
    mov r1, #0x3
    bl func_0207c4cc
    mov r1, r0
    mov r0, r4
    bl func_ov021_021ff1d0
    b L_022026f4
L_02202690:
    mov r0, r4
    mov r1, #0x6b
    bl func_02092260
    ldr r0, [r4, #0x384]
    bl func_ov045_0220bdb0
    mov r0, r4
    bl func_ov021_021ff3ac
    ldr r0, [r4, #0x2bc]
    ldr r2, [r4, #0x394]
    ldr r1, [r0, #0x4]
    ldr r1, [r1, #0x10]
    add r1, r1, r1, lsr #0x1f
    cmp r2, r1, asr #0x1
    bgt L_022026e0
    mov r1, #0x6
    bl func_0207c4cc
    mov r1, r0
    mov r0, r4
    bl func_ov021_021ff1d0
    b L_022026f4
L_022026e0:
    mov r1, #0x5
    bl func_0207c4cc
    mov r1, r0
    mov r0, r4
    bl func_ov021_021ff1d0
L_022026f4:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ba8
L_0220270c:
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x3e8]
    cmp r0, #0x0
    beq L_02202734
    mov r0, #0x0
    str r0, [r4, #0x3e8]
    ldr r0, [r4, #0x384]
    bl func_ov045_0220bdd0
L_02202734:
    ldr r0, [r4, #0x2c8]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_02202ba8
L_02202744: ; jump table
    b L_02202ba8 ; case 0
    b L_02202758 ; case 1
    b L_022027a0 ; case 2
    b L_022027f4 ; case 3
    b L_02202854 ; case 4
L_02202758:
    ldr r0, L_02202bc8
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    ldr r2, [r4, #0x394]
    mov r3, #0x0
    bl func_ov045_0220b924
    ldr r1, L_02202bc8
    mov r2, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r4, #0x394]
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_022027a0:
    ldr r1, [r4, #0x2bc]
    ldr r0, L_02202bc8
    ldr r1, [r1, #0x4]
    ldr r0, [r0, #0x0]
    ldr r5, [r1, #0x14]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    mov r2, r5
    mov r3, #0x0
    bl func_ov045_0220b924
    ldr r1, L_02202bc8
    mov r2, r0
    ldr r0, [r1, #0x0]
    mov r1, r5
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_022027f4:
    mov r0, #0x1
    str r0, [r4, #0x3d8]
    ldr r0, [r4, #0x2bc]
    ldr r1, [r4, #0x394]
    bl func_0207c5c8
    ldr r0, L_02202bc8
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    ldr r2, [r4, #0x394]
    mov r3, #0x1
    bl func_ov045_0220b924
    ldr r1, [r4, #0x394]
    ldr r3, L_02202bc8
    rsb r1, r1, #0x0
    mov r2, r0
    ldr r0, [r3, #0x0]
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0xa
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_02202854:
    ldr r0, L_02202bc8
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0x3ec]
    ldr r2, [r4, #0x394]
    mov r3, #0x1
    bl func_ov045_0220b924
    ldr r3, [r4, #0x394]
    ldr r1, L_02202bc8
    mov r2, r0
    ldr r0, [r1, #0x0]
    rsb r1, r3, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0x32
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_022028a0:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_02202ba8
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    mov r0, #0x1e
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_022028e0:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_02202ba8
    mov r0, r4
    bl func_ov021_021ff3d8
    ldr r0, [r4, #0x384]
    mov r1, #0x2
    add r0, r0, #0xc
    mov r2, #0x160
    bl func_020948e4
    ldr r2, [r4, #0x384]
    mov r0, #0x10
    str r0, [r2, #0x7c]
    mov r1, #0x0
    str r1, [r2, #0x80]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b L_02202ba8
L_02202940:
    ldr r0, [r4, #0x384]
    bl func_ov021_021ff0c8
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    beq L_02202968
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02202968:
    mov r0, #0x0
    str r0, [r4, #0x384]
    ldr r0, [r4, #0x388]
    bl func_020939d8
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    mov r0, #0x1e
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02202ba8
L_02202998:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ba8
    mov r0, r4
    bl func_ov021_021fee14
    mov r0, r4
    bl func_ov021_021fe6b0
    ldr r1, [r4, #0x2c4]
    mov r0, r4
    bl func_ov021_021ff050
    ldr r0, [r4, #0x37c]
    cmp r0, #0x0
    beq L_022029fc
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r0, [r4, #0x37c]
    bl func_02062ca8
    ldr r1, L_02202bcc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02202ba8
L_022029fc:
    ldr r0, [r4, #0x380]
    cmp r0, #0x0
    beq L_02202a38
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r0, [r4, #0x380]
    bl func_02062ca8
    ldr r1, L_02202bd0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02202ba8
L_02202a38:
    mov r0, r4
    bl func_ov021_021fe144
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd1cc
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd39c
    ldr r0, [r4, #0x2c0]
    bl func_ov021_021fd490
    mov r0, r4
    bl func_ov021_021fee54
    ldr r0, [r4, #0x2bc]
    bl func_ov021_021ffa10
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r1, [r4, #0x2bc]
    ldr r0, L_02202bd4
    ldr r1, [r1, #0x4]
    ldr r2, [r0, #0x0]
    ldr r0, [r4, #0x54]
    ldrh r1, [r1, #0x0]
    ldr r0, [r2, r0, lsl #0x2]
    bl func_0207ab48
    ldr r1, L_02202bd8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_02202ba8
L_02202aa8:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_02202ba8
    mov r0, r4
    bl func_ov021_021ff3d8
    ldr r0, [r4, #0x384]
    mov r1, #0x2
    add r0, r0, #0xc
    mov r2, #0x160
    bl func_020948e4
    ldr r1, [r4, #0x384]
    mov r0, #0x10
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x2bc]
    mov r1, #0x1
    bl func_0207c4cc
    mov r1, r0
    mov r0, r4
    bl func_ov021_021ff1d0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ba8
L_02202b28:
    bl func_ov021_021ff274
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x384]
    bl func_ov021_021ff0c8
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    beq L_02202b5c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02202b5c:
    mov r1, #0x0
    str r1, [r4, #0x384]
    mov r0, #0x1
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02202ba8
L_02202b84:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ba8
    ldr r0, [r4, #0x390]
    bl func_ov002_021fbe68
    ldr r1, L_02202bdc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
L_02202ba8:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02202bb8: .word data_ov021_02202fb8
L_02202bbc: .word gHeapContext
L_02202bc0: .word data_ov021_02202cd0
L_02202bc4: .word 0xff676980
L_02202bc8: .word gLupyContext
L_02202bcc: .word data_ov021_02202d68
L_02202bd0: .word data_ov021_02202d38
L_02202bd4: .word data_021f5128
L_02202bd8: .word data_ov021_02202d58
L_02202bdc: .word data_ov021_02202d90
.size func_ov021_022023f0, . - func_ov021_022023f0
