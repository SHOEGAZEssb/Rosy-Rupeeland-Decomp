; Matching retail form; see src/game/game_phase_visual_effect_controls.c.
.text
.extern func_020050a4
.global GamePhaseVisualEffect_SetBaseOffset
GamePhaseVisualEffect_SetBaseOffset:
    ldr ip, L_02010228
    add r0, r0, #0x50
    bx ip
L_02010228: .word func_020050a4
    .size GamePhaseVisualEffect_SetBaseOffset, . - GamePhaseVisualEffect_SetBaseOffset

