; Matching retail form; see src/game/actor_terrain_geometry_queries.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseState_QueryTerrainHeight
.extern func_020adae4

    .global Position_AdjustForTerrainHeight
    .type Position_AdjustForTerrainHeight, @function
Position_AdjustForTerrainHeight: ; 0x020344b8
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x10
    mov r0, r0, asr #0xc
    bl func_020adae4
    ldr r1, [r6, #0x8]
    mov r4, r0
    mov r0, r1, asr #0xc
    mov r1, #0x10
    bl func_020adae4
    ldr r1, .L_02034564
    mov r5, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x10
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r0, [r0, #0x20]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x4
    bl func_020adae4
    sub r8, r0, #0x1
    ldr r7, .L_02034564
    b .L_02034558
.L_02034518:
    ldr r0, [r7, #0x0]
    mov r1, r4
    mov r2, r5
    add r0, r0, #0x24
    bl GamePhaseState_QueryTerrainHeight
    sub r1, r8, r0
    cmp r5, r1
    bne .L_02034554
    ldr r1, [r6, #0x8]
    mov r2, r0, lsl #0x4
    add r0, r1, r2, lsl #0xc
    str r0, [r6, #0x8]
    mov r0, r2, lsl #0xc
    str r0, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02034554:
    sub r8, r8, #0x1
.L_02034558:
    cmp r8, #0x0
    bge .L_02034518
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02034564: .word gGamePhaseRuntime
    .size Position_AdjustForTerrainHeight, . - Position_AdjustForTerrainHeight

    .global Actor_IsTerrainCellEligibleAtHeight
