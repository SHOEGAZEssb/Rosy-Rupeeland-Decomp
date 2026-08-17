.text

/* Exact fallback; see src/overlays/ov035/overlay035_senary_scene_constructor.c for documented portable C. */

    .extern func_ov035_021fce00
    .extern GraphicsResourceSetVariant_Init
    .extern func_ov035_021fdce8
    .extern func_02091b6c
    .extern func_02091d08
    .extern GraphicsResourceSetVariant_Load
    .extern Graphics3DResourceOwner_PrepareResources
    .extern GraphicsArchive_AcquireOwlvResource
    .extern Graphics3DResourceOwner_CreateManager
    .extern Heap_Alloc
    .extern func_ov035_021fcf34
    .extern PresentationList_Append
    .extern Presentation_SetPosition
    .extern PresentationScalar_SetImmediate
    .extern func_ov035_021fdd70
    .extern func_ov035_021fdd78
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov035_021fdd28
    .extern AlternateSpritePresentation_Init
    .extern Presentation_SetScript
    .extern Presentation_InterpolateLinear
    .extern func_ov035_022016ac
    .extern func_020b035c
    .extern func_020b0374
    .extern func_020b0300
    .extern TitlePalette_SetMainBackdrop
    .extern func_02091d24
    .extern data_ov035_02203bd0
    .extern data_020f4e18
    .extern data_ov035_02203d48
    .extern data_ov035_02203d20
    .extern data_ov035_02202d74
    .extern data_ov035_02203630
    .extern data_ov035_02202b98
    .extern gHeapContext

    .global func_ov035_022016e8
