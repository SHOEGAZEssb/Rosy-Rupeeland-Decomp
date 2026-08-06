; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text

    .global func_02033ed0
    .type func_02033ed0, @function
func_02033ed0: ; 0x02033ed0
    ldr r1, [r0, #0xd0]
    tst r1, #0x400
    bxne lr
    orr r1, r1, #0x400
    str r1, [r0, #0xd0]
    ldr r1, [r0, #0x14]
    str r1, [r0, #0xc]
    ldr r1, [r0, #0x14]
    orr r1, r1, #0xe
    str r1, [r0, #0x14]
    bx lr
    .size func_02033ed0, . - func_02033ed0

    .global func_02033efc

