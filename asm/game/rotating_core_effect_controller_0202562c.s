; Matching retail form; see src/game/rotating_core_effect_controller.c.
.text

    .global RotatingCoreEffectController_SetCoreFlagBit2
    .type RotatingCoreEffectController_SetCoreFlagBit2, @function
RotatingCoreEffectController_SetCoreFlagBit2: ; 0x0202562c
    ldr r0, [r0, #0x8]
    add r0, r0, #0x200
    ldrh r1, [r0, #0xee]
    orr r1, r1, #0x4
    strh r1, [r0, #0xee]
    bx lr
    .size RotatingCoreEffectController_SetCoreFlagBit2, . - RotatingCoreEffectController_SetCoreFlagBit2
