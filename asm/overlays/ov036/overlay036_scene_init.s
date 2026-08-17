.text

/* Exact fallback; see src/overlays/ov036/overlay036_scene_init.c for documented portable C. */

    .extern SceneInputBase_Init
    .extern func_02092364
    .extern func_ov043_0220b740
    .extern G3X_Init
    .extern func_020923a4
    .extern func_02075238
    .extern GraphicsSpriteRenderer_HideAllSprites
    .extern func_020ae6dc
    .extern Heap_Alloc
    .extern Graphics3DResourceOwner_Init
    .extern func_ov048_0220b7b8
    .extern TitlePalette_SetMainBackdrop
    .extern func_020b0300
    .extern func_ov036_021fea14
    .extern func_ov036_021ff214
    .extern func_ov036_0220059c
    .extern func_ov036_0220102c
    .extern func_ov036_022021b0
    .extern func_ov036_022029d8
    .extern func_ov036_02203db0
    .extern func_ov036_022045ac
    .extern data_ov036_02206124
    .extern data_020f4e14
    .extern gDebugFont
    .extern data_ov036_022061a8
    .extern gHeapContext
    .extern data_ov036_022061b0
    .extern data_ov036_02205af0

    .global func_ov036_022045d4
func_ov036_022045d4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl SceneInputBase_Init
    ldr r1, L_022048b0
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
    ldr r0, L_022048b4
    ldr r0, [r0, #0x0]
    bl func_02075238
    ldr r0, L_022048b4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    ldr r0, L_022048b8
    ldr r0, [r0, #0x0]
    bl func_02075238
    ldr r0, L_022048b8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    bl func_020ae6dc
    ldr r0, L_022048bc
    ldr r1, L_022048c0
    ldr r3, L_022048c4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02204690
    mov r1, #0x4
    mov r2, #0x2
    bl Graphics3DResourceOwner_Init
L_02204690:
    str r0, [r4, #0x5c]
    add r0, r4, #0x98
    bl func_ov048_0220b7b8
    mov r1, #0x11
    mov r0, #0x0
    str r1, [r4, #0x48]
    bl TitlePalette_SetMainBackdrop
    mov r0, #0x0
    ldr r2, L_022048c8
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    str r0, [r4, #0x60]
    ldr r0, [r4, #0x58]
    cmp r0, #0x1
    bne L_02204708
    ldr r1, L_022048cc
    ldr r3, L_022048c4
    mov r0, #0x120
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02204700
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov036_021fea14
L_02204700:
    str r0, [r4, #0x60]
    b L_0220488c
L_02204708:
    ldr r1, [r4, #0x54]
    cmp r1, #0x258
    bgt L_02204754
    bge L_022047d0
    cmp r1, #0x4d
    ble L_02204770
    sub r0, r1, #0x64
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b L_02204770
L_02204730: ; jump table
    b L_02204800 ; case 0
    b L_02204830 ; case 1
    b L_02204860 ; case 2
    b L_02204800 ; case 3
    b L_02204830 ; case 4
    b L_02204860 ; case 5
    b L_02204800 ; case 6
    b L_02204830 ; case 7
    b L_02204860 ; case 8
L_02204754:
    ldr r0, L_022048d0
    cmp r1, r0
    bgt L_02204768
    beq L_022047a0
    b L_02204770
L_02204768:
    add r0, r0, #0x1
    cmp r1, r0
L_02204770:
    ldr r1, L_022048cc
    ldr r3, L_022048c4
    mov r0, #0x138
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02204798
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov036_021ff214
L_02204798:
    str r0, [r4, #0x60]
    b L_0220488c
L_022047a0:
    ldr r1, L_022048cc
    ldr r3, L_022048c4
    mov r0, #0x148
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022047c8
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov036_0220059c
L_022047c8:
    str r0, [r4, #0x60]
    b L_0220488c
L_022047d0:
    ldr r1, L_022048cc
    ldr r3, L_022048c4
    mov r0, #0x1a4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022047f8
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov036_0220102c
L_022047f8:
    str r0, [r4, #0x60]
    b L_0220488c
L_02204800:
    ldr r1, L_022048cc
    ldr r3, L_022048c4
    mov r0, #0x160
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02204828
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov036_022021b0
L_02204828:
    str r0, [r4, #0x60]
    b L_0220488c
L_02204830:
    ldr r1, L_022048cc
    ldr r3, L_022048c4
    mov r0, #0x1a4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02204858
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov036_022029d8
L_02204858:
    str r0, [r4, #0x60]
    b L_0220488c
L_02204860:
    ldr r1, L_022048cc
    ldr r3, L_022048c4
    mov r0, #0x134
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02204888
    ldr r1, [r4, #0x5c]
    ldr r2, [r4, #0x54]
    bl func_ov036_02203db0
L_02204888:
    str r0, [r4, #0x60]
L_0220488c:
    ldr r0, [r4, #0x20]
    ldr r1, L_022048d4
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov036_022045ac
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_022048b0: .word data_ov036_02206124
L_022048b4: .word data_020f4e14
L_022048b8: .word gDebugFont
L_022048bc: .word 0x624
L_022048c0: .word data_ov036_022061a8
L_022048c4: .word gHeapContext
L_022048c8: .word 0x7fff
L_022048cc: .word data_ov036_022061b0
L_022048d0: .word 0x259
L_022048d4: .word data_ov036_02205af0
    .size func_ov036_022045d4, .-func_ov036_022045d4

