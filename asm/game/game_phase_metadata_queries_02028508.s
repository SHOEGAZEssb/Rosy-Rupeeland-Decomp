; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern gGamePhaseMetadataTable

    .global GamePhaseMetadata_GetFlagsBits12To15
    .type GamePhaseMetadata_GetFlagsBits12To15, @function
GamePhaseMetadata_GetFlagsBits12To15: ; 0x02028508
    ldr r1, .L_02028528
    sub r2, r0, #0x1
    mov r0, #0x58
    mla r0, r2, r0, r1
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x1c
    bx lr
.L_02028528: .word gGamePhaseMetadataTable
    .size GamePhaseMetadata_GetFlagsBits12To15, . - GamePhaseMetadata_GetFlagsBits12To15

