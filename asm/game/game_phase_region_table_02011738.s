; Matching retail form; see src/game/game_phase_region_table_queries.c.
.text

    .global GamePhaseRegion_ContainsPoint
GamePhaseRegion_ContainsPoint: ; 0x02011738
    ldrsh r3, [r0, #0x6]
    cmp r2, r3
    ldrsh r3, [r0, #0x2]
    movlt ip, #0x1
    movge ip, #0x0
    cmp r2, r3
    ldrsh r2, [r0, #0x0]
    movge r3, #0x1
    movlt r3, #0x0
    cmp r1, r2
    movge r2, #0x1
    ldrsh r0, [r0, #0x4]
    movlt r2, #0x0
    cmp r1, r0
    movlt r0, #0x1
    movge r0, #0x0
    and r0, r2, r0
    and r0, r3, r0
    and r0, ip, r0
    bx lr
    .size GamePhaseRegion_ContainsPoint, . - GamePhaseRegion_ContainsPoint

