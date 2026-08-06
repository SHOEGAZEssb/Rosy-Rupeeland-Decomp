; Matching retail form; see src/game/actor_position_contact_state.c.
.text

    .global func_02032abc
    .type func_02032abc, @function
func_02032abc: ; 0x02032abc
    ldrb r1, [r0, #0x4c]
    cmp r1, #0x0
    bxeq lr
    sub r1, r1, #0x1
    strb r1, [r0, #0x4c]
    tst r1, #0xff
    moveq r1, #0x0
    streqb r1, [r0, #0x4c]
    ldreq r1, [r0, #0x10]
    biceq r1, r1, #0x1
    streq r1, [r0, #0x10]
    bx lr
    .size func_02032abc, . - func_02032abc

