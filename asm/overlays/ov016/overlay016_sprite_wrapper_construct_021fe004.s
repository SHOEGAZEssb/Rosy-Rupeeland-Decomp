    .text
    .extern data_020f4e18
    .extern data_ov016_0220155c
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern SpritePresentation_InitVariant

/* Exact fallbacks for sprite-wrapper construction; see src/overlays/ov016/overlay016_sprite_wrapper.c. */
    .global Overlay016_SpriteWrapper_Init

Overlay016_SpriteWrapper_Init:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r1
    mov r1, #0x0
    mov r6, r0
    mov r4, r2
    bl SpritePresentation_InitVariant
    ldr r1, L_021fe084
    add r0, r6, #0xa0
    str r1, [r6, #0x0]
    bl AnimationResourceState_InitEmbedded
    str r5, [r6, #0xac]
    ldr r1, [r5, #0x8]
    add r0, r6, #0xa0
    ldr r2, [r1, #0x10]
    ldr r1, L_021fe088
    str r2, [sp, #0x0]
    ldmia r5, {r2, r3}
    ldr r1, [r1, #0x0]
    ldr r2, [r2, #0x10]
    ldr r3, [r3, #0x10]
    bl AnimationResourceState_ReplaceResources
    mov r0, r4
    add r1, r6, #0xa0
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r6, #0x9c]
    mov r1, #0x1
    strb r1, [r0, #0x3a]
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fe084: .word data_ov016_0220155c
L_021fe088: .word data_020f4e18

    .size Overlay016_SpriteWrapper_Init, . - Overlay016_SpriteWrapper_Init
