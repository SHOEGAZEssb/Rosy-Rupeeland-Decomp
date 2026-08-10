; Matching retail form; see src/game/actor_collision_mask_constant.c.
.text

    .global Actor_GetDefaultCollisionMask
    .type Actor_GetDefaultCollisionMask, @function
Actor_GetDefaultCollisionMask: ; 0x0202e850
    mov r0, #0x40000
    bx lr
    .size Actor_GetDefaultCollisionMask, . - Actor_GetDefaultCollisionMask
