; Matching retail form; see src/game/game_phase_script_vm_actor_rectangle_query_opcode.c.
.text
.global func_02016f28
func_02016f28:
    ldr r3, [r0, #0xc]
    cmp r2, r3
    movlt r12, #1
    ldr r3, [r0, #4]
    movge r12, #0
    cmp r2, r3
    ldr r2, [r0]
    movge r3, #1
    movlt r3, #0
    cmp r1, r2
    movge r2, #1
    ldr r0, [r0, #8]
    movlt r2, #0
    cmp r1, r0
    movlt r0, #1
    movge r0, #0
    and r0, r2, r0
    and r0, r3, r0
    and r0, r12, r0
    bx lr
    .size func_02016f28, . - func_02016f28
