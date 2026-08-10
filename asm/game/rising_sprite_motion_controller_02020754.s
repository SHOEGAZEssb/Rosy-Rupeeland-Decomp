; Matching retail form; see src/game/rising_sprite_motion_controller.c.
.text
.extern SpriteMotionDelta_Configure
.extern SpriteMotionDelta_Copy

.global RisingSpriteMotionController_SetState
    .type RisingSpriteMotionController_SetState, @function
RisingSpriteMotionController_SetState: ; 0x02020754
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    str r1, [r4, #0x8]
    cmp r1, #0x2
    bne .L_0202078c
    ldr r2, [r4, #0x50]
    add r0, sp, #0x0
    mov r1, #0x0
    mov r3, #0x78
    bl SpriteMotionDelta_Configure
    add r1, sp, #0x0
    add r0, r4, #0x4c
    bl SpriteMotionDelta_Copy
.L_0202078c:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size RisingSpriteMotionController_SetState, .-RisingSpriteMotionController_SetState
