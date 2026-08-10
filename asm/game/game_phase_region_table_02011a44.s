; Matching retail form; see src/game/game_phase_region_table_flags.c.
.text

    .global GamePhaseRegionTable_SetGameWorkFlagBase
GamePhaseRegionTable_SetGameWorkFlagBase: ; 0x02011a44
    str r1, [r0, #0xc]
    bx lr
    .size GamePhaseRegionTable_SetGameWorkFlagBase, . - GamePhaseRegionTable_SetGameWorkFlagBase

