; Matching retail form; see src/game/actor_collision_shape_build.c.
.text

    .global Actor_BuildCollisionRect
    .type Actor_BuildCollisionRect, @function
Actor_BuildCollisionRect: ; 0x02030f10
    ldrsb r3, [r1, #0x8]
    mov r3, r3, lsl #0xc
    str r3, [r0, #0x0]
    ldrsb r3, [r1, #0x9]
    mov r3, r3, lsl #0xc
    str r3, [r0, #0x4]
    ldrsb r3, [r1, #0xa]
    mov r3, r3, lsl #0xc
    str r3, [r0, #0x8]
    ldrsb r1, [r1, #0xb]
    mov r1, r1, lsl #0xc
    str r1, [r0, #0xc]
    ldr r3, [r2, #0x4]
    ldr r1, [r0, #0x0]
    ldr r2, [r2, #0x8]
    add r1, r1, r3
    str r1, [r0, #0x0]
    ldr r1, [r0, #0x4]
    add r1, r1, r2
    str r1, [r0, #0x4]
    ldr r1, [r0, #0x8]
    add r1, r1, r3
    str r1, [r0, #0x8]
    ldr r1, [r0, #0xc]
    add r1, r1, r2
    str r1, [r0, #0xc]
    bx lr
    .size Actor_BuildCollisionRect, . - Actor_BuildCollisionRect
