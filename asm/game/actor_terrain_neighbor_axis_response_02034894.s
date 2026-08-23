; Matching retail form; see src/game/actor_terrain_neighbor_axis_response.c.
.text
.extern Actor_IsTerrainCellEligibleAtHeight
.extern Memory_ClearBytes

    .global Actor_ApplyTerrainNeighborAxisBias
    .type Actor_ApplyTerrainNeighborAxisBias, @function
Actor_ApplyTerrainNeighborAxisBias: ; 0x02034894
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r1
    ldr r2, [r10, #0xc]
    str r0, [sp, #0x0]
    add r0, sp, #0x14
    mov r1, #0xc
    mov r11, r2, asr #0x10
    ldr r6, [r10, #0x4]
    ldr r5, [r10, #0x8]
    bl Memory_ClearBytes
    add r0, sp, #0x8
    mov r1, #0xc
    bl Memory_ClearBytes
    mvn r7, #0x0
    str r7, [sp, #0x4]
.L_020348d4:
    add r0, sp, #0x14
    ldr r8, [sp, #0x4]
    add r9, r7, r6, asr #0x10
    add r4, r0, r7, lsl #0x2
.L_020348e4:
    ldr r0, [sp, #0x0]
    mov r1, r9
    add r2, r8, r5, asr #0x10
    mov r3, r11
    bl Actor_IsTerrainCellEligibleAtHeight
    cmp r0, #0x0
    bne .L_02034920
    add r0, sp, #0x8
    add r1, r0, r8, lsl #0x2
    ldr r2, [r4, #0x4]
    ldr r0, [r1, #0x4]
    add r2, r2, #0x1
    add r0, r0, #0x1
    str r2, [r4, #0x4]
    str r0, [r1, #0x4]
.L_02034920:
    add r8, r8, #0x1
    cmp r8, #0x1
    ble .L_020348e4
    add r7, r7, #0x1
    cmp r7, #0x1
    ble .L_020348d4
    ldr r1, [sp, #0x14]
    cmp r1, #0x0
    ldreq r0, [sp, #0x1c]
    cmpeq r0, #0x0
    beq .L_02034974
    ldr r0, [sp, #0x1c]
    cmp r1, r0
    ldrgt r0, [r10, #0x4]
    addgt r0, r0, #0x2000
    strgt r0, [r10, #0x4]
    bgt .L_02034974
    cmp r0, r1
    ldrgt r0, [r10, #0x4]
    subgt r0, r0, #0x2000
    strgt r0, [r10, #0x4]
.L_02034974:
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    ldreq r0, [sp, #0x10]
    cmpeq r0, #0x0
    beq .L_020349b0
    ldr r0, [sp, #0x10]
    cmp r1, r0
    ldrgt r0, [r10, #0x8]
    addgt r0, r0, #0x4000
    strgt r0, [r10, #0x8]
    bgt .L_020349b0
    cmp r0, r1
    ldrgt r0, [r10, #0x8]
    subgt r0, r0, #0x4000
    strgt r0, [r10, #0x8]
.L_020349b0:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size Actor_ApplyTerrainNeighborAxisBias, . - Actor_ApplyTerrainNeighborAxisBias

    .global Actor_PlayHorizontalSpatialSound

