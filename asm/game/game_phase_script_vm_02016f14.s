; Matching retail form; see src/game/game_phase_script_vm_actor_rectangle_query_opcode.c.
.text
.global func_02016f14
func_02016f14:
    str r1, [r0]
    ldr r1, [sp]
    stmib r0, {r2, r3}
    str r1, [r0, #0xc]
    bx lr
    .size func_02016f14, . - func_02016f14
