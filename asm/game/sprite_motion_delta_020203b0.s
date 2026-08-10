; Matching retail form; see src/game/sprite_motion_delta.c.
.text

.global SpriteMotionDelta_Copy
    .type SpriteMotionDelta_Copy, @function
SpriteMotionDelta_Copy: ; 0x020203b0
    cmp r0, r1
    bxeq lr
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r2, [r1, #0x8]
    str r2, [r0, #0x8]
    ldrsh r2, [r1, #0xc]
    strh r2, [r0, #0xc]
    ldrh r1, [r1, #0xe]
    strh r1, [r0, #0xe]
    bx lr
    .size SpriteMotionDelta_Copy, .-SpriteMotionDelta_Copy
