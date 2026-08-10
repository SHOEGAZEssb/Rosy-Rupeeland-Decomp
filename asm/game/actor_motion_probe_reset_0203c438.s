; Matching retail form; see src/game/actor_motion_probe_reset.c.
.text
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
    .global ActorMotionProbe_ResetMotion
    .type ActorMotionProbe_ResetMotion, @function
ActorMotionProbe_ResetMotion: ; 0x0203c438
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r1, #0x0
    mov r4, r0
    str r1, [r4, #0x244]
    str r1, [r4, #0x248]
    mov r0, #0x1
    str r0, [r4, #0x24c]
    str r1, [r4, #0x250]
    str r1, [r4, #0x254]
    add r0, sp, #0x20
    mov r2, r1
    mov r3, r1
    str r1, [r4, #0x240]
    bl func_0200500c
    add r1, sp, #0x20
    add r0, r4, #0x220
    bl func_020050a4
    add r0, sp, #0x20
    bl func_02005058
    mov r1, #0x0
    add r0, sp, #0x10
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    add r0, r4, #0x210
    add r1, sp, #0x10
    bl func_020050a4
    add r0, sp, #0x10
    bl func_02005058
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    add r0, r4, #0x230
    add r1, sp, #0x0
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}

    .size ActorMotionProbe_ResetMotion, . - ActorMotionProbe_ResetMotion

