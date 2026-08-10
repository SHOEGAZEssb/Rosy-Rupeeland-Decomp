; Matching retail form; see src/game/game_phase_region_table_lifecycle.c.
.text
.extern GamePhaseRegionTable_Clear

    .global GamePhaseRegionTable_Destroy
GamePhaseRegionTable_Destroy: ; 0x0201155c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseRegionTable_Clear
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq L_0201157c
    mov r0, r4
    bl GamePhaseRegionTable_Clear
L_0201157c:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size GamePhaseRegionTable_Destroy, . - GamePhaseRegionTable_Destroy

