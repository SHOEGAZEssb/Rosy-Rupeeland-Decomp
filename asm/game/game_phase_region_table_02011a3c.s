; Matching retail form; see src/game/game_phase_region_table_flags.c.
.text

    .global GamePhaseRegionTable_GetCount
GamePhaseRegionTable_GetCount: ; 0x02011a3c
    ldr r0, [r0, #0x4]
    bx lr
    .size GamePhaseRegionTable_GetCount, . - GamePhaseRegionTable_GetCount

