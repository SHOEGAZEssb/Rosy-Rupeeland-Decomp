; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern gGamePhaseGraphicsMetadataTable

    .global GamePhaseGraphicsMetadata_GetByIndex
    .type GamePhaseGraphicsMetadata_GetByIndex, @function
GamePhaseGraphicsMetadata_GetByIndex: ; 0x020284e0
    ldr r1, .L_020284ec
    add r0, r1, r0, lsl #0x4
    bx lr
.L_020284ec: .word gGamePhaseGraphicsMetadataTable
    .size GamePhaseGraphicsMetadata_GetByIndex, . - GamePhaseGraphicsMetadata_GetByIndex

