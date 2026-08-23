; Matching retail form; see src/game/actor_virtual_default_helpers.c.
.text
.extern VecFx32Object_InitCopy

    .global Actor_BuildContactPosition
    .type Actor_BuildContactPosition, @function
Actor_BuildContactPosition: ; 0x02034e1c
    ldr ip, .L_02034e28
    add r1, r1, #0x18
    bx ip
.L_02034e28: .word VecFx32Object_InitCopy
    .size Actor_BuildContactPosition, . - Actor_BuildContactPosition

    .global Actor_GetInteractionRadiusOffset
