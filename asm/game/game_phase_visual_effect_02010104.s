; Matching retail form; see src/game/game_phase_visual_effect_controls.c.
.text
.global GamePhaseVisualEffect_SetBlendCoefficients
GamePhaseVisualEffect_SetBlendCoefficients:
    strh r1, [r0, #0x1c]
    strh r2, [r0, #0x1e]
    bx lr
    .size GamePhaseVisualEffect_SetBlendCoefficients, . - GamePhaseVisualEffect_SetBlendCoefficients

