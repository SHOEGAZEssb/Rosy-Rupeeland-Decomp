; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text

    .global func_02033efc
    .type func_02033efc, @function
func_02033efc: ; 0x02033efc
    ldr r1, [r0, #0xd0]
    tst r1, #0x400
    bicne r1, r1, #0x400
    strne r1, [r0, #0xd0]
    ldrne r1, [r0, #0xc]
    strne r1, [r0, #0x14]
    bx lr
    .size func_02033efc, . - func_02033efc

    .global func_02033f18

