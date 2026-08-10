; Matching retail form; see src/game/game_phase_area_scene_controls.c.
.text

    .global GamePhaseAreaScene_GetConfig
GamePhaseAreaScene_GetConfig: ; 0x02012438
    add r0, r0, #0x2000
    ldr r0, [r0, #0xeac]
    bx lr
    .size GamePhaseAreaScene_GetConfig, . - GamePhaseAreaScene_GetConfig

