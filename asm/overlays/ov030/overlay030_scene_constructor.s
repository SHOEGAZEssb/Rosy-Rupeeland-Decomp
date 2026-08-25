.text

/* Exact fallback; see src/overlays/ov030/overlay030_scene_constructor.c. */
.extern data_020f4e18
.extern data_ov030_021ff708
.extern ActorDescriptor_GetComponent
.extern ActorDescriptorComponent_GetCharacterResourceId
.extern ActorDescriptorComponent_GetPaletteResourceId
.extern ActorDescriptorComponent_GetCellResourceId
.extern ActorDescriptorComponent_GetAnimation
.extern func_020708c4
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteState_ApplyRenderConfig
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02091e0c
.extern SpriteMotionController_Init
.extern SpriteMotionController_BindSprite
.extern SpriteMotionController_SetPosition
.extern SpriteMotionController_Hide
.extern func_ov030_021fd260
.extern func_ov030_021fd434


    .global func_ov030_021fcf20
func_ov030_021fcf20:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r0, r10, #0x4
    mov r6, r1
    mov r4, r2
    mov r5, r3
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x10
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x1c
    bl AnimationResourceState_InitEmbedded
    add r0, r10, #0x58
    bl SpriteMotionController_Init
    add r0, r10, #0x104
    bl SpriteMotionController_Init
    add r0, r10, #0x1b8
    bl func_ov030_021fd260
    add r0, r10, #0x1d0
    mov r1, #0x8
    bl func_02091e0c
    add r0, r10, #0x1d8
    mov r1, #0x8
    bl func_02091e0c
    add r0, r10, #0x1e0
    mov r1, #0x8
    bl func_02091e0c
    add r0, r10, #0x1e8
    mov r1, #0x8
    bl func_02091e0c
    str r6, [r10, #0x0]
    cmp r5, #0x1
    ldrh r1, [r4, #0x4]
    mov r0, #0x0
    str r1, [r10, #0x1b4]
    str r0, [r10, #0x1c4]
    str r0, [r10, #0x1b0]
    ldr r0, [r10, #0x0]
    ldr r0, [r0, #0x0]
    str r0, [r10, #0x1cc]
    bne L_021fcfe8
    ldr r3, L_021fd250
    ldr r0, L_021fd254
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r10, #0x4
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    b L_021fd008
L_021fcfe8:
    ldr r3, L_021fd258
    ldr r0, L_021fd254
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r10, #0x4
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
L_021fd008:
    mov r0, r4
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCharacterResourceId
    mov r6, r0
    mov r0, r4
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetPaletteResourceId
    mov r5, r0
    mov r0, r4
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCellResourceId
    str r0, [sp, #0x0]
    ldr r1, L_021fd254
    mov r2, r6
    ldr r1, [r1, #0x0]
    mov r3, r5
    add r0, r10, #0x1c
    bl AnimationResourceState_ReplaceResources
    ldr r0, [r10, #0x8]
    bl func_020708c4
    mov r0, #0x43
    str r0, [sp, #0x0]
    ldr r1, L_021fd254
    add r0, r10, #0x10
    ldr r1, [r1, #0x0]
    mov r2, #0x42
    mov r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, [r10, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x28]
    ldr r0, [r10, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x2c]
    add r1, r10, #0x1c
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r10, #0x30]
    mov r0, r4
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetAnimation
    mov r2, #0x0
    mov r1, r0
    str r2, [sp, #0x0]
    mov r0, #0x100
    stmib sp, {r0, r2}
    ldr r0, [r10, #0x30]
    mov r2, #0x20
    mov r3, #0xb0
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r9, #0x0
    mov r8, #0x1
    ldr r4, L_021fd25c
    mov r7, r8
    mov r6, r9
    mov r5, #0x4
L_021fd0f8:
    ldr r0, [r10, #0x28]
    mov r2, r8
    add r1, r10, #0x4
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r2, r10, r9, lsl #0x2
    str r0, [r2, #0x34]
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    add r3, r4, r9, lsl #0x3
    mov r1, r9, lsl #0x3
    ldr r0, [r2, #0x34]
    ldrsh r2, [r4, r1]
    mov r1, r6
    ldrsh lr, [r3, #0x4]
    ldrsh ip, [r3, #0x2]
    ldrsh r3, [r3, #0x6]
    add r2, r2, lr
    add r2, r2, r2, lsr #0x1f
    add r3, ip, r3
    add r3, r3, r3, lsr #0x1f
    mov r2, r2, asr #0x1
    mov r3, r3, asr #0x1
    add r3, r3, #0x7
    bl GraphicsSpriteState_ApplyRenderConfig
    add r9, r9, #0x1
    cmp r9, #0x7
    blt L_021fd0f8
    mov r7, #0x0
    mov r6, #0x1
    mov r5, r7
    mov r4, #0xb0
L_021fd178:
    ldr r0, [r10, #0x2c]
    mov r2, r6
    add r1, r10, #0x10
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x50]
    stmia sp, {r5, r7}
    str r5, [sp, #0x8]
    mov r2, r7, lsl #0x3
    ldr r0, [r1, #0x50]
    mov r1, r5
    mov r3, r4
    add r2, r2, #0x32
    bl GraphicsSpriteState_ApplyRenderConfig
    add r7, r7, #0x1
    cmp r7, #0x2
    blt L_021fd178
    ldr r0, [r10, #0x2c]
    add r1, r10, #0x10
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r3, #0x0
    add r0, r10, #0x58
    mov r2, #0x4
    str r3, [sp, #0x0]
    bl SpriteMotionController_BindSprite
    add r0, r10, #0x58
    mov r1, #0x80
    mov r2, #0xb0
    bl SpriteMotionController_SetPosition
    add r0, r10, #0x58
    bl SpriteMotionController_Hide
    ldr r0, [r10, #0x2c]
    add r1, r10, #0x10
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r3, #0x0
    str r3, [sp, #0x0]
    add r0, r10, #0x104
    mov r2, #0x6
    bl SpriteMotionController_BindSprite
    add r0, r10, #0x104
    mov r1, #0xe4
    mov r2, #0xb0
    bl SpriteMotionController_SetPosition
    add r0, r10, #0x104
    bl SpriteMotionController_Hide
    mov r0, r10
    bl func_ov030_021fd434
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_021fd250: .word 0x32a3
L_021fd254: .word data_020f4e18
L_021fd258: .word 0x32a6
L_021fd25c: .word data_ov030_021ff708
.size func_ov030_021fcf20, .-func_ov030_021fcf20
