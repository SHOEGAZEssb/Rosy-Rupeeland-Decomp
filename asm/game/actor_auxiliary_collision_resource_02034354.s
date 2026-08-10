; Matching retail form; see src/game/actor_auxiliary_collision_resource.c.
.text

    .global Actor_GetAuxiliaryCollisionResource
    .type Actor_GetAuxiliaryCollisionResource, @function
Actor_GetAuxiliaryCollisionResource: ; 0x02034354
    ldr r0, [r0, #0x1e0]
    bx lr
    .size Actor_GetAuxiliaryCollisionResource, . - Actor_GetAuxiliaryCollisionResource

    .global Actor_SetAuxiliaryCollisionPosition
