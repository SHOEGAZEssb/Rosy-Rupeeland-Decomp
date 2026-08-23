; Matching retail form; see src/game/type7_actor_destination_collision_adjust.c.
.extern Actor_GetCachedTerrainHeight
.extern Actor_IsTerrainCellEligibleAtHeightOrOneBelow
.extern Actor_ClassifyTerrainCellTransition
.extern Fx32Vector2_Magnitude
.extern func_020adae4
.extern func_020adc90
.text
    .global Type7Actor_AdjustDestinationForCollisions
.type Type7Actor_AdjustDestinationForCollisions, @function
Type7Actor_AdjustDestinationForCollisions: ; 0x0204a5dc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r0
    bl Actor_GetCachedTerrainHeight
    mov r0, r0, asr #0x10
    str r0, [sp, #0xc]
    ldr r1, [r10, #0x7c]
    ldr r2, [r10, #0x80]
    ldr r3, [sp, #0xc]
    mov r0, r10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl Actor_IsTerrainCellEligibleAtHeightOrOneBelow
    cmp r0, #0x0
    movne r4, #0x20000
    ldr r3, [r10, #0x7c]
    ldr r2, [r10, #0x1c]
    ldr r1, [r10, #0x80]
    ldr r0, [r10, #0x20]
    sub r6, r3, r2
    sub r7, r1, r0
    mov r0, r6
    mov r1, r7
    moveq r4, #0x200000
    bl Fx32Vector2_Magnitude
    mov r5, r0
    cmp r5, r4
    blt .L_0204a888
    mov r0, r6
    mov r1, r5
    bl func_020adc90
    mov r4, r0
    mov r0, r7
    mov r1, r5
    bl func_020adc90
    cmp r5, #0x32000
    ble .L_0204a68c
    ldr r2, [r10, #0x1c]
    mov r1, #0x32
    mla r2, r4, r1, r2
    str r2, [r10, #0x7c]
    ldr r2, [r10, #0x20]
    mla r1, r0, r1, r2
    str r1, [r10, #0x80]
.L_0204a68c:
    ldr r3, [r10, #0x1c]
    mov r1, #0x1e
    mla r11, r4, r1, r3
    mov r4, #0x0
    ldr r2, [r10, #0x20]
    sub r9, r4, #0x2
    mla r1, r0, r1, r2
    str r1, [sp, #0x10]
    mov r5, r4
    mov r6, r4
    mov r7, r4
    str r4, [sp, #0x8]
    str r9, [sp, #0x14]
.L_0204a6c0:
    add r0, r9, r11, asr #0x10
    ldr r8, [sp, #0x14]
    str r0, [sp, #0x0]
.L_0204a6cc:
    ldr r2, [sp, #0x10]
    ldr r1, [sp, #0x0]
    ldr r3, [sp, #0xc]
    mov r0, r10
    add r2, r8, r2, asr #0x10
    bl Actor_IsTerrainCellEligibleAtHeightOrOneBelow
    cmp r0, #0x0
    beq .L_0204a734
    cmp r9, #0x0
    beq .L_0204a708
    mov r0, #0x2
    mov r1, r9
    bl func_020adae4
    add r4, r4, r0
    add r6, r6, #0x1
.L_0204a708:
    cmp r8, #0x0
    beq .L_0204a724
    mov r0, #0x2
    mov r1, r8
    bl func_020adae4
    add r5, r5, r0
    add r7, r7, #0x1
.L_0204a724:
    cmp r9, #0x0
    cmpeq r8, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x8]
.L_0204a734:
    add r8, r8, #0x1
    cmp r8, #0x2
    ble .L_0204a6cc
    add r9, r9, #0x1
    cmp r9, #0x2
    ble .L_0204a6c0
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    addne r6, r6, r6, lsl #0x1
    addne r7, r7, r7, lsl #0x1
    cmp r6, #0x0
    beq .L_0204a77c
    mov r1, r6
    mov r0, r4, lsl #0x11
    bl func_020adae4
    ldr r1, [r10, #0x7c]
    add r0, r1, r0
    str r0, [r10, #0x7c]
.L_0204a77c:
    cmp r7, #0x0
    beq .L_0204a7a0
    add r0, r5, r5, lsl #0x1
    mov r1, r7
    mov r0, r0, lsl #0x10
    bl func_020adae4
    ldr r1, [r10, #0x80]
    add r0, r1, r0
    str r0, [r10, #0x80]
.L_0204a7a0:
    mov r4, #0x0
    ldr r1, [r10, #0x1c]
    ldr r0, [r10, #0x20]
    sub r6, r4, #0x1
    mov r5, r4
    mov r8, r1, asr #0x10
    mov r9, r0, asr #0x10
    str r6, [sp, #0x18]
.L_0204a7c0:
    add r0, r6, r6, lsl #0x4
    mov r2, r6, lsl #0xf
    mov r1, r6, lsl #0x10
    str r0, [sp, #0x1c]
    rsb r0, r1, #0x0
    ldr r7, [sp, #0x18]
    str r0, [sp, #0x4]
    rsb r11, r2, #0x0
.L_0204a7e0:
    cmp r6, #0x0
    cmpeq r7, #0x0
    beq .L_0204a858
    ldr r1, [r10, #0x20]
    mov r0, #0x7000
    mla r1, r7, r0, r1
    ldr r2, [r10, #0x1c]
    ldr r0, [sp, #0x1c]
    add r0, r2, r0, lsl #0xc
    mov r2, r1, asr #0x10
    cmp r8, r0, asr #0x10
    mov r1, r0, asr #0x10
    cmpeq r9, r2
    beq .L_0204a858
    ldr r3, [sp, #0xc]
    mov r0, r10
    bl Actor_ClassifyTerrainCellTransition
    cmp r0, #0x0
    ble .L_0204a858
    cmp r0, #0x2
    movne r0, r7, lsl #0xf
    rsbne r0, r0, #0x0
    addne r5, r5, r0
    addne r4, r4, r11
    bne .L_0204a858
    mov r0, r7, lsl #0x10
    rsb r0, r0, #0x0
    add r5, r5, r0
    ldr r0, [sp, #0x4]
    add r4, r4, r0
.L_0204a858:
    add r7, r7, #0x1
    cmp r7, #0x1
    ble .L_0204a7e0
    add r6, r6, #0x1
    cmp r6, #0x1
    ble .L_0204a7c0
    ldr r0, [r10, #0x7c]
    add r0, r0, r4
    str r0, [r10, #0x7c]
    ldr r0, [r10, #0x80]
    add r0, r0, r5
    str r0, [r10, #0x80]
.L_0204a888:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size Type7Actor_AdjustDestinationForCollisions, . - Type7Actor_AdjustDestinationForCollisions

