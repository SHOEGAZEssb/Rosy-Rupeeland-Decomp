; Matching retail form; see src/game/game_phase_region_table_queries.c.
.text
.extern GamePhaseRegion_ContainsPoint

    .global GamePhaseRegionTable_FindContainingRegion
GamePhaseRegionTable_FindContainingRegion: ; 0x020116e8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, #0x0
    b L_02011724
L_02011700:
    ldr r0, [r7, #0x0]
    mov r1, r6
    mov r2, r5
    add r0, r0, r4, lsl #0x3
    bl GamePhaseRegion_ContainsPoint
    cmp r0, #0x0
    movne r0, r4
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r4, r4, #0x1
L_02011724:
    ldr r0, [r7, #0x4]
    cmp r4, r0
    blt L_02011700
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size GamePhaseRegionTable_FindContainingRegion, . - GamePhaseRegionTable_FindContainingRegion

