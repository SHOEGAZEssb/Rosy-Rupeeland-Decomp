.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry_state.c. */
.extern data_020f4e14
.extern data_021f3ecc
.extern data_ov025_02202e60
.extern data_ov025_02202e68
.extern data_ov025_02202f84
.extern data_ov025_02202f86
.extern data_ov025_02202f88
.extern data_ov025_02202fc0
.extern data_ov025_0220305a
.extern data_ov025_022030f4
.extern data_ov025_0220318e
.extern data_ov025_02203228
.extern data_ov025_0220322a
.extern data_ov025_022033b4
.extern data_ov025_022033bc
.extern DisplayBrightness_IsMainTransitionComplete
.extern func_02071eb8
.extern func_02074110
.extern func_0207419c
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_020791e0
.extern func_0207f248
.extern func_0207f86c
.extern func_02092260
.extern func_020922f0
.extern func_02092314
.extern func_020927b8
.extern func_02092910
.extern func_02092c8c
.extern func_02092e9c
.extern func_02093360
.extern func_02095860
.extern func_02095928
.extern func_02095940
.extern func_02095988
.extern func_02095dd4
.extern func_ov025_021fce00
.extern func_ov025_021fd03c
.extern func_ov025_021fd160
.extern func_ov025_021fd2e8
.extern func_ov025_021fd314
.extern func_ov025_021fd340
.extern func_ov025_021fd388
.extern func_ov025_021fd3dc
.extern func_ov025_021fd3f4
.extern func_ov025_021fd450
.extern func_ov025_021fd488
.extern func_ov025_021fd5dc
.extern func_ov025_021fd9e4
.extern func_ov025_021ff0b0
.extern func_ov025_021ff254
.extern func_ov025_02200014
.extern func_ov025_022000a4
.extern func_ov025_02200178
.extern func_ov025_022001f4
.extern func_ov025_02200224
.extern func_ov025_022002b0
.extern func_ov025_02200398
.extern func_ov025_02200438
.extern func_ov025_02200468
.extern func_ov025_02200480
.extern func_ov025_02200564
.extern func_ov025_0220058c
.extern func_ov025_022005e4
.extern func_ov025_02200648
.extern func_ov025_02200940
.extern func_ov094_022198e8
.extern GameWork_SetFlag
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gRuntimeContext
.extern gSystemState
.extern Heap_Alloc
.extern Heap_Free


    .global func_ov025_02201f28
func_ov025_02201f28:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    cmp r1, #0x15
    bgt L_02201fa0
    cmp r1, #0x0
    addge pc, pc, r1, lsl #0x2
    b L_02202ad4
L_02201f48: ; jump table
    b L_02201fac ; case 0
    b L_02201fd8 ; case 1
    b L_022020e0 ; case 2
    b L_02202104 ; case 3
    b L_0220268c ; case 4
    b L_02202ad4 ; case 5
    b L_02202ad4 ; case 6
    b L_02202ad4 ; case 7
    b L_02202ad4 ; case 8
    b L_02202ad4 ; case 9
    b L_022026fc ; case 10
    b L_02202788 ; case 11
    b L_02202808 ; case 12
    b L_02202848 ; case 13
    b L_02202ad4 ; case 14
    b L_02202ad4 ; case 15
    b L_02202ad4 ; case 16
    b L_02202ad4 ; case 17
    b L_02202ad4 ; case 18
    b L_02202ad4 ; case 19
    b L_02202888 ; case 20
    b L_02202a48 ; case 21
L_02201fa0:
    cmp r1, #0x1e
    beq L_02202a68
    b L_02202ad4
