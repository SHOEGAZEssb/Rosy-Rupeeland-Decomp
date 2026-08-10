; Matching retail form; see src/game/actor_motion_probe_configuration.c.
.text
    .global ActorMotionProbe_SetScale
    .type ActorMotionProbe_SetScale, @function
ActorMotionProbe_SetScale: ; 0x0203c410
    str r1, [r0, #0x20c]
    bx lr
    .size ActorMotionProbe_SetScale, . - ActorMotionProbe_SetScale

    .global ActorMotionProbe_ConfigureMotion
    .type ActorMotionProbe_ConfigureMotion, @function
ActorMotionProbe_ConfigureMotion: ; 0x0203c418
    str r1, [r0, #0x244]
    str r2, [r0, #0x248]
    ldr r2, [sp, #0x0]
    str r3, [r0, #0x24c]
    ldr r1, [sp, #0x4]
    str r2, [r0, #0x250]
    str r1, [r0, #0x254]
    bx lr
    .size ActorMotionProbe_ConfigureMotion, . - ActorMotionProbe_ConfigureMotion
