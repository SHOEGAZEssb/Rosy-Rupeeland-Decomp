    .text
    .extern AnimationResourceState_InitEmbedded
    .extern __construct_array
    .extern func_02091b6c
    .extern func_ov005_021fb82c
    .extern genrand_int32
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern func_02091bac
    .extern AnimationResourceState_Destroy
    .extern data_020f4e18
    .extern gGameWork
    .extern data_ov005_021fca28
    .extern data_020d780c
    .extern data_ov005_021fc8d8

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_scene_population_construct.c. */
    .global func_ov005_021fb86c
func_ov005_021fb86c: ; 0x021fb86c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r0, r10, #0x8
    mov r4, r1
    mov r9, r2
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x14
    bl AnimationResourceState_InitEmbedded
    ldr r1, L_021fbb48
    add r0, r10, #0x20
    str r1, [sp, #0x0]
    mov r1, #0xb
    mov r2, #0xc
    ldr r3, L_021fbb4c
    bl __construct_array
    ldr r1, L_021fbb48
    add r0, r10, #0xa4
    str r1, [sp, #0x0]
    mov r1, #0x3
    mov r2, #0xc
    ldr r3, L_021fbb4c
    bl __construct_array
    mov r0, #0x0
    str r0, [r10, #0x10c]
    add r0, r10, #0x110
    bl func_02091b6c
    add r0, r10, #0x12c
    bl func_02091b6c
    add r0, r10, #0x148
    bl func_ov005_021fb82c
    bl genrand_int32
    str r0, [r10, #0x10c]
    str r4, [r10, #0x0]
    mov r0, r4
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x4]
    ldr r3, L_021fbb50
    add r0, r10, #0x8
    str r3, [sp, #0x0]
    ldr r1, L_021fbb54
    sub r2, r3, #0x1
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1a
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021fbb58
    add r0, r10, #0x14
    str r3, [sp, #0x0]
    ldr r1, L_021fbb54
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021fbb5c
    add r0, r10, #0xa4
    str r3, [sp, #0x0]
    ldr r1, L_021fbb54
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021fbb60
    add r0, r10, #0xb0
    str r3, [sp, #0x0]
    ldr r1, L_021fbb54
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021fbb64
    ldr r0, L_021fbb54
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r10, #0xbc
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r1, L_021fbb68
    mov r5, #0x0
    ldr r0, [r1, #0x0]
    ldr r11, L_021fbb6c
    add r0, r0, #0x100
    ldrsh r0, [r0, #0x2e]
    add r4, r10, #0x20
    str r0, [r10, #0x104]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x100
    ldrsh r0, [r0, #0xce]
    str r0, [r10, #0x108]
    str r5, [r10, #0x100]
L_021fb9d4:
    ldr r0, L_021fbb70
    mov r1, #0x34
    mla r6, r5, r1, r0
    add r7, r11, r5, lsl #0x3
    mov r0, #0xc
    mul r8, r5, r0
    ldrh r1, [r7, #0x4]
    mov r2, r5, lsl #0x3
    add r0, r4, r8
    str r1, [sp, #0x0]
    ldr r1, L_021fbb54
    ldrh r2, [r11, r2]
    ldrh r3, [r7, #0x2]
    ldr r1, [r1, #0x0]
    bl AnimationResourceState_ReplaceResources
    ldr r0, [r10, #0x4]
    add r1, r4, r8
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r5, lsl #0x2
    str r0, [r1, #0xc8]
    mov r0, #0x1
    stmia sp, {r0, r5}
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r1, #0xc8]
    ldrsh r2, [r6, #0x18]
    ldrsh r3, [r6, #0x1a]
    mov r1, #0x0
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0x108]
    cmp r5, r0
    addle r0, r10, r5, lsl #0x2
    ldrle r1, [r0, #0xc8]
    movle r0, #0x2
    strleh r0, [r1, #0x2a]
    ble L_021fbaac
    ldr r0, [r10, #0x104]
    cmp r5, r0
    bgt L_021fbaac
    cmp r9, #0x0
    beq L_021fbaac
    ldr r0, [r10, #0x4]
    add r1, r10, #0x8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x1
    stmia sp, {r1, r5}
    mov r1, #0x0
    str r1, [sp, #0x8]
    ldrh r1, [r7, #0x6]
    ldrsh r2, [r6, #0x18]
    ldrsh r3, [r6, #0x1a]
    bl GraphicsSpriteState_ApplyRenderConfig
L_021fbaac:
    add r5, r5, #0x1
    cmp r5, #0xb
    blt L_021fb9d4
    mov r9, #0x0
    ldr r4, L_021fbb74
    add r8, r10, #0xa4
    mov r7, #0x1
    mov r6, r9
    mov r5, #0x2
    mov r11, #0xc
L_021fbad4:
    mla r1, r9, r11, r8
    ldr r0, [r10, #0x4]
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0xf4]
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    add r3, r4, r9, lsl #0x3
    ldr r0, [r1, #0xf4]
    ldr r2, [r4, r9, lsl #0x3]
    ldr r3, [r3, #0x4]
    mov r1, r6
    bl GraphicsSpriteState_ApplyRenderConfig
    add r9, r9, #0x1
    cmp r9, #0x3
    blt L_021fbad4
    mov r2, #0x0
    str r2, [r10, #0x158]
    mov r4, #0x1e
    add r0, r10, #0x110
    mov r1, #0x2
    mov r3, #0xa000
    str r4, [sp, #0x0]
    bl func_02091bac
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fbb48: .word AnimationResourceState_Destroy
L_021fbb4c: .word AnimationResourceState_InitEmbedded
L_021fbb50: .word 0x3344
L_021fbb54: .word data_020f4e18
L_021fbb58: .word 0x4005
L_021fbb5c: .word 0x3386
L_021fbb60: .word 0x3389
L_021fbb64: .word 0x338c
L_021fbb68: .word gGameWork
L_021fbb6c: .word data_ov005_021fca28
L_021fbb70: .word data_020d780c
L_021fbb74: .word data_ov005_021fc8d8

    .size func_ov005_021fb86c, .-func_ov005_021fb86c
