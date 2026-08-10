; Matching retail form; see src/game/sprite_motion_delta.c.
.text
.extern func_020befec

.global SpriteMotionDelta_Configure
    .type SpriteMotionDelta_Configure, @function
SpriteMotionDelta_Configure: ; 0x02020374
    stmdb sp!, {r4, lr}
    mov r4, r0
    stmia r4, {r1, r2}
    strh r3, [r4, #0xc]
    ldr r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    sub r0, r1, r0
    str r0, [r4, #0x8]
    ldrsh r1, [r4, #0xc]
    bl func_020befec
    str r0, [r4, #0x8]
    mov r1, #0x1
    mov r0, r4
    strh r1, [r4, #0xe]
    ldmia sp!, {r4, pc}
    .size SpriteMotionDelta_Configure, .-SpriteMotionDelta_Configure
