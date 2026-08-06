; Matching retail form; see src/game/actor_auxiliary_collision_resource.c.
.text

    .global func_0203435c
    .type func_0203435c, @function
func_0203435c: ; 0x0203435c
    ldr r3, [r0, #0x1e0]
    cmp r3, #0x0
    movne r0, r1, lsl #0xc
    strne r0, [r3, #0x18]
    movne r0, r2, lsl #0xc
    strne r0, [r3, #0x1c]
    bx lr
    .size func_0203435c, . - func_0203435c

    .global func_02034378

