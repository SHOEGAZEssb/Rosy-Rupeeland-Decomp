; Matching retail form; see src/game/actor_collection_terrain_context.c.
.text
.extern data_021052fc
.extern GamePhaseState_QueryTerrainHeight
.extern Actor_QueryTerrainCell

    .global Actor_RefreshCachedTerrainHeight
    .type Actor_RefreshCachedTerrainHeight, @function
Actor_RefreshCachedTerrainHeight: ; 0x02033828
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x14]
    tst r0, #0x4000000
    movne r0, #0x0
    strne r0, [r5, #0x1dc]
    bne .L_020338d8
    ldr r0, .L_020338e0
    ldr r2, [r5, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r0, #0x0]
    mov r6, r2, asr #0x10
    mov r7, r1, asr #0x10
    mov r1, r6
    mov r2, r7
    add r0, r0, #0x24
    bl GamePhaseState_QueryTerrainHeight
    mov r4, r0
    mov r0, r5
    mov r1, r6
    mov r2, r7
    bl Actor_QueryTerrainCell
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r1, #0xf
    bne .L_020338c4
    ldr r0, [r5, #0x24]
    add r1, r4, #0x4
    cmp r1, r0, asr #0x10
    ldr r0, [r5, #0x10]
    movle r4, r1
    bicle r0, r0, #0x2000000
    strle r0, [r5, #0x10]
    orrgt r0, r0, #0x2000000
    strgt r0, [r5, #0x10]
    b .L_020338d0
.L_020338c4:
    ldr r0, [r5, #0x10]
    bic r0, r0, #0x2000000
    str r0, [r5, #0x10]
.L_020338d0:
    mov r0, r4, lsl #0x10
    str r0, [r5, #0x1dc]
.L_020338d8:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_020338e0: .word data_021052fc
    .size Actor_RefreshCachedTerrainHeight, . - Actor_RefreshCachedTerrainHeight

    .global func_020338e4
