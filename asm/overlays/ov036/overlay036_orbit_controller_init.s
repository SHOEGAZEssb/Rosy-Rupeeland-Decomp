.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_controller_init.c for documented portable C. */

    .extern func_ov036_021fce00
    .extern GraphicsResourceSetVariant_Init
    .extern func_ov036_021fe218
    .extern func_02091d08
    .extern GraphicsResourceSetVariant_Load
    .extern Graphics3DResourceOwner_PrepareResources
    .extern Graphics3DResourceOwner_CreateManager
    .extern func_ov036_021fe9fc
    .extern func_ov036_021fea04
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov036_021ff050
    .extern Heap_Alloc
    .extern AlternateSpritePresentation_Init
    .extern PresentationList_Append
    .extern PresentationScalar_SetImmediate
    .extern func_ov036_021fffa4
    .extern Presentation_SetPosition
    .extern data_ov036_02206060
    .extern data_020f4e18
    .extern data_ov036_02206160
    .extern gHeapContext
    .extern data_ov036_02206170

    .global func_ov036_0220059c
func_ov036_0220059c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r9, r1
    mov r1, r2
    mov r10, r0
    bl func_ov036_021fce00
    ldr r1, L_022008c0
    add r0, r10, #0xdc
    str r1, [r10, #0x0]
    bl GraphicsResourceSetVariant_Init
    add r0, r10, #0xe8
    bl GraphicsResourceSetVariant_Init
    add r0, r10, #0xf4
    bl GraphicsResourceSetVariant_Init
    add r0, r10, #0x11c
    bl func_ov036_021fe218
    add r0, r10, #0x12c
    bl func_02091d08
    ldr r3, L_022008c4
    add r0, r10, #0xe8
    str r3, [sp, #0x0]
    ldr r1, L_022008c8
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r9
    add r1, r10, #0xe8
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_022008cc
    add r0, r10, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_022008c8
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r9
    add r1, r10, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_022008d0
    add r0, r10, #0xf4
    str r3, [sp, #0x0]
    ldr r1, L_022008c8
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r9
    add r1, r10, #0xf4
    bl Graphics3DResourceOwner_PrepareResources
    mov r0, r9
    bl Graphics3DResourceOwner_CreateManager
    str r0, [r10, #0x100]
    ldr r3, L_022008d4
    add r0, r10, #0xcc
    str r3, [sp, #0x0]
    ldr r1, L_022008c8
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r9
    add r1, r10, #0xcc
    bl Graphics3DResourceOwner_PrepareResources
    add r0, r10, #0xc
    mov r1, #0x0
    mov r2, r1
    mov r3, #0x2000
    bl func_ov036_021fe9fc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r10, #0xc
    bl func_ov036_021fea04
    ldr r0, [r10, #0x100]
    add r1, r10, #0xe8
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0x2
    mov r3, r2
    str r1, [sp, #0x4]
    mov r4, #0x46
    str r4, [sp, #0x8]
    mov r4, r0
    bl func_ov036_021ff050
    mov r0, #0xa0
    ldr r1, L_022008d8
    mov r2, #0x4
    ldr r3, L_022008dc
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0220071c
    mov r1, r4
    bl AlternateSpritePresentation_Init
L_0220071c:
    str r0, [r10, #0x104]
    mov r1, r0
    add r0, r10, #0x11c
    bl PresentationList_Append
    ldr r0, [r10, #0x104]
    ldr r1, L_022008e0
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r4, L_022008d8
    mov r8, #0x0
    mov r6, #0x46
    mov r5, #0xa0
    mov r11, #0x4
L_02200750:
    ldr r0, [r10, #0x100]
    add r1, r10, #0xf4
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    add r1, r8, #0x3
    stmib sp, {r1, r6}
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r7, r0
    bl func_ov036_021ff050
    ldr r3, L_022008dc
    mov r0, r5
    mov r1, r4
    mov r2, r11
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022007a4
    mov r1, r7
    bl AlternateSpritePresentation_Init
L_022007a4:
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x108]
    mov r1, r0
    add r0, r10, #0x11c
    bl PresentationList_Append
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x108]
    ldr r1, L_022008e0
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    add r8, r8, #0x1
    cmp r8, #0x5
    blt L_02200750
    ldr r1, L_022008e4
    ldr r3, L_022008dc
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022007fc
    mov r1, r9
    bl func_ov036_021fffa4
L_022007fc:
    str r0, [r10, #0x144]
    mov r1, r0
    add r0, r10, #0x11c
    bl PresentationList_Append
    mov r1, #0x0
    ldr r0, [r10, #0x144]
    mov r2, r1
    sub r3, r1, #0x600
    bl Presentation_SetPosition
    ldr r0, [r10, #0x100]
    add r1, r10, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x1
    str r2, [sp, #0x4]
    mov r2, #0x46
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov036_021ff050
    mov r0, #0x1
    strb r0, [r4, #0x5b]
    ldr r1, L_022008d8
    ldr r3, L_022008dc
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200880
    mov r1, r4
    bl AlternateSpritePresentation_Init
L_02200880:
    str r0, [r10, #0xd8]
    mov r1, r0
    add r0, r10, #0x11c
    bl PresentationList_Append
    mov r1, #0x0
    ldr r0, [r10, #0xd8]
    mov r3, r1
    mov r2, #0xba0
    bl Presentation_SetPosition
    ldr r0, [r10, #0xd8]
    ldr r1, L_022008e0
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_022008c0: .word data_ov036_02206060
L_022008c4: .word 0x6005
L_022008c8: .word data_020f4e18
L_022008cc: .word 0x603b
L_022008d0: .word 0x605c
L_022008d4: .word 0x60c5
L_022008d8: .word data_ov036_02206160
L_022008dc: .word gHeapContext
L_022008e0: .word 0xccd
L_022008e4: .word data_ov036_02206170
    .size func_ov036_0220059c, .-func_ov036_0220059c

