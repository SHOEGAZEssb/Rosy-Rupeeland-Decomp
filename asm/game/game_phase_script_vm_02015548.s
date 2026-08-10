; Matching retail form; see src/game/game_phase_script_vm_geometry_opcodes.c.
.text

    .global RectS32_Set
RectS32_Set: ; 0x02015548
    str r1, [r0, #0x0]
    ldr r1, [sp, #0x0]
    stmib r0, {r2, r3}
    str r1, [r0, #0xc]
    bx lr
    .size RectS32_Set, . - RectS32_Set

