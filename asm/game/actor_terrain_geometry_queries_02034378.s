; Matching retail form; see src/game/actor_terrain_geometry_queries.c.
.text

    .global Actor_BuildWorldInteractionBounds
    .type Actor_BuildWorldInteractionBounds, @function
Actor_BuildWorldInteractionBounds: ; 0x02034378
    ldrsh r3, [r1, #0x70]
    mov r3, r3, lsl #0xc
    str r3, [r0, #0x0]
    ldrsh r3, [r1, #0x72]
    mov r3, r3, lsl #0xc
    str r3, [r0, #0x4]
    ldrsh r3, [r1, #0x74]
    mov r3, r3, lsl #0xc
    str r3, [r0, #0x8]
    ldrsh r1, [r1, #0x76]
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
    .size Actor_BuildWorldInteractionBounds, . - Actor_BuildWorldInteractionBounds

    .global Actor_QueryTerrainHeight
