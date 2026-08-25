; Matching retail form; see src/game/rotating_core_effect_controller.c.
.text

    .global RotatingCoreEffectController_SetJitterFrames
    .type RotatingCoreEffectController_SetJitterFrames, @function
RotatingCoreEffectController_SetJitterFrames: ; 0x02025a3c
    strh r1, [r0, #0x32]
    bx lr
    .size RotatingCoreEffectController_SetJitterFrames, . - RotatingCoreEffectController_SetJitterFrames
