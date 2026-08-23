; Matching retail form; see src/game/actor_virtual_default_helpers.c.
.text

    .global Actor_GetInteractionRadiusOffset
    .type Actor_GetInteractionRadiusOffset, @function
Actor_GetInteractionRadiusOffset: ; 0x02034e2c
    mov r0, #0x0
    bx lr
    .size Actor_GetInteractionRadiusOffset, . - Actor_GetInteractionRadiusOffset

    .global Actor_PrepareForAuxiliaryInteraction
