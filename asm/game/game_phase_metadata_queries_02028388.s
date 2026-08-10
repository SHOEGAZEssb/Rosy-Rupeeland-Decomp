; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern gGamePhaseMetadataTable

    .global GamePhaseMetadata_GetByIndex
    .type GamePhaseMetadata_GetByIndex, @function
GamePhaseMetadata_GetByIndex: ; 0x02028388
    ldr r2, .L_02028398
    mov r1, #0x58
    mla r0, r1, r0, r2
    bx lr
.L_02028398: .word gGamePhaseMetadataTable
    .size GamePhaseMetadata_GetByIndex, . - GamePhaseMetadata_GetByIndex

