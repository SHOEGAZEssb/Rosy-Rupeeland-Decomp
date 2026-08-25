; Matching retail form; see src/game/actor_ground_height_state.c.
.text

    .global Actor_TestGroundHeightFlag40
    .type Actor_TestGroundHeightFlag40, @function
Actor_TestGroundHeightFlag40: ; 0x020324c8
    ldr r0, [r0, #0xd0]
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    .size Actor_TestGroundHeightFlag40, . - Actor_TestGroundHeightFlag40
