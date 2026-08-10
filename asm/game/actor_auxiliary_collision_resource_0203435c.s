; Matching retail form; see src/game/actor_auxiliary_collision_resource.c.
.text

    .global Actor_SetAuxiliaryCollisionPosition
    .type Actor_SetAuxiliaryCollisionPosition, @function
Actor_SetAuxiliaryCollisionPosition: ; 0x0203435c
    ldr r3, [r0, #0x1e0]
    cmp r3, #0x0
    movne r0, r1, lsl #0xc
    strne r0, [r3, #0x18]
    movne r0, r2, lsl #0xc
    strne r0, [r3, #0x1c]
    bx lr
    .size Actor_SetAuxiliaryCollisionPosition, . - Actor_SetAuxiliaryCollisionPosition

    .global func_02034378
