    .text
    .extern AnimationResourceState_Destroy
    .extern SpritePresentation_Destroy

/* Exact fallbacks for sprite-wrapper destruction; see src/overlays/ov016/overlay016_sprite_wrapper.c. */
    .global Overlay016_SpriteWrapper_Destroy

Overlay016_SpriteWrapper_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xa0
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl SpritePresentation_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

    .size Overlay016_SpriteWrapper_Destroy, . - Overlay016_SpriteWrapper_Destroy
