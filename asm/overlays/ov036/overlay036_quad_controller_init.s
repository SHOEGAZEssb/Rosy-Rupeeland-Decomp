.text

/* Exact fallback; see src/overlays/ov036/overlay036_quad_controller_init.c for documented portable C. */

    .extern func_ov036_021fce00
    .extern GraphicsResourceSetVariant_Init
    .extern func_ov036_021fe218
    .extern Graphics3DLightSet_Init
    .extern GraphicsResourceSetVariant_Load
    .extern Graphics3DResourceOwner_PrepareResources
    .extern GraphicsArchive_AcquireOwlvResource
    .extern Graphics3DResourceOwner_CreateManager
    .extern func_ov036_021fe9fc
    .extern func_ov036_021fea04
    .extern func_ov036_0220213c
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov036_021ff050
    .extern Heap_Alloc
    .extern AlternateSpritePresentation_Init
    .extern PresentationList_Append
    .extern Presentation_SetScript
    .extern func_020b0300
    .extern data_ov036_02205fb8
    .extern data_020f4e18
    .extern data_ov036_02206160
    .extern gHeapContext
    .extern data_ov036_022056c8

    .global func_ov036_022021b0
func_ov036_022021b0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r2
    mov r4, r1
    mov r1, r6
    mov r5, r0
    bl func_ov036_021fce00
    ldr r1, L_022024d0
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0xe8
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0xfc
    bl func_ov036_021fe218
    add r0, r5, #0x10c
    bl func_ov036_021fe218
    add r0, r5, #0x11c
    bl Graphics3DLightSet_Init
    ldr r3, L_022024d4
    add r0, r5, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_022024d8
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    cmp r6, #0x64
    beq L_02202240
    cmp r6, #0x67
    beq L_02202284
    cmp r6, #0x6a
    beq L_022022c8
L_02202240:
    ldr r3, L_022024dc
    ldr r0, L_022024d8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r3, L_022024e0
    ldr r0, L_022024d8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    b L_02202308
L_02202284:
    ldr r3, L_022024dc
    ldr r0, L_022024d8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r3, L_022024e4
    ldr r0, L_022024d8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    b L_02202308
L_022022c8:
    ldr r3, L_022024dc
    ldr r0, L_022024d8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x2
    bl GraphicsResourceSetVariant_Load
    ldr r3, L_022024e8
    ldr r0, L_022024d8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
L_02202308:
    mov r0, r4
    add r1, r5, #0xe8
    bl Graphics3DResourceOwner_PrepareResources
    mov r0, r4
    add r1, r5, #0xcc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, L_022024d8
    ldr r1, L_022024ec
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireOwlvResource
    str r0, [r5, #0xf4]
    mov r0, r4
    bl Graphics3DResourceOwner_CreateManager
    str r0, [r5, #0xf8]
    add r0, r5, #0xc
    mov r1, #0x0
    mov r2, r1
    mov r3, #0x2980
    bl func_ov036_021fe9fc
    add r0, r5, #0xc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov036_021fea04
    mov r2, #0x1000
    rsb r2, r2, #0x0
    str r2, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    add r0, r5, #0x11c
    mov r3, r2
    bl func_ov036_0220213c
    mov r3, #0x1000
    rsb r3, r3, #0x0
    str r3, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r0, #0x1f
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    add r0, r5, #0x11c
    mov r1, #0x1
    mov r2, #0x1000
    bl func_ov036_0220213c
    mov r0, #0x1000
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r0, #0x1f
    str r0, [sp, #0xc]
    add r0, r5, #0x11c
    mov r1, #0x2
    mov r2, #0x1000
    mov r3, r2
    bl func_ov036_0220213c
    mov r0, #0x1000
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    add r0, r5, #0x11c
    mov r1, #0x3
    mov r2, #0x0
    mov r3, r2
    bl func_ov036_0220213c
    ldr r0, [r5, #0xf8]
    add r1, r5, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r4, #0x1
    mov r2, r1
    mov r3, r1
    str r4, [sp, #0x4]
    mov r4, #0x46
    mov r6, r0
    str r4, [sp, #0x8]
    bl func_ov036_021ff050
    ldr r1, L_022024f0
    ldr r3, L_022024f4
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202480
    mov r1, r6
    bl AlternateSpritePresentation_Init
L_02202480:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0xfc
    bl PresentationList_Append
    ldr r0, [r5, #0xd8]
    ldr r1, L_022024f8
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, L_022024fc
    mov r3, #0x0
    str r3, [sp, #0x0]
    mov r2, r0
    mov r1, #0x1f
    mov r3, #0x3f
    bl func_020b0300
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x15c]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
L_022024d0: .word data_ov036_02205fb8
L_022024d4: .word 0x600e
L_022024d8: .word data_020f4e18
L_022024dc: .word 0x6081
L_022024e0: .word 0x60ef
L_022024e4: .word 0x60f2
L_022024e8: .word 0x60f5
L_022024ec: .word 0x500d
L_022024f0: .word data_ov036_02206160
L_022024f4: .word gHeapContext
L_022024f8: .word data_ov036_022056c8
L_022024fc: .word 0x7fff
    .size func_ov036_022021b0, .-func_ov036_022021b0

