; Matching retail form; see src/game/actor_ground_height_state.c.
.text

    .global func_020324c8
    .type func_020324c8, @function
func_020324c8: ; 0x020324c8
    ldr r0, [r0, #0xd0]
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    .size func_020324c8, . - func_020324c8
