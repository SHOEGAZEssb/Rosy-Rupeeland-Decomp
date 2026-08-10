; Matching retail form; see src/game/game_phase_region_table_lifecycle.c.
.text
.extern GamePhaseRegion_Destroy
.extern func_020c0c24

    .global GamePhaseRegionTable_Clear
GamePhaseRegionTable_Clear: ; 0x02011520
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq L_0201154c
    mov r1, #0x8
    ldr r3, L_02011558
    mov r2, r1
    bl func_020c0c24
    mov r0, #0x0
    str r0, [r4, #0x0]
L_0201154c:
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
L_02011558: .word GamePhaseRegion_Destroy
    .size GamePhaseRegionTable_Clear, . - GamePhaseRegionTable_Clear

