; Matching retail form; see src/game/animated_tile_staging_buffer.c.
.text

    .global func_0202b9bc
    .type func_0202b9bc, @function
func_0202b9bc: ; 0x0202b9bc
    add r0, r0, #0x1000
    cmp r1, #0x0
    ldrne r1, [r0, #0x818]
    orrne r1, r1, #0x2
    ldreq r1, [r0, #0x818]
    biceq r1, r1, #0x2
    str r1, [r0, #0x818]
    bx lr
    .size func_0202b9bc, . - func_0202b9bc