L_02201fac:
    mov r1, #0xe2
    mov r2, #0x10
    bl func_02092314
    mov r0, #0x3
    sub r1, r0, #0x13
    bl func_02092c8c
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_02201fd8:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ad4
    mov r0, r5
    mov r1, #0xe8
    bl func_020922f0
    mov r0, r5
    bl func_ov025_022000a4
    mov r0, r5
    bl func_ov025_02200564
    mov r0, r5
    bl func_ov025_022005e4
    ldr r0, [r5, #0x5c0]
    mov r1, #0x0
    bl func_ov094_022198e8 ; func_ov097_022198e8
    mov r4, #0x0
L_02202018:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0xe4]
    ldr r0, [r0, #0xc]
    bl func_02074110
    add r4, r4, #0x1
    cmp r4, #0x3
    blt L_02202018
    ldr r0, L_02202ae4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_02202ae8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_02202aec
    mov r1, #0x6b
    bl func_020791e0
    mov r1, r0
    ldr r0, [r5, #0x50c]
    mov r2, #0x3
    bl func_02092e9c
    ldr r0, [r5, #0x50c]
    mov r1, #0x0
    bl func_02093360
    mov r0, #0x1a0
    ldr r1, L_02202af0
    mov r2, #0x4
    ldr r3, L_02202af4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202094
    bl func_ov025_021fce00
L_02202094:
    str r0, [r5, #0x598]
    ldr r1, [r5, #0x574]
    bl func_ov025_021fd160
    add r0, r5, #0xf0
    mov r1, #0x2d
    bl func_02095988
    add r0, r5, #0xf0
    bl func_02095928
    add r0, r5, #0x248
    bl func_02095928
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02202ad4
L_022020e0:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ad4
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02202ad4
L_02202104:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02202ad4
    add r0, r5, #0xf0
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_022021e4
    ldr r0, [r5, #0x598]
    bl func_ov025_021fd450
    cmp r0, #0x0
    beq L_022021d4
    ldr r0, [r5, #0x598]
    add r1, r5, #0x510
    bl func_ov025_021fd488
    cmp r0, #0x0
    mov r0, r5
    beq L_022021a8
    mov r1, #0x9
    bl func_02092260
    ldr r0, L_02202ae8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_02202aec
    mov r1, #0x28
    bl func_020791e0
    mov r1, r0
    ldr r0, [r5, #0x50c]
    mov r2, #0x3
    bl func_02092e9c
    mov r0, #0x1
    sub r1, r0, #0x9
    bl func_02092c8c
    mov r0, #0x1e
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_02202ad4
L_022021a8:
    mov r1, #0xe8
    mov r2, #0x1
    bl func_02092314
    mov r0, r5
    mov r1, #0xe9
    bl func_020922f0
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_02202ad4
L_022021d4:
    mov r0, r5
    mov r1, #0x9
    bl func_02092260
    b L_02202ad4
L_022021e4:
    add r0, r5, #0x248
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_02202248
    ldr r2, [r5, #0x598]
    mov r3, #0x0
    mov r0, r5
    mov r1, #0x3
    str r3, [r2, #0x17c]
    bl func_02092260
    mov r0, #0x3
    sub r1, r0, #0x13
    bl func_02092c8c
    mov r0, r5
    mov r1, #0xe8
    mov r2, #0x10
    bl func_02092314
    mov r0, #0x14
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_02202ad4
L_02202248:
    ldr r0, [r5, #0x598]
    add r1, r5, #0x30
    ldr r0, [r0, #0x34]
    bl func_02092910
    cmp r0, #0x0
    beq L_022022a4
    mov r0, r5
    mov r1, #0xb
    bl func_02092260
    ldr r0, L_02202af8
    ldrb r0, [r0, #0x5f]
    cmp r0, #0x0
    ldrne r1, L_02202afc
    ldr r0, [r5, #0x598]
    ldreq r1, L_02202b00
    str r1, [r0, #0x178]
    ldr r0, [r5, #0x598]
    ldr r1, [r5, #0x574]
    bl func_ov025_021fd160
    ldr r0, [r5, #0x598]
    mov r1, #0x1
    bl func_ov025_021fd2e8
    b L_02202664
L_022022a4:
    ldr r0, [r5, #0x598]
    add r1, r5, #0x30
    ldr r0, [r0, #0x38]
    bl func_02092910
    cmp r0, #0x0
    beq L_02202300
    mov r0, r5
    mov r1, #0xb
    bl func_02092260
    ldr r0, L_02202af8
    ldrb r0, [r0, #0x5f]
    cmp r0, #0x0
    ldrne r1, L_02202b04
    ldr r0, [r5, #0x598]
    ldreq r1, L_02202b08
    str r1, [r0, #0x178]
    ldr r0, [r5, #0x598]
    ldr r1, [r5, #0x574]
    bl func_ov025_021fd160
    ldr r0, [r5, #0x598]
    mov r1, #0x2
    bl func_ov025_021fd2e8
    b L_02202664
L_02202300:
    ldr r0, [r5, #0x598]
    add r1, r5, #0x30
    ldr r0, [r0, #0x3c]
    bl func_02092910
    cmp r0, #0x0
    beq L_02202358
    mov r0, r5
    mov r1, #0xb
    bl func_02092260
    ldr r0, L_02202af8
    ldrb r0, [r0, #0x5f]
    cmp r0, #0x0
    ldreq r0, [r5, #0x598]
    ldreq r1, L_02202afc
    streq r1, [r0, #0x178]
    ldr r0, [r5, #0x598]
    ldr r1, [r5, #0x574]
    bl func_ov025_021fd160
    ldr r0, [r5, #0x598]
    mov r1, #0x3
    bl func_ov025_021fd2e8
    b L_02202664
L_02202358:
    ldr r0, [r5, #0x598]
    add r1, r5, #0x30
    ldr r0, [r0, #0x30]
    bl func_02092910
    cmp r0, #0x0
    ldr r0, [r5, #0x598]
    beq L_022023c8
    ldr r0, [r0, #0x17c]
    cmp r0, #0x0
    mov r0, r5
    beq L_022023b0
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r5, #0x598]
    mov r2, #0x1
    ldr r0, [r1, #0x17c]
    sub r0, r0, #0x1
    str r0, [r1, #0x17c]
    ldr r0, [r5, #0x598]
    ldr r1, [r5, #0x574]
    bl func_ov025_021fd03c
    b L_022023b8
L_022023b0:
    mov r1, #0x9
    bl func_02092260
L_022023b8:
    ldr r0, [r5, #0x598]
    mov r1, #0x0
    bl func_ov025_021fd2e8
    b L_02202664
L_022023c8:
    add r1, r5, #0x30
    bl func_ov025_021fd340
    movs r4, r0
    bmi L_02202404
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    ldr r0, [r5, #0x598]
    mov r1, r4
    bl func_ov025_021fd388
    ldr r0, [r5, #0x598]
    ldr r1, [r5, #0x574]
    mov r2, #0x0
    bl func_ov025_021fd03c
    b L_02202664
L_02202404:
    mov r4, #0x0
    b L_0220265c
L_0220240c:
    ldr r0, [r5, #0x598]
    add r1, r5, #0x30
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0x40]
    bl func_02092910
    cmp r0, #0x0
    beq L_02202658
    ldr r10, [r5, #0x598]
    mov r1, r4, lsl #0x1
    ldr r2, [r10, #0x178]
    ldr r0, L_02202b0c
    ldrh r1, [r2, r1]
    mov r8, #0x0
    cmp r1, r0
    bne L_02202524
    ldr r1, [r10, #0x17c]
    cmp r1, #0x0
    beq L_02202614
    sub r2, r1, #0x1
    add r1, r10, r2, lsl #0x1
    mov r0, r8
    add r1, r1, #0x100
    ldr r7, L_02202b10
    b L_022024c0
L_0220246c:
    mov r3, r0, lsl #0x2
    ldrh r9, [r1, #0x80]
    ldrh r6, [r7, r3]
    cmp r6, r9
    bne L_0220249c
    ldr r1, L_02202b14
    add r0, r10, r2, lsl #0x1
    ldrh r1, [r1, r3]
    add r0, r0, #0x100
    mov r8, #0x1
    strh r1, [r0, #0x80]
    b L_022024c8
L_0220249c:
    add r3, r7, r3
    ldrh r3, [r3, #0x2]
    cmp r3, r9
    addeq r0, r10, r2, lsl #0x1
    addeq r0, r0, #0x100
    streqh r6, [r0, #0x80]
    moveq r8, #0x1
    beq L_022024c8
    add r0, r0, #0x1
L_022024c0:
    cmp r0, #0x29
    blt L_0220246c
L_022024c8:
    cmp r8, #0x0
    bne L_02202614
    mov r1, #0x0
    ldr r10, L_02202b18
    mov r3, #0x6
    b L_02202518
L_022024e0:
    mul r0, r1, r3
    ldr r6, [r5, #0x598]
    add r7, r10, r0
    add r6, r6, r2, lsl #0x1
    add r6, r6, #0x100
    ldrh r9, [r7, #0x4]
    ldrh r7, [r6, #0x80]
    cmp r9, r7
    ldreq r1, L_02202b1c
    moveq r8, #0x1
    ldreqh r0, [r1, r0]
    streqh r0, [r6, #0x80]
    beq L_02202614
    add r1, r1, #0x1
L_02202518:
    cmp r1, #0xa
    blt L_022024e0
    b L_02202614
L_02202524:
    add r0, r0, #0x1
    cmp r1, r0
    ldr r0, [r10, #0x17c]
    bne L_022025e0
    cmp r0, #0x0
    beq L_02202614
    sub r7, r0, #0x1
    add r0, r10, r7, lsl #0x1
    mov r9, r8
    add r0, r0, #0x100
    ldr r3, L_02202b18
    mov r11, #0x6
    b L_022025d4
L_02202558:
    mul lr, r9, r11
    ldrh r6, [r0, #0x80]
    ldrh r2, [r3, lr]
    add ip, r3, lr
    cmp r2, r6
    bne L_0220258c
    ldr r1, L_02202b20
    add r0, r10, r7, lsl #0x1
    ldrh r1, [r1, lr]
    add r0, r0, #0x100
    mov r8, #0x1
    strh r1, [r0, #0x80]
    b L_02202614
L_0220258c:
    ldrh r1, [ip, #0x2]
    cmp r1, r6
    bne L_022025b4
    ldr r1, L_02202b20
    add r0, r10, r7, lsl #0x1
    ldrh r1, [r1, lr]
    add r0, r0, #0x100
    mov r8, #0x1
    strh r1, [r0, #0x80]
    b L_02202614
L_022025b4:
    ldrh r1, [ip, #0x4]
    cmp r1, r6
    addeq r0, r10, r7, lsl #0x1
    addeq r0, r0, #0x100
    streqh r2, [r0, #0x80]
    moveq r8, #0x1
    beq L_02202614
    add r9, r9, #0x1
L_022025d4:
    cmp r9, #0xa
    blt L_02202558
    b L_02202614
L_022025e0:
    cmp r0, #0x8
    bge L_02202614
    add r0, r10, r0, lsl #0x1
    cmp r1, #0x40
    addeq r0, r0, #0x100
    streqh r8, [r0, #0x80]
    addne r0, r0, #0x100
    strneh r1, [r0, #0x80]
    ldr r1, [r5, #0x598]
    mov r8, #0x1
    ldr r0, [r1, #0x17c]
    add r0, r0, #0x1
    str r0, [r1, #0x17c]
L_02202614:
    cmp r8, #0x0
    beq L_0220263c
    ldr r0, [r5, #0x598]
    ldr r1, [r5, #0x574]
    mov r2, #0x1
    bl func_ov025_021fd03c
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    b L_02202648
L_0220263c:
    mov r0, r5
    mov r1, #0x9
    bl func_02092260
L_02202648:
    ldr r0, [r5, #0x598]
    mov r1, r4
    bl func_ov025_021fd314
    b L_02202664
L_02202658:
    add r4, r4, #0x1
L_0220265c:
    cmp r4, #0x4d
    blt L_0220240c
L_02202664:
    ldr r0, [r5, #0x598]
    ldr r0, [r0, #0x174]
    cmp r0, #0x0
    beq L_02202ad4
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02202ad4
L_0220268c:
    ldr r0, [r5, #0x598]
    ldr r1, [r0, #0x174]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq L_02202ad4
    bl func_ov025_021fd450
    cmp r0, #0x0
    add r0, r5, #0xf0
    beq L_022026c4
    mov r1, #0x2c
    bl func_02095988
    b L_022026cc
L_022026c4:
    mov r1, #0x2d
    bl func_02095988
L_022026cc:
    ldr r0, [r5, #0x598]
    bl func_ov025_021fd3dc
    ldr r0, [r5, #0x598]
    ldr r1, [r5, #0x574]
    mov r2, #0x1
    bl func_ov025_021fd03c
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02202ad4
L_022026fc:
    add r0, r5, #0xf0
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_02202ad4
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl func_ov025_02200398
    ldr r0, L_02202b24
    ldr r1, L_02202b28
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02202b24
    ldr r1, L_02202b2c
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02202b24
    ldr r1, L_02202b30
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, [r5, #0x598]
    bl func_ov025_021fd3f4
    ldr r0, L_02202b34
    ldr r1, [r5, #0x54]
    ldr r0, [r0, #0x0]
    ldr r2, [r5, #0x598]
    mov r3, #0x1
    add r2, r2, #0x180
    bl func_0207f86c
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02202ad4
L_02202788:
    ldr r0, L_02202b34
    ldr r0, [r0, #0x0]
    bl func_0207f248
    cmp r0, #0x0
    beq L_02202ad4
    mvn r1, #0x0
    cmp r0, r1
    mov r0, r5
    bne L_022027ec
    mov r1, #0x1
    bl func_ov025_02200438
    ldr r0, L_02202b34
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x10]
    cmp r0, #0x4
    bne L_02202ad4
    mov r0, r5
    mov r1, #0x1f
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02202b38
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02202ad4
L_022027ec:
    bl func_ov025_02200468
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02202ad4
L_02202808:
    bl func_ov025_02200480
    cmp r0, #0x0
    beq L_02202ad4
    mov r0, r5
    mov r1, #0x0
    bl func_ov025_02200438
    mov r0, r5
    mov r1, #0x19
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02202ad4
L_02202848:
    ldr r1, [r5, #0x20]
    ldr r0, [r5, #0x59c]
    mov r2, r1, lsl #0x1a
    add r1, r5, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02202ad4
    mov r0, #0x3
    sub r1, r0, #0x13
    bl func_02092c8c
    mov r0, #0x14
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_02202ad4
L_02202888:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ad4
    mov r0, r5
    bl func_ov025_022002b0
    ldr r0, [r5, #0x598]
    bl func_ov025_021fd450
    cmp r0, #0x0
    beq L_02202938
    ldr r0, [r5, #0x54]
    add r0, r5, r0, lsl #0x2
    ldr r4, [r0, #0xe4]
    cmp r4, #0x0
    beq L_022028e0
    ldr r0, [r4, #0xc]
    bl func_0207419c
    add r0, r4, #0x30
    bl func_020927b8
    mov r0, r4
    bl func_02071eb8
    mov r0, r4
    bl Heap_Free
L_022028e0:
    ldr r1, L_02202b3c
    ldr r3, L_02202af4
    mov r0, #0x90
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202904
    ldr r1, [r5, #0x54]
    bl func_ov025_021fd5dc
L_02202904:
    ldr r1, [r5, #0x54]
    mov r2, #0x1
    add r1, r5, r1, lsl #0x2
    str r0, [r1, #0xe4]
    ldr r1, [r5, #0x54]
    mov r0, r5
    add r1, r5, r1, lsl #0x2
    ldr r1, [r1, #0xe4]
    ldr r1, [r1, #0xc]
    str r2, [r1, #0x20]
    ldr r1, [r5, #0x54]
    bl func_ov025_02200648
    b L_02202964
L_02202938:
    mov r6, #0x0
    mov r4, r6
L_02202940:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0xe4]
    mov r1, r4
    bl func_ov025_021fd9e4
    add r6, r6, #0x1
    cmp r6, #0x3
    blt L_02202940
    mvn r0, #0x0
    str r0, [r5, #0x54]
L_02202964:
    ldr r0, [r5, #0x20]
    bic r0, r0, #0x400
    str r0, [r5, #0x20]
    ldr r4, [r5, #0x598]
    cmp r4, #0x0
    beq L_02202994
    ldr r0, [r4, #0x0]
    bl func_0207419c
    add r0, r4, #0x4
    bl func_02071eb8
    mov r0, r4
    bl Heap_Free
L_02202994:
    mov r0, #0x0
    str r0, [r5, #0x598]
    ldr r0, [r5, #0x20]
    mov r1, #0x1
    orr r0, r0, #0x400
    str r0, [r5, #0x20]
    ldr r0, [r5, #0x5c0]
    bl func_ov094_022198e8 ; func_ov097_022198e8
    mov r0, r5
    bl func_ov025_0220058c
    ldr r0, L_02202ae4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_02202ae8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r2, #0x0
    mov r1, #0x1
L_022029dc:
    add r0, r5, r2, lsl #0x2
    ldr r0, [r0, #0xe4]
    add r2, r2, #0x1
    ldr r0, [r0, #0xc]
    cmp r2, #0x3
    str r1, [r0, #0x20]
    blt L_022029dc
    mov r0, r5
    bl func_ov025_022001f4
    add r0, r5, #0xf0
    bl func_02095940
    add r0, r5, #0x248
    bl func_02095940
    mov r0, r5
    bl func_ov025_02200014
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    mov r0, r5
    mov r1, #0xe2
    bl func_020922f0
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02202ad4
L_02202a48:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ad4
    ldr r1, L_02202b40
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02202ad4
L_02202a68:
    mov r0, r5
    bl func_ov025_02200940
    cmp r0, #0x0
    beq L_02202ad4
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02202ad4
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    ldr r0, L_02202ae8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_02202aec
    mov r1, #0x6b
    bl func_020791e0
    mov r1, r0
    ldr r0, [r5, #0x50c]
    mov r2, #0x3
    bl func_02092e9c
    ldr r0, [r5, #0x50c]
    mov r1, #0x0
    bl func_02093360
    mov r0, #0x2
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
L_02202ad4:
    mov r0, r5
    bl func_ov025_02200178
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02202ae4: .word data_020f4e14
L_02202ae8: .word gDebugFont
L_02202aec: .word data_021f3ecc
L_02202af0: .word data_ov025_022033bc
L_02202af4: .word gHeapContext
L_02202af8: .word gSystemState
L_02202afc: .word data_ov025_02202fc0
L_02202b00: .word data_ov025_022030f4
L_02202b04: .word data_ov025_0220305a
L_02202b08: .word data_ov025_0220318e
L_02202b0c: .word 0x309b
L_02202b10: .word data_ov025_02203228
L_02202b14: .word data_ov025_0220322a
L_02202b18: .word data_ov025_02202f84
L_02202b1c: .word data_ov025_02202f86
L_02202b20: .word data_ov025_02202f88
L_02202b24: .word gGameWork
L_02202b28: .word 0x14b
L_02202b2c: .word 0x25d
L_02202b30: .word 0x3f5
L_02202b34: .word gRuntimeContext
L_02202b38: .word data_ov025_02202e68
L_02202b3c: .word data_ov025_022033b4
L_02202b40: .word data_ov025_02202e60
.size func_ov025_02201f28, .-func_ov025_02201f28

