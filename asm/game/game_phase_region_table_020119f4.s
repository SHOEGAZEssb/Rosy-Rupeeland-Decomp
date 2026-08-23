; Matching retail form; see src/game/game_phase_region_table_flags.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern gGameWork

    .global GamePhaseRegionTable_SetRegionRevealed
GamePhaseRegionTable_SetRegionRevealed: ; 0x020119f4
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0xc]
    mvn r0, #0x0
    cmp r3, r0
    ldmeqia sp!, {r3, pc}
    cmp r2, #0x0
    beq L_02011a24
    ldr r0, L_02011a38
    add r1, r3, r1
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldmia sp!, {r3, pc}
L_02011a24:
    ldr r0, L_02011a38
    add r1, r3, r1
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldmia sp!, {r3, pc}
L_02011a38: .word gGameWork
    .size GamePhaseRegionTable_SetRegionRevealed, . - GamePhaseRegionTable_SetRegionRevealed

