; Matching retail form; see src/game/type7_actor_transition_flags.c.
.text
    .global func_0204afd4
func_0204afd4: ; 0x0204afd4
    ldr r1, [r0, #0x268]
    tst r1, #0x80000
    movne r1, #0x0
    strne r1, [r0, #0x210]
    ldrne r1, [r0, #0x268]
    bicne r1, r1, #0xa0
    strne r1, [r0, #0x268]
    bx lr
.size func_0204afd4, . - func_0204afd4

    .global func_0204aff4
func_0204aff4: ; 0x0204aff4
    ldr r1, [r0, #0x268]
    tst r1, #0x400
    movne r0, #0x5
    bxne lr
    tst r1, #0x40000
    movne r2, #0x1
    moveq r2, #0x0
    cmp r2, #0x0
    movne r0, #0x6
    bxne lr
    tst r1, #0x80000
    movne r2, #0x1
    moveq r2, #0x0
    cmp r2, #0x0
    movne r0, #0x7
    bxne lr
    ldr r0, [r0, #0x234]
    cmp r0, #0x0
    movne r0, #0x1
    bxne lr
    tst r1, #0x10
    moveq r0, #0x2
    bxeq lr
    tst r1, #0x800000
    movne r0, #0x8
    bxne lr
    tst r1, #0xa0
    movne r0, #0x3
    bxne lr
    tst r1, #0x40
    movne r0, #0x4
    moveq r0, #0x0
    bx lr
.size func_0204aff4, . - func_0204aff4

