; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text
.extern gGameWork

    .global func_02033f4c
    .type func_02033f4c, @function
func_02033f4c: ; 0x02033f4c
    ldr r0, [r0, #0x14]
    tst r0, #0x20000000
    ldrne r0, .L_02033f78
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x200
    ldrnesh r0, [r0, #0x12]
    ldreq r0, .L_02033f78
    ldreq r0, [r0, #0x0]
    addeq r0, r0, #0x200
    ldreqsh r0, [r0, #0x10]
    bx lr
.L_02033f78: .word gGameWork
    .size func_02033f4c, . - func_02033f4c

    .global func_02033f7c

