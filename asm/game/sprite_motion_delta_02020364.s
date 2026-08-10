; Matching retail form; see src/game/sprite_motion_delta.c.
.text

.global SpriteMotionDelta_Init
    .type SpriteMotionDelta_Init, @function
SpriteMotionDelta_Init: ; 0x02020364
    mov r1, #0x0
    strh r1, [r0, #0xc]
    strh r1, [r0, #0xe]
    bx lr
    .size SpriteMotionDelta_Init, .-SpriteMotionDelta_Init
