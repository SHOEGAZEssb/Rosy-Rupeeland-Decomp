; Matching retail form; see src/game/game_phase_visual_effect_controls.c.
.text
.global GamePhaseVisualEffect_SetEnabled
GamePhaseVisualEffect_SetEnabled:
    ldr r2, [r0, #0x94]
    and r1, r1, #0x1
    bic r2, r2, #0x1
    orr r1, r2, r1
    str r1, [r0, #0x94]
    bx lr
    .size GamePhaseVisualEffect_SetEnabled, . - GamePhaseVisualEffect_SetEnabled

