; Matching retail form; see src/game/game_phase_script_vm_actor_rectangle_query_opcode.c.
.text
.global RectS32_Init
RectS32_Init:
    str r1, [r0]
    ldr r1, [sp]
    stmib r0, {r2, r3}
    str r1, [r0, #0xc]
    bx lr
    .size RectS32_Init, . - RectS32_Init
