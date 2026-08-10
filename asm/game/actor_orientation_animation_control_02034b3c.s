; Matching retail form; see src/game/actor_orientation_animation_control.c.
.text

    .global Actor_SetInteractionBounds
    .type Actor_SetInteractionBounds, @function
Actor_SetInteractionBounds: ; 0x02034b3c
    ldrsh r2, [r1, #0x0]
    strh r2, [r0, #0x70]
    ldrsh r2, [r1, #0x2]
    strh r2, [r0, #0x72]
    ldrsh r2, [r1, #0x4]
    strh r2, [r0, #0x74]
    ldrsh r1, [r1, #0x6]
    strh r1, [r0, #0x76]
    bx lr
    .size Actor_SetInteractionBounds, . - Actor_SetInteractionBounds

    .global func_02034b60
