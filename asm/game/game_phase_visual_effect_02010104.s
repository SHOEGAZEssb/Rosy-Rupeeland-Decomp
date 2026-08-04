; Matching retail form; see src/game/game_phase_visual_effect_controls.c.
.text
.global func_02010104
func_02010104:
    strh r1, [r0, #0x1c]
    strh r2, [r0, #0x1e]
    bx lr
    .size func_02010104, . - func_02010104

