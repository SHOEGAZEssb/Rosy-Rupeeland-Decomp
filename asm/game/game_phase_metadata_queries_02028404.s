; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern data_020d4864

    .global GamePhaseMetadata_GetTextResourceId
    .type GamePhaseMetadata_GetTextResourceId, @function
GamePhaseMetadata_GetTextResourceId: ; 0x02028404
    ldr r1, [r0, #0x40]
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0x1e
    cmp r1, #0x1
    beq .L_0202842c
    ldr r0, [r0, #0x44]
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, #0x9b
    bx lr
.L_0202842c:
    ldrsb r2, [r0, #0x4c]
    mov r0, #0x18
    ldr r1, .L_02028448
    smulbb r0, r2, r0
    ldr r0, [r1, r0]
    ldrh r0, [r0, #0x0]
    bx lr
.L_02028448: .word data_020d4864
    .size GamePhaseMetadata_GetTextResourceId, . - GamePhaseMetadata_GetTextResourceId

