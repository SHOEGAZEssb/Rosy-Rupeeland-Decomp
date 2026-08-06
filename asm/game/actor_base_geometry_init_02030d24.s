; Matching retail form; see src/game/actor_base_geometry_init.c.
.text

    .global func_02030d24
    .type func_02030d24, @function
func_02030d24: ; 0x02030d24
    strb r1, [r0, #0x0]
    strb r2, [r0, #0x1]
    ldrsb r1, [sp, #0x0]
    strb r3, [r0, #0x2]
    strb r1, [r0, #0x3]
    bx lr
    .size func_02030d24, . - func_02030d24

