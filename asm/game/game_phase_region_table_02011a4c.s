; Matching retail form; see src/game/game_phase_region_table_flags.c.
.text
.extern gActiveGamePhaseRegionTable

    .global GamePhaseRegionTable_PublishActive
GamePhaseRegionTable_PublishActive: ; 0x02011a4c
    ldr r1, L_02011a58
    str r0, [r1, #0x0]
    bx lr
L_02011a58: .word gActiveGamePhaseRegionTable
    .size GamePhaseRegionTable_PublishActive, . - GamePhaseRegionTable_PublishActive

