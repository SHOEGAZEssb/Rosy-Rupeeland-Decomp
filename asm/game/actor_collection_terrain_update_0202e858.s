; Matching retail form; see src/game/actor_collection_terrain_update.c.
.text
.extern data_021f5ebc
.extern func_0200b2c0
.extern Actor_GetCachedTerrainHeight
.extern Actor_QueryTerrainCell
.extern func_020828a0

    .global ActorCollection_UpdateCategory3TerrainActors
    .type ActorCollection_UpdateCategory3TerrainActors, @function
ActorCollection_UpdateCategory3TerrainActors: ; 0x0202e858
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    add r8, r0, #0x800
    ldr r7, [r0, #0xe2c]
    ldr r0, .L_0202eb14
    mov r1, #0x1
    bl func_020828a0
    cmp r0, #0x0
    moveq r4, #0x1
    mov r5, #0x1
    movne r4, #0x0
    mov r10, #0x0
    mov r11, r5
    b .L_0202eb04
.L_0202e890:
    cmp r4, #0x0
    ldr r9, [r8, #0x0]
    beq .L_0202eaec
    ldr r1, [r9, #0x14]
    tst r1, #0x2
    bne .L_0202eaec
    ldr r0, [r9, #0xd0]
    tst r0, #0x80000
    movne r0, r11
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_0202eaec
    tst r1, #0x200
    beq .L_0202e948
    mov r0, r9
    bl Actor_GetCachedTerrainHeight
    mov r6, r0
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x88]
    blx r1
    mov r0, r9
    bl Actor_GetCachedTerrainHeight
    cmp r6, r0
    beq .L_0202eafc
    ldr r0, [r9, #0x2c]
    str r0, [r9, #0x1c]
    ldr r1, [r9, #0x30]
    add r0, r9, #0x88
    str r1, [r9, #0x20]
    mov r1, #0x0
    str r6, [r9, #0x1dc]
    str r1, [r9, #0x40]
    mov r2, r1
    mov r3, r1
    str r1, [r9, #0x3c]
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r9, #0x98
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldr r0, [r9, #0xd0]
    orr r0, r0, #0x40
    str r0, [r9, #0xd0]
    b .L_0202eafc
.L_0202e948:
    ldrb r0, [r9, #0x4d]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_0202e974
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202ead8
.L_0202e974:
    mov r0, r9
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r9, #0x24]
    cmp r1, r0
    bne .L_0202ead8
    ldr r0, [r9, #0x14]
    tst r0, #0x40
    bne .L_0202ead8
    mov r0, r9
    bl Actor_GetCachedTerrainHeight
    mov r6, r0
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x88]
    blx r1
    ldr r1, [r9, #0x1c]
    ldr r2, [r9, #0x20]
    mov r0, r9
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl Actor_QueryTerrainCell
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r0, lsl #0x16
    mov r3, r0, lsr #0x1b
    cmp r3, #0x6
    mov r0, #0x0
    cmpne r3, #0x10
    moveq ip, #0x1
    movne ip, r0
    mov r1, r0
    mov r2, #0x1
    cmp ip, #0x0
    bne .L_0202ea20
    sub ip, r3, #0x11
    cmp ip, #0x3
    mov r3, #0x0
    bhi .L_0202ea18
    mov ip, r5, lsl ip
    tst ip, #0xb
    movne r3, r5
.L_0202ea18:
    cmp r3, #0x0
    moveq r2, #0x0
.L_0202ea20:
    cmp r2, #0x0
    beq .L_0202ea40
    ldrb r2, [r9, #0x4d]
    cmp r2, #0x1
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    movne r1, #0x1
.L_0202ea40:
    cmp r1, #0x0
    beq .L_0202ea54
    ldr r1, [r9, #0xd0]
    tst r1, #0x10000
    movne r0, #0x1
.L_0202ea54:
    cmp r0, #0x0
    bne .L_0202eafc
    mov r0, r9
    bl Actor_GetCachedTerrainHeight
    add r0, r0, #0x20000
    cmp r6, r0
    bge .L_0202ea84
    ldr r0, [sp, #0x4]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    bne .L_0202eafc
.L_0202ea84:
    ldr r0, [r9, #0x2c]
    str r0, [r9, #0x1c]
    ldr r1, [r9, #0x30]
    add r0, r9, #0x88
    str r1, [r9, #0x20]
    mov r1, #0x0
    str r6, [r9, #0x1dc]
    str r1, [r9, #0x40]
    mov r2, r1
    mov r3, r1
    str r1, [r9, #0x3c]
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r9, #0x98
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldr r0, [r9, #0xd0]
    orr r0, r0, #0x40
    str r0, [r9, #0xd0]
    b .L_0202eafc
.L_0202ead8:
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x88]
    blx r1
    b .L_0202eafc
.L_0202eaec:
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x88]
    blx r1
.L_0202eafc:
    add r10, r10, #0x1
    add r8, r8, #0x4
.L_0202eb04:
    cmp r10, r7
    blt .L_0202e890
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202eb14: .word data_021f5ebc
    .size ActorCollection_UpdateCategory3TerrainActors, . - ActorCollection_UpdateCategory3TerrainActors
