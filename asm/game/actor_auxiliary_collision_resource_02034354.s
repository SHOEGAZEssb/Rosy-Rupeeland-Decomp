; Matching retail form; see src/game/actor_auxiliary_collision_resource.c.
.text

    .global Actor_GetInteractionIcon
    .type Actor_GetInteractionIcon, @function
Actor_GetInteractionIcon: ; 0x02034354
    ldr r0, [r0, #0x1e0]
    bx lr
    .size Actor_GetInteractionIcon, . - Actor_GetInteractionIcon

    .global Actor_SetInteractionIconOffset
