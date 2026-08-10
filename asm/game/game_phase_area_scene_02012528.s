; Matching retail form; see src/game/game_phase_area_scene_helpers.c.
.text

    .global GamePhaseAreaScene_SetOverlayObject
GamePhaseAreaScene_SetOverlayObject: ; 0x02012528
    add r0, r0, #0x2000
    str r1, [r0, #0xed0]
    cmp r1, #0x0
    bxeq lr
    ldr r1, L_02012560
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x2]
    bx lr
L_02012560: .word 0x400100c
    .size GamePhaseAreaScene_SetOverlayObject, . - GamePhaseAreaScene_SetOverlayObject

