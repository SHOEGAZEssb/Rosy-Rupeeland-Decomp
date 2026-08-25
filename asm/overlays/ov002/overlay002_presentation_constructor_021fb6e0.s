    .text
    .extern AnimationResourceState_InitEmbedded
    .extern func_02091b6c
    .extern data_020f4e18
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern func_ov002_021fba1c
    .extern data_ov002_021fbe80
    .extern data_ov002_021fbea0
    .extern gSoundContext
    .extern Sound_LoadGroup
    .global func_ov002_021fb6e0
func_ov002_021fb6e0: ; 0x021fb6e0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r0, r10, #0x4
    mov r5, r1
    mov r4, r2
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x98
    bl func_02091b6c
    mov r3, #0x21c0
    ldr r1, L_021fb9b0
    str r5, [r10, #0x0]
    str r1, [r10, #0x84]
    mov r0, #0x0
    str r4, [r10, #0x88]
    str r0, [r10, #0x8c]
    str r0, [r10, #0x90]
    str r0, [r10, #0x94]
    ldr r0, L_021fb9b4
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r10, #0x4
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, [r10, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x10]
    ldr r0, [r10, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    mov r9, #0x0
    mov r8, #0x1
    ldr r4, L_021fb9b8
    str r0, [r10, #0x14]
    mov r7, r8
    mov r6, #0x100
    mov r5, #0x4
    mov r11, r9
L_021fb778:
    ldr r0, [r10, #0x10]
    mov r2, r8
    add r1, r10, #0x4
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x18]
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    ldr r0, [r1, #0x18]
    ldr r2, [r4, r9, lsl #0x2]
    mov r1, r11
    mov r3, #0x1f
    bl GraphicsSpriteState_ApplyRenderConfig
    add r9, r9, #0x1
    cmp r9, #0x7
    blt L_021fb778
    mov r5, #0x0
    ldr r8, L_021fb9bc
    mov r4, #0x1
    mov r7, r5
    mov r6, #0x6
L_021fb7d0:
    ldr r0, [r10, #0x14]
    mov r2, r4
    add r1, r10, #0x4
    bl GraphicsSpriteGroup_CreateStateFromSource
    mul r1, r5, r6
    add r9, r10, r5, lsl #0x2
    str r0, [r9, #0x34]
    str r7, [sp, #0x0]
    str r7, [sp, #0x4]
    str r7, [sp, #0x8]
    add r3, r8, r1
    ldrh r1, [r8, r1]
    ldrh r2, [r3, #0x2]
    ldr r0, [r9, #0x34]
    ldrh r3, [r3, #0x4]
    bl GraphicsSpriteState_ApplyRenderConfig
    add r5, r5, #0x1
    cmp r5, #0xe
    blt L_021fb7d0
    ldr r0, [r10, #0x10]
    add r1, r10, #0x4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x6c]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x6c]
    mov r1, #0x21
    mov r2, #0x3f
    mov r3, #0x1f
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0x10]
    add r1, r10, #0x4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x70]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x70]
    mov r1, #0x21
    mov r2, #0x91
    mov r3, #0x1f
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r0, r10
    ldr r1, [r10, #0x88]
    bl func_ov002_021fba1c
    ldr r0, [r10, #0x14]
    add r1, r10, #0x4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x74]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x2
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x74]
    mov r1, #0x1d
    mov r2, #0xd0
    mov r3, #0x48
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r10, #0x14]
    add r1, r10, #0x4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x78]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x10
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x78]
    mov r1, #0x1e
    mov r2, #0xd4
    mov r3, #0x2f
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r9, #0x0
    mov r6, #0x1
    mov r11, #0x15
    mov r7, #0xec
    mov r5, r9
    mov r4, #0x2
    mov r8, r6
L_021fb944:
    ldr r0, [r10, #0x14]
    mov r2, r8
    add r1, r10, #0x4
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x7c]
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    cmp r9, #0x0
    moveq r2, r7
    str r4, [sp, #0x8]
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x7c]
    movne r2, r11
    mov r3, #0x20
    add r1, r9, #0x1f
    bl GraphicsSpriteState_ApplyRenderConfig
    add r9, r9, #0x1
    cmp r9, #0x2
    blt L_021fb944
    ldr r0, L_021fb9c0
    mov r1, #0x79
    ldr r0, [r0, #0x0]
    bl Sound_LoadGroup
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fb9b0: .word 0x98967f
L_021fb9b4: .word data_020f4e18
L_021fb9b8: .word data_ov002_021fbe80
L_021fb9bc: .word data_ov002_021fbea0
L_021fb9c0: .word gSoundContext
    .size func_ov002_021fb6e0, .-func_ov002_021fb6e0

