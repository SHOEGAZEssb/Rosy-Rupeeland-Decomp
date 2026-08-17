.text

/* Exact fallback; see src/overlays/ov036/overlay036_final_controller_init.c for documented portable C. */

    .extern func_ov036_021fce00
    .extern GraphicsResourceSetVariant_Init
    .extern func_ov036_021fe218
    .extern func_02091d08
    .extern GraphicsResourceSetVariant_Load
    .extern Graphics3DResourceOwner_PrepareResources
    .extern GraphicsArchive_AcquireOwlvResource
    .extern Graphics3DResourceOwner_CreateManager
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov036_021ff050
    .extern Heap_Alloc
    .extern AlternateSpritePresentation_Init
    .extern PresentationList_Append
    .extern Presentation_SetPosition
    .extern PresentationScalar_SetImmediate
    .extern func_ov036_02203850
    .extern func_ov036_021fcf34
    .extern func_ov036_021fe9fc
    .extern func_ov036_021fea04
    .extern func_020b0300
    .extern TitlePalette_SetMainBackdrop
    .extern func_02091d24
    .extern data_ov036_02205f48
    .extern data_020f4e18
    .extern data_ov036_02206160
    .extern gHeapContext
    .extern data_ov036_022061a0
    .extern data_ov036_02206168

    .global func_ov036_02203db0
func_ov036_02203db0:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov036_021fce00
    ldr r1, L_022040dc
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0xfc
    bl func_ov036_021fe218
    add r0, r5, #0x10c
    bl func_ov036_021fe218
    add r0, r5, #0x11c
    bl func_02091d08
    ldr r3, L_022040e0
    add r0, r5, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_022040e4
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, [r5, #0x4]
    cmp r0, #0x66
    beq L_02203e3c
    cmp r0, #0x69
    beq L_02203e74
    cmp r0, #0x6c
    beq L_02203eac
    b L_02203ee0
L_02203e3c:
    ldr r3, L_022040e8
    ldr r0, L_022040e4
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r0, L_022040e4
    ldr r1, L_022040ec
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireOwlvResource
    str r0, [r5, #0xec]
    b L_02203ee0
L_02203e74:
    ldr r3, L_022040f0
    ldr r0, L_022040e4
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r0, L_022040e4
    ldr r1, L_022040f4
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireOwlvResource
    str r0, [r5, #0xec]
    b L_02203ee0
L_02203eac:
    ldr r3, L_022040f8
    ldr r0, L_022040e4
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r0, L_022040e4
    ldr r1, L_022040fc
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireOwlvResource
    str r0, [r5, #0xec]
L_02203ee0:
    mov r0, r4
    bl Graphics3DResourceOwner_CreateManager
    add r1, r5, #0xdc
    str r0, [r5, #0xe8]
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r4, #0x2
    str r4, [sp, #0x4]
    mov r4, #0x42
    mov r2, r1
    mov r3, r1
    mov r6, r0
    str r4, [sp, #0x8]
    bl func_ov036_021ff050
    ldr r1, L_02204100
    ldr r3, L_02204104
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02203f40
    mov r1, r6
    bl AlternateSpritePresentation_Init
L_02203f40:
    str r0, [r5, #0xf8]
    mov r1, r0
    add r0, r5, #0xfc
    bl PresentationList_Append
    mov r1, #0x0
    ldr r0, [r5, #0xf8]
    sub r2, r1, #0x500
    sub r3, r1, #0x400
    bl Presentation_SetPosition
    ldr r0, [r5, #0xe8]
    add r1, r5, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    ldrh r2, [r4, #0x50]
    ldr r1, L_02204100
    ldr r3, L_02204104
    orr r2, r2, #0x44
    strh r2, [r4, #0x50]
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02203fa4
    mov r1, r4
    bl AlternateSpritePresentation_Init
L_02203fa4:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0xfc
    bl PresentationList_Append
    ldr r0, [r5, #0xd8]
    mov r1, #0x0
    mov r2, #0xc00
    mov r3, #0x1800
    bl Presentation_SetPosition
    ldr r0, [r5, #0xd8]
    ldr r1, L_02204108
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r1, L_0220410c
    ldr r3, L_02204104
    mov r0, #0x15c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02203ffc
    ldr r1, [r5, #0xec]
    bl func_ov036_02203850
L_02203ffc:
    mov r2, #0x0
    mov r3, r2
    mov r1, #0x1000
    str r0, [r5, #0xf0]
    bl Presentation_SetPosition
    ldr r1, L_02204110
    ldr r3, L_02204104
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0220403c
    ldr r1, [r5, #0xec]
    mov r2, #0x3
    mov r3, #0xe
    bl func_ov036_021fcf34
L_0220403c:
    str r0, [r5, #0xf4]
    mov r1, #0x0
    mov r2, #0x300
    mov r3, #0x800
    bl Presentation_SetPosition
    ldr r4, [r5, #0xf4]
    add r0, r5, #0xc
    ldrh r3, [r4, #0x98]
    mov r1, #0x0
    mov r2, #0x1400
    orr r3, r3, #0x2
    strh r3, [r4, #0x98]
    ldr ip, [r5, #0xf4]
    mov r3, #0x2800
    ldrh r4, [ip, #0x98]
    orr r4, r4, #0x1
    strh r4, [ip, #0x98]
    bl func_ov036_021fe9fc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0xc
    bl func_ov036_021fea04
    mov r0, #0x0
    ldr r2, L_02204114
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    bl TitlePalette_SetMainBackdrop
    mov r1, #0x0
    mov r3, #0x1
    add r0, r5, #0x11c
    mov r2, r1
    str r3, [sp, #0x0]
    bl func_02091d24
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_022040dc: .word data_ov036_02205f48
L_022040e0: .word 0x6008
L_022040e4: .word data_020f4e18
L_022040e8: .word 0x60f8
L_022040ec: .word 0x500a
L_022040f0: .word 0x60fb
L_022040f4: .word 0x500b
L_022040f8: .word 0x60fe
L_022040fc: .word 0x500c
L_02204100: .word data_ov036_02206160
L_02204104: .word gHeapContext
L_02204108: .word 0x666
L_0220410c: .word data_ov036_022061a0
L_02204110: .word data_ov036_02206168
L_02204114: .word 0x7fff
    .size func_ov036_02203db0, .-func_ov036_02203db0

