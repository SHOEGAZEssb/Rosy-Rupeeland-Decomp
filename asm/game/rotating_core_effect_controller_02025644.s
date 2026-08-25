; Matching retail form; see src/game/rotating_core_effect_controller.c.
.text

    .global RotatingCoreEffectController_SetScaleValue
    .type RotatingCoreEffectController_SetScaleValue, @function
RotatingCoreEffectController_SetScaleValue: ; 0x02025644
    strh r1, [r0, #0x30]
    bx lr
    .size RotatingCoreEffectController_SetScaleValue, . - RotatingCoreEffectController_SetScaleValue
