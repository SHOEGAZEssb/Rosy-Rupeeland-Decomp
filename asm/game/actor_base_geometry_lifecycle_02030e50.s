; Matching retail form; see src/game/actor_base_geometry_lifecycle.c.
.text

    .global Actor_GetCollisionBounds
    .type Actor_GetCollisionBounds, @function
Actor_GetCollisionBounds: ; 0x02030e50
    add r0, r0, #0x4
    bx lr
    .size Actor_GetCollisionBounds, . - Actor_GetCollisionBounds
