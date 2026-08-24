.text

/* Exact fallback; see src/overlays/ov037/overlay037_presentation_construct.c for documented portable C. */

    .extern SceneInputBase_Init
    .extern func_02092364
    .extern func_ov043_0220b740
    .extern G3X_Init
    .extern func_020923a4
    .extern GraphicsSpriteRenderer_Suspend
    .extern GraphicsSpriteRenderer_HideAllSprites
    .extern func_020ae7b0
    .extern func_020ae6dc
    .extern Heap_Alloc
    .extern Graphics3DResourceOwner_Init
    .extern func_ov048_0220b7b8
    .extern TitlePalette_SetMainBackdrop
    .extern func_020b0300
    .extern func_ov037_021fd7e4
    .extern func_ov037_021fe4d4
    .extern data_ov037_021fee94
    .extern data_020f4e14
    .extern gDebugFont
    .extern data_ov037_021feec8
    .extern gHeapContext
    .extern data_ov037_021feed0
    .extern data_ov037_021fec98

    .global func_ov037_021fe4fc
func_ov037_021fe4fc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl SceneInputBase_Init
    ldr r1, L_021fe624
    add r0, r4, #0x60
    str r1, [r4, #0x0]
    bl func_02092364
    add r0, r4, #0x94
    bl func_ov043_0220b740 ; func_ov044_0220b740, func_ov045_0220b740, func_ov046_0220b740, func_ov047_0220b740, func_ov048_0220b740, func_ov049_0220b740
    str r5, [r4, #0x54]
    bl G3X_Init
    mov r0, #0x0
    str r0, [r4, #0x50]
    add r0, r4, #0x60
    bl func_020923a4
    ldr r0, L_021fe628
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Suspend
    ldr r0, L_021fe628
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    bl func_020ae7b0
    ldr r0, L_021fe62c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Suspend
    ldr r0, L_021fe62c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    bl func_020ae6dc
    ldr r0, L_021fe630
    ldr r1, L_021fe634
    mov r2, #0x4
    ldr r3, L_021fe638
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe59c
    mov r1, #0x4
    mov r2, #0x2
    bl Graphics3DResourceOwner_Init
L_021fe59c:
    str r0, [r4, #0x58]
    add r0, r4, #0x94
    bl func_ov048_0220b7b8
    mov r1, #0x11
    mov r0, #0x0
    str r1, [r4, #0x48]
    bl TitlePalette_SetMainBackdrop
    mov r0, #0x0
    ldr r2, L_021fe63c
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    str r0, [r4, #0x5c]
    mov r0, #0x1e0
    ldr r1, L_021fe640
    mov r2, #0x4
    ldr r3, L_021fe638
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe5fc
    ldr r1, [r4, #0x58]
    bl func_ov037_021fd7e4
L_021fe5fc:
    str r0, [r4, #0x5c]
    ldr r0, [r4, #0x20]
    ldr r1, L_021fe644
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov037_021fe4d4
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fe624: .word data_ov037_021fee94
L_021fe628: .word data_020f4e14
L_021fe62c: .word gDebugFont
L_021fe630: .word 0x624
L_021fe634: .word data_ov037_021feec8
L_021fe638: .word gHeapContext
L_021fe63c: .word 0x7fff
L_021fe640: .word data_ov037_021feed0
L_021fe644: .word data_ov037_021fec98
    .size func_ov037_021fe4fc, .-func_ov037_021fe4fc
