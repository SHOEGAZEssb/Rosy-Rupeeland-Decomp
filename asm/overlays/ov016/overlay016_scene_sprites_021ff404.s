    .text

/* Exact fallback; see src/overlays/ov016/overlay016_scene_sprites.c. */
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern SpriteMotionController_BindSprite
    .extern SpriteMotionController_SetPosition
    .extern SpriteMotionController_Hide
.global Overlay016_CreateSceneSprite
Overlay016_CreateSceneSprite:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0xe0]
    add r1, r4, #0xc8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0xe4]
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xe4]
    mov r2, #0x84
    mov r3, #0x20
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r4, #0xe0]
    add r1, r4, #0xc8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0xe8
    mov r2, #0x7
    mov r3, #0x2
    bl SpriteMotionController_BindSprite
    add r0, r4, #0xe8
    mov r1, #0x80
    mov r2, #0xaa
    bl SpriteMotionController_SetPosition
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    bne L_021ff4a0
    ldr r0, [r4, #0x444]
    ldr r0, [r0, #0x50]
    cmp r0, #0x0
    bne L_021ff4a8
L_021ff4a0:
    add r0, r4, #0xe8
    bl SpriteMotionController_Hide
L_021ff4a8:
    ldr r0, [r4, #0xe0]
    add r1, r4, #0xc8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov ip, #0x0
    add r0, r4, #0x194
    mov r2, #0x9
    mov r3, #0x2
    str ip, [sp, #0x0]
    bl SpriteMotionController_BindSprite
    add r0, r4, #0x194
    mov r1, #0xe8
    mov r2, #0xaa
    bl SpriteMotionController_SetPosition
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
    .size Overlay016_CreateSceneSprite, . - Overlay016_CreateSceneSprite

