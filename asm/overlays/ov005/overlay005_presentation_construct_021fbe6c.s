    .text
    .extern SceneInputBase_Init
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern Heap_Alloc
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern SpritePresentation_Init
    .extern Presentation_SetPosition
    .extern Presentation_SetScript
    .extern GameWork_ClearFlag
    .extern func_ov005_021fc278
    .extern func_ov005_021fb86c
    .extern func_ov005_021fbd74
    .extern func_ov005_021fbd64
    .extern AreaInfoPanelPresentation_Init
    .extern func_ov005_021fbe44
    .extern data_ov005_021fcad4
    .extern data_020f4e18
    .extern gDebugFont
    .extern data_ov005_021fcb0c
    .extern gHeapContext
    .extern data_ov005_021fc95c
    .extern gGameWork
    .extern data_ov005_021fcb14
    .extern data_ov005_021fc8f0
    .extern data_ov005_021fcb1c
    .extern data_020d7824
    .extern data_020d7826
    .extern data_ov005_021fc9e8

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_presentation_construct.c. */
    .global func_ov005_021fbe6c
func_ov005_021fbe6c: ; 0x021fbe6c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl SceneInputBase_Init
    ldr r1, L_021fc0cc
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl AnimationResourceState_InitEmbedded
    ldr r3, L_021fc0d0
    ldr r0, L_021fc0d4
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r4, #0x54
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, L_021fc0d8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x60]
    ldr r1, L_021fc0dc
    ldr r3, L_021fc0e0
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_021fbef4
    ldr r0, [r4, #0x60]
    add r1, r4, #0x54
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, r5
    bl SpritePresentation_Init
    mov r5, r0
L_021fbef4:
    mov r1, #0x130000
    mov r0, r5
    str r5, [r4, #0x64]
    sub r2, r1, #0x150000
    mov r3, #0x0
    bl Presentation_SetPosition
    ldr r1, [r4, #0x64]
    mov r0, #0x200
    ldr r2, [r1, #0x9c]
    ldr r1, L_021fc0e4
    strh r0, [r2, #0x32]
    strh r0, [r2, #0x34]
    ldr r0, [r4, #0x64]
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r1, L_021fc0e8
    ldr r0, [r1, #0x0]
    add r0, r0, #0x100
    ldrsh r0, [r0, #0xde]
    str r0, [r4, #0x68]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x100
    ldrsh r0, [r0, #0x2e]
    str r0, [r4, #0x6c]
    ldr r0, [r1, #0x0]
    ldr r1, L_021fc0ec
    add r0, r0, #0x100
    ldrsh r0, [r0, #0xce]
    str r0, [r4, #0x70]
    ldr r0, [r4, #0x68]
    cmp r0, #0xb
    movgt r0, #0xb
    strgt r0, [r4, #0x68]
    ldr r0, [r4, #0x6c]
    cmp r0, #0xb
    movgt r0, #0xb
    strgt r0, [r4, #0x6c]
    ldr r0, [r4, #0x70]
    cmp r0, #0xb
    movgt r0, #0xb
    strgt r0, [r4, #0x70]
    ldr r0, L_021fc0e8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_021fc0e8
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_021fc0e8
    ldr r1, L_021fc0f0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_021fc0e8
    ldr r1, L_021fc0f4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    bl func_ov005_021fc278
    ldr r1, L_021fc0f8
    ldr r3, L_021fc0e0
    mov r0, #0x15c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fc008
    ldr r1, L_021fc0d8
    mov r2, #0x0
    ldr r1, [r1, #0x0]
    bl func_ov005_021fb86c
L_021fc008:
    str r0, [r4, #0x74]
    ldr r1, [r4, #0x68]
    bl func_ov005_021fbd74
    ldr r2, [r4, #0x68]
    ldr r1, L_021fc0fc
    ldr r0, [r4, #0x74]
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0x0
    rsb r2, r2, #0x0
    bl func_ov005_021fbd64
    ldr r0, [r4, #0x74]
    mov r2, #0x1
    str r2, [r0, #0x158]
    ldr r1, L_021fc100
    ldr r3, L_021fc0e0
    mov r0, #0x3c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fc064
    ldr r1, L_021fc0d8
    ldr r1, [r1, #0x0]
    bl AreaInfoPanelPresentation_Init
L_021fc064:
    str r0, [r4, #0x78]
    ldr r0, [r4, #0x68]
    mov r1, #0x34
    mul r2, r0, r1
    ldr r0, L_021fc104
    ldr ip, L_021fc108
    ldrsh r0, [r0, r2]
    ldr r3, L_021fc0fc
    ldr r2, L_021fc10c
    mov r0, r0, lsl #0xc
    str r0, [r4, #0x7c]
    ldr lr, [r4, #0x68]
    mov r0, r4
    mul r1, lr, r1
    ldrsh ip, [ip, r1]
    ldr r1, [r3, lr, lsl #0x2]
    sub r1, ip, r1
    mov r1, r1, lsl #0xc
    str r1, [r4, #0x80]
    ldr r1, [r4, #0x20]
    orr r1, r1, #0x400
    str r1, [r4, #0x20]
    ldmia r2, {r1, r2}
    bl func_ov005_021fbe44
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fc0cc: .word data_ov005_021fcad4
L_021fc0d0: .word 0x1025
L_021fc0d4: .word data_020f4e18
L_021fc0d8: .word gDebugFont
L_021fc0dc: .word data_ov005_021fcb0c
L_021fc0e0: .word gHeapContext
L_021fc0e4: .word data_ov005_021fc95c
L_021fc0e8: .word gGameWork
L_021fc0ec: .word 0x3d3
L_021fc0f0: .word 0x3d5
L_021fc0f4: .word 0x3d6
L_021fc0f8: .word data_ov005_021fcb14
L_021fc0fc: .word data_ov005_021fc8f0
L_021fc100: .word data_ov005_021fcb1c
L_021fc104: .word data_020d7824
L_021fc108: .word data_020d7826
L_021fc10c: .word data_ov005_021fc9e8

    .size func_ov005_021fbe6c, .-func_ov005_021fbe6c
