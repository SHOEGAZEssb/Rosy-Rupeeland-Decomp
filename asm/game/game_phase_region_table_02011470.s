; Matching retail form; see src/game/game_phase_region_table_lifecycle.c.
.text
.extern GamePhaseRegionTable_InitWithCount

    .global GamePhaseRegionTable_Init
GamePhaseRegionTable_Init: ; 0x02011470
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    bl GamePhaseRegionTable_InitWithCount
    ldr r1, [r4, #0x8]
    mov r0, r4
    bic r1, r1, #0xff
    orr r1, r1, #0xff
    str r1, [r4, #0x8]
    ldmia sp!, {r4, pc}
    .size GamePhaseRegionTable_Init, . - GamePhaseRegionTable_Init

