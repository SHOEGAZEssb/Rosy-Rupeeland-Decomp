; Matching retail form; see src/game/actor_base_geometry_init.c.
.text

    .global func_02030d00
    .type func_02030d00, @function
func_02030d00: ; 0x02030d00
    ldrsb r2, [r1, #0x0]
    strb r2, [r0, #0x0]
    ldrsb r2, [r1, #0x1]
    strb r2, [r0, #0x1]
    ldrsb r2, [r1, #0x2]
    strb r2, [r0, #0x2]
    ldrsb r1, [r1, #0x3]
    strb r1, [r0, #0x3]
    bx lr
    .size func_02030d00, . - func_02030d00

