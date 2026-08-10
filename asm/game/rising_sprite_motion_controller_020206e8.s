; Matching retail form; see src/game/rising_sprite_motion_controller.c.
.text

.global SpriteMotionDelta_Step
    .type SpriteMotionDelta_Step, @function
SpriteMotionDelta_Step: ; 0x020206e8
    ldrh r1, [r0, #0xe]
    cmp r1, #0x0
    beq .L_0202074c
    cmp r1, #0x1
    beq .L_02020704
    cmp r1, #0x2
    b .L_0202074c
.L_02020704:
    ldrsh r1, [r0, #0xc]
    sub r1, r1, #0x1
    strh r1, [r0, #0xc]
    ldrsh r1, [r0, #0xc]
    cmp r1, #0x0
    bge .L_02020734
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    str r2, [r0, #0x4]
    strh r1, [r0, #0xe]
    mov r0, #0x0
    bx lr
.L_02020734:
    ldr r2, [r0, #0x4]
    ldr r1, [r0, #0x8]
    add r1, r2, r1
    str r1, [r0, #0x4]
    mov r0, #0x1
    bx lr
.L_0202074c:
    mov r0, #0x0
    bx lr
    .size SpriteMotionDelta_Step, .-SpriteMotionDelta_Step
