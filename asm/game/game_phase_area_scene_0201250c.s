; Matching retail form; see src/game/game_phase_area_scene_helpers.c.
.text

    .global GamePhaseAreaScene_GetSubRendererHighCoordinate
GamePhaseAreaScene_GetSubRendererHighCoordinate: ; 0x0201250c
    ldr r1, [r0, #0x4]
    mov r0, #0x0
    cmp r1, #0x0
    ldrne r0, [r1, #0x20]
    movne r0, r0, lsr #0x10
    movne r0, r0, lsl #0x4
    bx lr
    .size GamePhaseAreaScene_GetSubRendererHighCoordinate, . - GamePhaseAreaScene_GetSubRendererHighCoordinate

