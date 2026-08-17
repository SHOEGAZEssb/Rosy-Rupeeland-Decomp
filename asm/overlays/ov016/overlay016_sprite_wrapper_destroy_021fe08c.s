    .text
    .extern AnimationResourceState_Destroy
    .extern SpritePresentation_Destroy

/* Exact fallbacks for sprite-wrapper destruction; see src/overlays/ov016/overlay016_sprite_wrapper.c. */
    .global func_ov016_021fe08c

func_ov016_021fe08c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xa0
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl SpritePresentation_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

    .size func_ov016_021fe08c, . - func_ov016_021fe08c
