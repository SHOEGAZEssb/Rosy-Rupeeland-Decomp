; Matching retail form; see src/game/game_phase_visual_effect_controls.c.
.text
.extern VecFx32Object_Assign
.global GamePhaseVisualEffect_SetBaseOffset
GamePhaseVisualEffect_SetBaseOffset:
    ldr ip, L_02010228
    add r0, r0, #0x50
    bx ip
L_02010228: .word VecFx32Object_Assign
    .size GamePhaseVisualEffect_SetBaseOffset, . - GamePhaseVisualEffect_SetBaseOffset

