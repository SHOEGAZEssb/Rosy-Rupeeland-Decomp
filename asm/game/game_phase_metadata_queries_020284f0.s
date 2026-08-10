; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern gGamePhaseVariantMetadataTable

    .global GamePhaseVariantMetadata_GetForPhase
    .type GamePhaseVariantMetadata_GetForPhase, @function
GamePhaseVariantMetadata_GetForPhase: ; 0x020284f0
    ldrsb r1, [r0, #0x4c]
    ldr r2, .L_02028504
    mov r0, #0x1e
    mla r0, r1, r0, r2
    bx lr
.L_02028504: .word gGamePhaseVariantMetadataTable
    .size GamePhaseVariantMetadata_GetForPhase, . - GamePhaseVariantMetadata_GetForPhase

