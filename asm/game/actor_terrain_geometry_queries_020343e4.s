; Matching retail form; see src/game/actor_terrain_geometry_queries.c.
.text
.extern data_021052fc
.extern func_0200eb14
.extern Actor_QueryTerrainCell

    .global Actor_QueryTerrainHeight
    .type Actor_QueryTerrainHeight, @function
Actor_QueryTerrainHeight: ; 0x020343e4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x14]
    mov r7, r1
    tst r0, #0x4000000
    mov r6, r2
    movne r0, #0x0
    bne .L_02034458
    ldr r0, .L_02034460
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200eb14
    mov r5, r0
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl Actor_QueryTerrainCell
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r1, #0xf
    bne .L_02034454
    ldr r1, [r4, #0x24]
    add r0, r5, #0x4
    cmp r0, r1, asr #0x10
    movle r5, r0
.L_02034454:
    mov r0, r5
.L_02034458:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02034460: .word data_021052fc
    .size Actor_QueryTerrainHeight, . - Actor_QueryTerrainHeight

    .global Actor_QueryTerrainCell
