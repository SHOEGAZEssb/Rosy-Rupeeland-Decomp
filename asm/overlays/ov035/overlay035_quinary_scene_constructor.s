.text

/* Exact fallback; see src/overlays/ov035/overlay035_quinary_scene_constructor.c for documented portable C. */

    .extern func_ov035_021fce00
    .extern GraphicsResourceSetVariant_Init
    .extern func_ov035_021fdce8
    .extern func_02091b6c
    .extern func_02091d08
    .extern GraphicsResourceSetVariant_Load
    .extern Graphics3DResourceOwner_PrepareResources
    .extern GraphicsArchive_AcquireOwlvResource
    .extern Graphics3DResourceOwner_CreateManager
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov035_021fdd28
    .extern Heap_Alloc
    .extern AlternateSpritePresentation_Init
    .extern PresentationList_Append
    .extern PresentationScalar_SetImmediate
    .extern func_ov035_021fd4b4
    .extern func_ov035_021fdd70
    .extern func_ov035_021fdd78
    .extern func_020b0374
    .extern func_020b0300
    .extern TitlePalette_SetMainBackdrop
    .extern func_02091d24
    .extern func_02091b98
    .extern data_ov035_02203c24
    .extern data_020f4e18
    .extern data_ov035_02203d20
    .extern data_ov035_02203d60
    .extern gHeapContext

    .global func_ov035_022008d0
func_ov035_022008d0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov035_021fce00
    ldr r1, L_02200d04
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0xe8
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0x108
    bl func_ov035_021fdce8
    add r0, r5, #0x118
    bl func_ov035_021fdce8
    add r0, r5, #0x128
    bl func_ov035_021fdce8
    add r0, r5, #0x138
    bl func_02091b6c
    add r0, r5, #0x154
    bl func_02091d08
    ldr r3, L_02200d08
    add r0, r5, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_02200d0c
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r1, [r5, #0x4]
    ldr r0, L_02200d10
    cmp r1, r0
    beq L_02200978
    cmp r1, #0x130
    beq L_022009bc
    add r0, r0, #0x6
    cmp r1, r0
    beq L_02200a00
L_02200978:
    ldr r3, L_02200d14
    ldr r0, L_02200d0c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r2, L_02200d18
    ldr r0, L_02200d0c
    str r2, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r2, #0x2
    mov r3, #0x6100
    bl GraphicsResourceSetVariant_Load
    b L_02200a40
L_022009bc:
    ldr r3, L_02200d14
    ldr r0, L_02200d0c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r3, L_02200d1c
    ldr r0, L_02200d0c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    b L_02200a40
L_02200a00:
    ldr r3, L_02200d14
    ldr r0, L_02200d0c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x2
    bl GraphicsResourceSetVariant_Load
    ldr r3, L_02200d20
    ldr r0, L_02200d0c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
L_02200a40:
    mov r0, r4
    add r1, r5, #0xe8
    bl Graphics3DResourceOwner_PrepareResources
    mov r0, r4
    add r1, r5, #0xcc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, L_02200d0c
    ldr r1, L_02200d24
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireOwlvResource
    str r0, [r5, #0xf4]
    mov r0, r4
    bl Graphics3DResourceOwner_CreateManager
    add r1, r5, #0xdc
    str r0, [r5, #0xf8]
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x7
    str r2, [sp, #0x4]
    mov r2, #0x46
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_02200d28
    ldr r3, L_02200d2c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200acc
    mov r1, r4
    bl AlternateSpritePresentation_Init
L_02200acc:
    str r0, [r5, #0xfc]
    mov r1, r0
    add r0, r5, #0x108
    bl PresentationList_Append
    ldr r0, [r5, #0xf8]
    add r1, r5, #0xe8
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r4, #0xa
    str r4, [sp, #0x4]
    mov r4, #0x42
    str r4, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_02200d28
    ldr r3, L_02200d2c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200b34
    mov r1, r4
    bl AlternateSpritePresentation_Init
L_02200b34:
    str r0, [r5, #0x100]
    mov r1, r0
    add r0, r5, #0x108
    bl PresentationList_Append
    ldr r0, [r5, #0xf8]
    add r1, r5, #0xe8
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0xa
    str r1, [sp, #0x4]
    mov r4, #0x41
    str r4, [sp, #0x8]
    mov r3, r2
    mov r1, #0x2
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_02200d28
    ldr r3, L_02200d2c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200b9c
    mov r1, r4
    bl AlternateSpritePresentation_Init
L_02200b9c:
    str r0, [r5, #0x104]
    mov r1, r0
    add r0, r5, #0x108
    bl PresentationList_Append
    ldr r0, [r5, #0xf8]
    add r1, r5, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r4, #0xc
    str r4, [sp, #0x4]
    mov r4, #0x42
    str r4, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_02200d28
    ldr r3, L_02200d2c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200c04
    mov r1, r4
    bl AlternateSpritePresentation_Init
L_02200c04:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0x108
    bl PresentationList_Append
    ldr r0, [r5, #0xd8]
    ldr r1, L_02200d30
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r1, L_02200d34
    ldr r3, L_02200d2c
    mov r0, #0x18
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200c48
    mov r1, #0x10
    bl func_ov035_021fd4b4
L_02200c48:
    ldr r1, L_02200d38
    str r0, [r5, #0x170]
    strh r1, [r0, #0x14]
    ldr r0, [r5, #0x170]
    mov r2, #0x180
    str r2, [r0, #0xc]
    mov r1, #0x0
    mov r2, r1
    add r0, r5, #0xc
    mov r3, #0x2800
    str r1, [r5, #0x174]
    bl func_ov035_021fdd70
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0xc
    bl func_ov035_021fdd78
    mov r0, #0x1
    mov r1, #0x0
    mov r2, #0x4
    mov r3, #0x7400
    bl func_020b0374
    ldr r2, L_02200d3c
    mov r0, #0x0
    str r0, [r2, #0x0]
    ldr r2, L_02200d38
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    bl TitlePalette_SetMainBackdrop
    mov r0, #0x1
    mov r1, #0x0
    str r0, [sp, #0x0]
    add r0, r5, #0x154
    mov r2, r1
    mov r3, #0x5
    bl func_02091d24
    add r0, r5, #0xa4
    mov r1, #0xa
    bl func_02091b98
    mov r0, #0x5
    str r0, [r5, #0x16c]
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_02200d04: .word data_ov035_02203c24
L_02200d08: .word 0x601a
L_02200d0c: .word data_020f4e18
L_02200d10: .word 0x12d
L_02200d14: .word 0x607c
L_02200d18: .word 0x6101
L_02200d1c: .word 0x6104
L_02200d20: .word 0x6107
L_02200d24: .word 0x500f
L_02200d28: .word data_ov035_02203d20
L_02200d2c: .word gHeapContext
L_02200d30: .word 0xccd
L_02200d34: .word data_ov035_02203d60
L_02200d38: .word 0x7fff
L_02200d3c: .word 0x4000358
    .size func_ov035_022008d0, .-func_ov035_022008d0