func_ov035_022016e8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov035_021fce00
    ldr r1, L_02201b88
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0xe8
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0x10c
    bl func_ov035_021fdce8
    add r0, r5, #0x11c
    bl func_ov035_021fdce8
    add r0, r5, #0x12c
    bl func_02091b6c
    add r0, r5, #0x148
    bl func_02091d08
    ldr r3, L_02201b8c
    add r0, r5, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_02201b90
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_02201b94
    add r0, r5, #0xe8
    str r3, [sp, #0x0]
    ldr r1, L_02201b90
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xe8
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, L_02201b90
    ldr r1, L_02201b98
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireOwlvResource
    str r0, [r5, #0xfc]
    ldr r1, [r5, #0x4]
    ldr r0, L_02201b9c
    cmp r1, r0
    beq L_022017cc
    add r0, r0, #0x3
    cmp r1, r0
    beq L_02201804
    cmp r1, #0x134
    beq L_0220183c
    b L_02201870
L_022017cc:
    ldr r0, L_02201b90
    ldr r1, L_02201ba0
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireOwlvResource
    ldr r3, L_02201ba4
    str r0, [r5, #0x100]
    ldr r0, L_02201b90
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    b L_02201870
L_02201804:
    ldr r0, L_02201b90
    ldr r1, L_02201ba0
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireOwlvResource
    ldr r3, L_02201ba8
    str r0, [r5, #0x100]
    ldr r0, L_02201b90
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    b L_02201870
L_0220183c:
    ldr r0, L_02201b90
    ldr r1, L_02201bac
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireOwlvResource
    ldr r3, L_02201bb0
    str r0, [r5, #0x100]
    ldr r0, L_02201b90
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
L_02201870:
    mov r0, r4
    add r1, r5, #0xcc
    bl Graphics3DResourceOwner_PrepareResources
    mov r0, r4
    bl Graphics3DResourceOwner_CreateManager
    str r0, [r5, #0xf4]
    ldr r1, L_02201bb4
    ldr r3, L_02201bb8
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022018b4
    ldr r1, [r5, #0x100]
    mov r2, #0x0
    mov r3, #0x1
    bl func_ov035_021fcf34
L_022018b4:
    str r0, [r5, #0x104]
    mov r1, r0
    add r0, r5, #0x11c
    bl PresentationList_Append
    mov r2, #0x800
    ldr r0, [r5, #0x104]
    mov r1, #0x8000
    str r1, [r0, #0xb8]
    ldr r0, [r5, #0x104]
    sub r3, r2, #0x4800
    mov r1, #0x0
    bl Presentation_SetPosition
    ldr r0, [r5, #0x104]
    mov r1, #0x800
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r4, [r5, #0x104]
    ldr r1, L_02201bb4
    ldrh r3, [r4, #0x98]
    mov r0, #0xc4
    mov r2, #0x4
    orr r3, r3, #0x1
    strh r3, [r4, #0x98]
    ldr r3, L_02201bb8
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02201930
    ldr r1, [r5, #0xfc]
    mov r2, #0x3
    mov r3, #0x9
    bl func_ov035_021fcf34
L_02201930:
    str r0, [r5, #0x108]
    mov r1, r0
    add r0, r5, #0x11c
    bl PresentationList_Append
    mov r1, #0x0
    ldr r0, [r5, #0x108]
    mov r2, r1
    sub r3, r1, #0x4000
    bl Presentation_SetPosition
    ldr r0, [r5, #0x108]
    mov r1, #0x0
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r4, [r5, #0x108]
    mov r1, #0x0
    ldrh r3, [r4, #0x98]
    add r0, r5, #0xc
    mov r2, r1
    orr r3, r3, #0x1
    strh r3, [r4, #0x98]
    mov r3, #0x2980
    bl func_ov035_021fdd70
    mov r1, #0x0
    add r0, r5, #0xc
    mov r2, r1
    mov r3, r1
    bl func_ov035_021fdd78
    ldr r0, [r5, #0xf4]
    add r1, r5, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r2, #0x42
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_02201bbc
    ldr r3, L_02201bb8
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022019f4
    mov r1, r4
    bl AlternateSpritePresentation_Init
L_022019f4:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0x10c
    bl PresentationList_Append
    ldr r0, [r5, #0xd8]
    ldr r1, L_02201bc0
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r7, L_02201bc4
    mov r4, #0x0
    mov r9, #0x42
    mov r11, #0x18
    mov r6, #0x50
L_02201a28:
    ldr r0, [r5, #0xf4]
    add r1, r5, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    add r1, r4, #0x3
    stmib sp, {r1, r9}
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r10, r0
    bl func_ov035_021fdd28
    mov r0, r11
    mov r1, #0x8
    mov r2, #0x4
    mov r3, r4
    bl Presentation_InterpolateLinear
    strb r0, [r10, #0x5b]
    mov r0, #0x1f
    mov r1, #0x10
    mov r2, #0x4
    mov r3, r4
    bl Presentation_InterpolateLinear
    mov r8, r0
    mov r0, #0x1f
    mov r1, #0x0
    mov r2, #0x4
    mov r3, r4
    bl Presentation_InterpolateLinear
    orr r0, r0, r8, lsl #0xa
    strh r0, [r10, #0x4e]
    ldr r1, L_02201bbc
    ldr r3, L_02201bb8
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r8, r0
    beq L_02201acc
    mov r1, r10
    bl AlternateSpritePresentation_Init
    mov r8, r0
L_02201acc:
    mla r1, r4, r6, r7
    mov r0, #0x1
    str r0, [r8, #0x88]
    mov r0, r8
    mov r2, #0x1
    bl Presentation_SetScript
    mov r1, r8
    add r0, r5, #0x10c
    bl PresentationList_Append
    add r4, r4, #0x1
    cmp r4, #0x4
    blt L_02201a28
    mov r0, #0x1
    bl func_ov035_022016ac
    ldr r0, L_02201bc8
    bl func_020b035c
    ldr r4, L_02201bcc
    ldr r2, L_02201bd0
    ldrh r3, [r4, #0x0]
    mov r0, #0x1
    mov r1, #0x0
    and r3, r3, r2
    strh r3, [r4, #0x0]
    mov r2, #0x4
    mov r3, #0x6400
    bl func_020b0374
    mov r0, #0x0
    str r0, [r4, #0x2f8]
    ldr r2, L_02201bd4
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    bl TitlePalette_SetMainBackdrop
    mov r1, #0x0
    mov r3, #0x1
    add r0, r5, #0x148
    mov r2, r1
    str r3, [sp, #0x0]
    bl func_02091d24
    mov r0, #0x0
    str r0, [r5, #0x164]
    str r0, [r5, #0x160]
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02201b88: .word data_ov035_02203bd0
L_02201b8c: .word 0x6011
L_02201b90: .word data_020f4e18
L_02201b94: .word 0x6014
L_02201b98: .word 0x5004
L_02201b9c: .word 0x12e
L_02201ba0: .word 0x5005
L_02201ba4: .word 0x60cb
L_02201ba8: .word 0x60ce
L_02201bac: .word 0x5006
L_02201bb0: .word 0x60d1
L_02201bb4: .word data_ov035_02203d48
L_02201bb8: .word gHeapContext
L_02201bbc: .word data_ov035_02203d20
L_02201bc0: .word data_ov035_02202d74
L_02201bc4: .word data_ov035_02203630
L_02201bc8: .word data_ov035_02202b98
L_02201bcc: .word 0x4000060
L_02201bd0: .word 0xcfef
L_02201bd4: .word 0x7fff
    .size func_ov035_022016e8, .-func_ov035_022016e8

