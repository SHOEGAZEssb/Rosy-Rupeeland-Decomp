.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_child_pool_init.c for documented portable C. */

    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern GraphicsAnimationInstance_SetAnimation
    .extern Heap_Alloc
    .extern AlternateSpritePresentation_Init
    .extern PresentationList_Append
    .extern PresentationScalar_SetImmediate
    .extern data_ov036_02206160
    .extern data_ov036_022051f0
    .extern gHeapContext

    .global func_ov036_02201710
func_ov036_02201710:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r0, [r10, #0x118]
    add r1, r10, #0x10c
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r5, r0
    ldrh r0, [r5, #0x50]
    ldr r1, L_02201898
    ldr r3, L_0220189c
    orr r0, r0, #0x44
    strh r0, [r5, #0x50]
    mov r4, #0x17
    mov r0, #0xa0
    mov r2, #0x4
    strb r4, [r5, #0x5a]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02201760
    mov r1, r5
    bl AlternateSpritePresentation_Init
L_02201760:
    str r0, [r10, #0x120]
    mov r1, r0
    add r0, r10, #0x148
    bl PresentationList_Append
    ldr r0, [r10, #0x120]
    ldr r1, L_022018a0
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r0, [r10, #0x118]
    add r1, r10, #0x10c
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    ldrh r2, [r4, #0x50]
    mov r1, #0x17
    ldr r3, L_0220189c
    orr r2, r2, #0x44
    strh r2, [r4, #0x50]
    strb r1, [r4, #0x5a]
    ldr r1, L_02201898
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022017c8
    mov r1, r4
    bl AlternateSpritePresentation_Init
L_022017c8:
    str r0, [r10, #0x124]
    mov r1, r0
    add r0, r10, #0x148
    bl PresentationList_Append
    ldr r0, [r10, #0x124]
    mov r1, #0x8000
    add r0, r0, #0x5c
    bl PresentationScalar_SetImmediate
    ldr r0, [r10, #0x124]
    ldr r1, L_022018a0
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r6, L_022018a4
    ldr r11, L_02201898
    mov r9, #0x0
    mov r5, #0xa0
    mov r4, #0x14
L_0220180c:
    ldr r0, [r10, #0x118]
    add r1, r10, #0x100
    bl GraphicsAnimationInstanceManager_CreateInstance
    mul r2, r9, r4
    ldr r1, [r6, r2]
    mov r7, r0
    and r1, r1, #0xff
    add r8, r6, r2
    bl GraphicsAnimationInstance_SetAnimation
    ldrh r2, [r7, #0x50]
    ldr r3, L_0220189c
    mov r0, r5
    orr r2, r2, #0x44
    strh r2, [r7, #0x50]
    mov r1, r11
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02201860
    mov r1, r7
    bl AlternateSpritePresentation_Init
L_02201860:
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x128]
    mov r1, r0
    add r0, r10, #0x148
    bl PresentationList_Append
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x128]
    ldr r1, [r8, #0x10]
    add r0, r0, #0x5c
    bl PresentationScalar_SetImmediate
    add r9, r9, #0x1
    cmp r9, #0x8
    blt L_0220180c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02201898: .word data_ov036_02206160
L_0220189c: .word gHeapContext
L_022018a0: .word 0x19a
L_022018a4: .word data_ov036_022051f0
    .size func_ov036_02201710, .-func_ov036_02201710

