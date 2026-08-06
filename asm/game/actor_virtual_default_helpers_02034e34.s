; Matching retail form; see src/game/actor_virtual_default_helpers.c.
.text

    .global func_02034e34
    .type func_02034e34, @function
func_02034e34: ; 0x02034e34
    ldr r1, [r0, #0xd0]
    orr r1, r1, #0x80
    str r1, [r0, #0xd0]
    bx lr
    .size func_02034e34, . - func_02034e34

    .global func_02034e44

