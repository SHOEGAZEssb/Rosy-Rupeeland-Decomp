; Matching retail form; see src/game/actor_ground_contact_probe_update.c.
.text
.extern GameWork_TestFlag
.extern Sound_Play
.extern gActorRuntimeFlags
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Normalize
.extern VecFx32Object_Assign
.extern Actor_GetCachedTerrainHeight
.extern Actor_QueryTerrainHeight
.extern Actor_QueryTerrainCell
.extern Actor_IsTerrainCellEligibleAtHeightOrOneBelow
.extern func_02034800
.extern ActorRuntimeFlags_Test
.extern gGameWork
.extern gSoundContext
    .global Actor_UpdateGroundContactProbe
Actor_UpdateGroundContactProbe: ; 0x0203bba4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x34
    mov r10, r0
    ldr r0, [r10, #0x14]
    tst r0, #0x2
    bne .L_0203c11c
    ldr r0, .L_0203c124
    mov r1, #0x1
    bl ActorRuntimeFlags_Test
    cmp r0, #0x0
    bne .L_0203c11c
    ldr r0, [r10, #0xd0]
    tst r0, #0x80000
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    bne .L_0203c11c
    tst r0, #0x10000
    bne .L_0203c0a0
    tst r0, #0x10
    bne .L_0203c090
    ldr r3, [r10, #0x3c]
    ldr r2, [r10, #0x8c]
    ldr r1, [r10, #0x40]
    add r4, r3, r2
    ldr r0, [r10, #0x90]
    ldr r5, [r10, #0x9c]
    add r2, r1, r0
    ldr r3, [r10, #0xa0]
    add r0, r5, r4
    ldr r1, [r10, #0x1c]
    str r0, [sp, #0x10]
    add r4, r1, r0
    mov r7, r4, asr #0x10
    ldr r0, [r10, #0x20]
    add r11, r3, r2
    add r5, r0, r11
    mov r8, r5, asr #0x10
    mov r0, r10
    mov r1, r7
    mov r2, r8
    bl Actor_QueryTerrainHeight
    mov r6, r0, lsl #0x10
    mov r0, r10
    bl Actor_GetCachedTerrainHeight
    cmp r6, r0
    beq .L_0203c074
    mov r0, r10
    mov r1, r7
    mov r2, r8
    bl Actor_QueryTerrainCell
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    cmp r1, #0x8
    mov r7, #0x0
    blo .L_0203bc94
    cmp r1, #0xd
    movls r7, #0x1
.L_0203bc94:
    cmp r1, #0x7
    moveq r9, #0x1
    movne r9, #0x0
    cmp r1, #0x6
    cmpne r1, #0x10
    mov r8, #0x0
    moveq r2, #0x1
    movne r2, r8
    mov r0, #0x1
    cmp r2, #0x0
    bne .L_0203bcd8
    cmp r1, #0x14
    cmpne r1, #0x11
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    moveq r0, #0x0
.L_0203bcd8:
    cmp r0, #0x0
    beq .L_0203bcf8
    ldrb r0, [r10, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    movne r8, #0x1
.L_0203bcf8:
    ldr r0, .L_0203c128
    mov r1, #0x12
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, #0xc
    strne r0, [sp, #0x0]
    moveq r0, #0x30
    streq r0, [sp, #0x0]
    ldr r0, [sp, #0x20]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    beq .L_0203bd6c
    ldr r1, [r10, #0x1dc]
    ldr r0, [r10, #0x24]
    cmp r0, r1
    bne .L_0203c058
    add r0, r6, #0x10000
    cmp r1, r0
    bgt .L_0203bd64
    cmp r1, r6
    blt .L_0203bd64
    cmp r9, #0x0
    beq .L_0203c058
    cmp r6, r1
    bne .L_0203c058
.L_0203bd64:
    cmp r7, #0x0
    bne .L_0203c058
.L_0203bd6c:
    cmp r8, #0x0
    beq .L_0203bd98
    ldrb r0, [r10, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    addne r0, r10, #0x200
    ldrneh r0, [r0, #0x4]
    cmpne r0, #0x0
    bne .L_0203bf74
.L_0203bd98:
    ldrb r0, [r10, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0203bf68
    ldr r0, .L_0203c128
    ldr r1, .L_0203c12c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    addeq r0, r10, #0x200
    ldreqh r0, [r0, #0x4]
    cmpeq r0, #0x0
    bne .L_0203bf68
    ldr r0, [r10, #0x230]
    tst r0, #0x800
    bne .L_0203bf68
    cmp r8, #0x0
    beq .L_0203bf68
    mov r0, r10
    bl Actor_GetCachedTerrainHeight
    mov r0, r0, asr #0x10
    str r0, [sp, #0xc]
    mov r7, #0x4
    mov r9, #0x0
.L_0203be00:
    add r0, r9, r9, lsl #0x3
    add r2, r0, #0x8
    ldr r0, [sp, #0x10]
    ldr r3, [sp, #0xc]
    mla r1, r0, r2, r4
    mla r2, r11, r2, r5
    mov r0, r10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl Actor_IsTerrainCellEligibleAtHeightOrOneBelow
    cmp r0, #0x0
    add r9, r9, #0x1
    subeq r7, r7, #0x1
    cmp r9, #0x4
    blt .L_0203be00
    cmp r7, #0x0
    bne .L_0203be94
    add r0, r10, #0x200
    ldrh r0, [r0, #0xa2]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_0203be84
    ldr r1, [r10, #0x1dc]
    add r0, r6, #0x40000
    cmp r1, r0
    bge .L_0203be84
    ldr r0, .L_0203c130
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x43
    bl Sound_Play
.L_0203be84:
    add r0, r10, #0x200
    mov r1, #0x8
    strh r1, [r0, #0xa2]
    b .L_0203bf68
.L_0203be94:
    ldr r0, [r10, #0x1c]
    mov r5, #0x0
    ldr r1, [r10, #0x20]
    mov r0, r0, asr #0x10
    sub r7, r5, #0x1
    mov r4, #0x18000
    mov r6, r5
    str r0, [sp, #0x4]
    mov r11, r1, asr #0x10
    str r7, [sp, #0x14]
    rsb r4, r4, #0x0
.L_0203bec0:
    mul r0, r7, r4
    str r0, [sp, #0x8]
    add r0, r7, r7, lsl #0x4
    ldr r9, [sp, #0x14]
    str r0, [sp, #0x18]
.L_0203bed4:
    cmp r7, #0x0
    cmpeq r9, #0x0
    beq .L_0203bf2c
    ldr r1, [r10, #0x1c]
    ldr r0, [sp, #0x18]
    ldr r2, [r10, #0x20]
    add r0, r1, r0, lsl #0xc
    mov r1, #0x7000
    mla r1, r9, r1, r2
    mov r2, r1, asr #0x10
    ldr r1, [sp, #0x4]
    cmp r1, r0, asr #0x10
    mov r1, r0, asr #0x10
    cmpeq r11, r2
    beq .L_0203bf2c
    ldr r3, [sp, #0xc]
    mov r0, r10
    bl Actor_IsTerrainCellEligibleAtHeightOrOneBelow
    cmp r0, #0x0
    ldreq r0, [sp, #0x8]
    mlaeq r6, r9, r4, r6
    addeq r5, r5, r0
.L_0203bf2c:
    add r9, r9, #0x1
    cmp r9, #0x1
    ble .L_0203bed4
    add r7, r7, #0x1
    cmp r7, #0x1
    ble .L_0203bec0
    str r5, [r10, #0x9c]
    str r6, [r10, #0xa0]
    mov r0, #0x0
    cmp r5, #0x0
    str r0, [r10, #0xa4]
    cmpeq r6, #0x0
    beq .L_0203bf68
    add r0, r10, #0x98
    bl VecFx32Object_Normalize
.L_0203bf68:
    ldr r0, [sp, #0x0]
    add r1, r10, #0x200
    strh r0, [r1, #0x4]
.L_0203bf74:
    add r0, r10, #0x200
    ldrh r1, [r0, #0x4]
    cmp r1, #0x0
    beq .L_0203c048
    sub r1, r1, #0x1
    strh r1, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    cmp r0, #0x0
    ldr r0, [r10, #0xd0]
    beq .L_0203bfc8
    orr r0, r0, #0x40
    str r0, [r10, #0xd0]
    ldrb r0, [r10, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrne r0, [r10, #0x230]
    bicne r0, r0, #0x10000
    strne r0, [r10, #0x230]
    b .L_0203c11c
.L_0203bfc8:
    bic r0, r0, #0x40
    cmp r8, #0x0
    str r0, [r10, #0xd0]
    beq .L_0203c11c
    ldrb r0, [r10, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0203c11c
    add r0, r10, #0x200
    ldrh r0, [r0, #0xa2]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0203c11c
    ldr r1, [r10, #0xd0]
    add r0, sp, #0x24
    orr r2, r1, #0x10000
    add r1, r10, #0x28
    str r2, [r10, #0xd0]
    bl VecFx32Object_InitCopy
    add r1, sp, #0x24
    mov r0, r10
    bl func_02034800
    add r1, sp, #0x24
    add r0, r10, #0x284
    bl VecFx32Object_Assign
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    b .L_0203c11c
.L_0203c048:
    ldr r0, [r10, #0xd0]
    bic r0, r0, #0x40
    str r0, [r10, #0xd0]
    b .L_0203c11c
.L_0203c058:
    add r0, r10, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x4]
    ldr r0, [r10, #0xd0]
    bic r0, r0, #0x40
    str r0, [r10, #0xd0]
    b .L_0203c11c
.L_0203c074:
    add r0, r10, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x4]
    ldr r0, [r10, #0xd0]
    bic r0, r0, #0x40
    str r0, [r10, #0xd0]
    b .L_0203c11c
.L_0203c090:
    ldr r0, [r10, #0xd0]
    bic r0, r0, #0x40
    str r0, [r10, #0xd0]
    b .L_0203c11c
.L_0203c0a0:
    ldr r3, [r10, #0x1c]
    ldr r2, [r10, #0x3c]
    ldr r1, [r10, #0x20]
    ldr r0, [r10, #0x40]
    ldr r4, [r10, #0x8c]
    add r3, r3, r2
    ldr r2, [r10, #0x90]
    add r0, r1, r0
    ldr r5, [r10, #0x9c]
    add r1, r4, r3
    add r3, r5, r1
    ldr r1, [r10, #0xa0]
    add r0, r2, r0
    add r2, r1, r0
    mov r0, r10
    mov r1, r3, asr #0x10
    mov r2, r2, asr #0x10
    bl Actor_QueryTerrainHeight
    ldr r1, [r10, #0x24]
    cmp r1, r0, lsl #0x10
    bgt .L_0203c11c
    ldr r0, [r10, #0xd0]
    tst r0, #0x10
    ldreq r0, [r10, #0x1dc]
    cmpeq r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrne r0, [r10, #0xd0]
    bicne r0, r0, #0x10000
    strne r0, [r10, #0xd0]
.L_0203c11c:
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0203c124: .word gActorRuntimeFlags
.L_0203c128: .word gGameWork
.L_0203c12c: .word 0x25d
.L_0203c130: .word gSoundContext

    .size Actor_UpdateGroundContactProbe, . - Actor_UpdateGroundContactProbe

