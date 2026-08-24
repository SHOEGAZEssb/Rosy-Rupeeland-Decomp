.text

/* Exact fallback; see src/overlays/ov035/overlay035_presentation_constructor.c for documented portable C. */

    .extern SceneInputBase_Init
    .extern func_02092364
    .extern func_ov043_0220b740
    .extern G3X_Init
    .extern func_020923a4
    .extern GraphicsSpriteRenderer_Suspend
    .extern GraphicsSpriteRenderer_HideAllSprites
    .extern func_020ae6dc
    .extern Heap_Alloc
    .extern Graphics3DResourceOwner_Init
    .extern func_ov048_0220b7b8
    .extern TitlePalette_SetMainBackdrop
    .extern func_020b0300
    .extern func_ov035_021fdd88
    .extern func_ov035_021feb7c
    .extern func_ov035_021ff478
    .extern func_ov035_021fff38
    .extern func_ov035_022008d0
    .extern func_ov035_022016e8
    .extern func_ov035_02202350
    .extern data_ov035_02203bb4
    .extern data_020f4e14
    .extern gDebugFont
    .extern data_ov035_02203d78
    .extern data_ov035_02203d80
    .extern data_ov035_022038e8
    .extern gHeapContext

    .global func_ov035_02202378
func_ov035_02202378:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl SceneInputBase_Init
    ldr r1, L_02202680
    add r0, r4, #0x64
    str r1, [r4, #0x0]
    bl func_02092364
    add r0, r4, #0x98
    bl func_ov043_0220b740 ; func_ov044_0220b740, func_ov045_0220b740, func_ov046_0220b740, func_ov047_0220b740, func_ov048_0220b740, func_ov049_0220b740
    str r5, [r4, #0x54]
    mov r0, #0x0
    str r0, [r4, #0x58]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    rsblt r0, r0, #0x0
    strlt r0, [r4, #0x54]
    movlt r0, #0x1
    strlt r0, [r4, #0x58]
    bl G3X_Init
    mov r1, #0x0
    add r0, r4, #0x64
    str r1, [r4, #0x50]
    bl func_020923a4
    ldr r0, L_02202684
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Suspend
    ldr r0, L_02202684
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    ldr r0, L_02202688
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Suspend
    ldr r0, L_02202688
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    bl func_020ae6dc
    ldr r0, L_0220268c
    ldr r1, L_02202690
    ldr r3, L_02202694
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202434
    mov r1, #0x4
    mov r2, #0x2
    bl Graphics3DResourceOwner_Init
L_02202434:
    str r0, [r4, #0x5c]
    add r0, r4, #0x98
    bl func_ov048_0220b7b8
    mov r1, #0x11
    mov r0, #0x0
    str r1, [r4, #0x48]
    bl TitlePalette_SetMainBackdrop
    mov r0, #0x0
    ldr r2, L_02202698
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    str r0, [r4, #0x60]
    ldr r0, [r4, #0x58]
    cmp r0, #0x1
    beq L_0220265c
    ldr r2, [r4, #0x54]
    ldr r1, L_0220269c
    cmp r2, r1
    bgt L_022024f4
    bge L_022025d0
    cmp r2, #0x12c
    bgt L_022024d0
    bge L_022025d0
    sub r0, r2, #0xc8
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b L_02202540
L_022024ac: ; jump table
    b L_02202540 ; case 0
    b L_02202570 ; case 1
    b L_022025a0 ; case 2
    b L_02202540 ; case 3
    b L_02202570 ; case 4
    b L_022025a0 ; case 5
    b L_02202540 ; case 6
    b L_02202570 ; case 7
    b L_022025a0 ; case 8
L_022024d0:
    ldr r0, L_022026a0
    cmp r2, r0
    bgt L_022024e4
    beq L_02202600
    b L_02202540
L_022024e4:
    add r0, r0, #0x1
    cmp r2, r0
    beq L_02202630
    b L_02202540
L_022024f4:
    add r0, r1, #0x3
    cmp r2, r0
    bgt L_02202524
    bge L_022025d0
    cmp r2, #0x130
    bgt L_02202514
    beq L_02202600
    b L_02202540
L_02202514:
    add r0, r1, #0x2
    cmp r2, r0
    beq L_02202630
    b L_02202540
L_02202524:
    add r0, r1, #0x4
    cmp r2, r0
    bgt L_02202538
    beq L_02202600
    b L_02202540
L_02202538:
    cmp r2, #0x134
    beq L_02202630
L_02202540:
    ldr r1, L_022026a4
    ldr r3, L_02202694
    mov r0, #0x150
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202568
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov035_021fdd88
L_02202568:
    str r0, [r4, #0x60]
    b L_0220265c
L_02202570:
    ldr r1, L_022026a4
    ldr r3, L_02202694
    mov r0, #0x144
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202598
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov035_021feb7c
L_02202598:
    str r0, [r4, #0x60]
    b L_0220265c
L_022025a0:
    ldr r1, L_022026a4
    ldr r3, L_02202694
    mov r0, #0x194
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022025c8
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov035_021ff478
L_022025c8:
    str r0, [r4, #0x60]
    b L_0220265c
L_022025d0:
    ldr r1, L_022026a4
    ldr r3, L_02202694
    mov r0, #0x180
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022025f8
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov035_021fff38
L_022025f8:
    str r0, [r4, #0x60]
    b L_0220265c
L_02202600:
    ldr r1, L_022026a4
    ldr r3, L_02202694
    mov r0, #0x178
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202628
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov035_022008d0
L_02202628:
    str r0, [r4, #0x60]
    b L_0220265c
L_02202630:
    ldr r1, L_022026a4
    ldr r3, L_02202694
    mov r0, #0x168
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202658
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov035_022016e8
L_02202658:
    str r0, [r4, #0x60]
L_0220265c:
    ldr r0, [r4, #0x20]
    ldr r1, L_022026a8
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov035_02202350
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_02202680: .word data_ov035_02203bb4
L_02202684: .word data_020f4e14
L_02202688: .word gDebugFont
L_0220268c: .word 0x624
L_02202690: .word data_ov035_02203d78
L_02202694: .word gHeapContext
L_02202698: .word 0x7fff
L_0220269c: .word 0x12f
L_022026a0: .word 0x12d
L_022026a4: .word data_ov035_02203d80
L_022026a8: .word data_ov035_022038e8
    .size func_ov035_02202378, .-func_ov035_02202378

