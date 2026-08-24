; Matching retail form; see src/game/actor_motion_integration.c.
.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_GetMagnitude
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern VecFx32Object_SetComponents
.extern Actor_UpdateTerrainMotionFeedback
.extern VecFx32Object_ScaleInPlaceRounded
.extern func_020adae4
.extern func_020adc90

    .global Actor_IntegrateMotion
    .type Actor_IntegrateMotion, @function
Actor_IntegrateMotion: ; 0x02032520
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0x28
    add r1, r4, #0x18
    bl VecFx32Object_Assign
    ldr r0, [r4, #0x14]
    tst r0, #0x100000
    beq .L_0203254c
    mov r0, r4
    bl Actor_UpdateTerrainMotionFeedback
.L_0203254c:
    ldrsh r0, [r4, #0xac]
    cmp r0, #0xff
    bne .L_020328b8
    ldr r0, [r4, #0xd0]
    tst r0, #0x40
    beq .L_020325f4
    mov r1, #0x0
    str r1, [r4, #0x40]
    mov r2, r1
    mov r3, r1
    str r1, [r4, #0x3c]
    add r0, r4, #0x88
    bl VecFx32Object_SetComponents
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_020325b0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl VecFx32Object_SetComponents
    b .L_020325e8
.L_020325b0:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    bgt .L_020325d4
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x1dc]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0xa4]
    beq .L_020325e8
.L_020325d4:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl VecFx32Object_SetComponents
.L_020325e8:
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x40
    str r0, [r4, #0xd0]
.L_020325f4:
    ldr r0, [r4, #0xd0]
    tst r0, #0x10
    bne .L_0203261c
    add r0, r4, #0x18
    add r1, r4, #0x38
    bl VecFx32Object_Add
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x20
    str r0, [r4, #0xd0]
    b .L_02032710
.L_0203261c:
    ldr r2, [r4, #0x3c]
    mov r0, #0xc00
    mov r1, #0x0
    umull r5, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r2, r5, #0x800
    adc r1, r3, #0x0
    mov r0, r2, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    mov r1, #0x2
    bl func_020adae4
    ldr r2, [r4, #0x8c]
    mov r1, #0x0
    add r0, r2, r0
    str r0, [r4, #0x8c]
    ldr r2, [r4, #0x40]
    mov r0, #0xc00
    umull r5, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r5, r5, #0x800
    adc r1, r3, #0x0
    mov r0, r5, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    mov r1, #0x2
    bl func_020adae4
    ldr r1, [r4, #0x90]
    add ip, r1, r0
    str ip, [r4, #0x90]
    ldr r5, [r4, #0x8c]
    smull r0, r2, r5, r5
    adds r3, r0, #0x800
    smull r1, r0, ip, ip
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r6, r3, r1
    cmp r6, #0x10000
    ble .L_020326f8
    mov r1, r6
    mov r0, r5, lsl #0x10
    bl func_020adae4
    str r0, [r4, #0x8c]
    ldr r0, [r4, #0x90]
    mov r1, r6
    mov r0, r0, lsl #0x10
    bl func_020adae4
    str r0, [r4, #0x90]
.L_020326f8:
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x44]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x90]
    blx r1
.L_02032710:
    add r0, r4, #0x18
    add r1, r4, #0x88
    bl VecFx32Object_Add
    ldr r0, [r4, #0xd0]
    tst r0, #0x10
    bne .L_02032748
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x1dc]
    cmp r1, r0
    ldreq r1, .L_020328c0
    add r0, r4, #0x88
    ldrne r1, .L_020328c4
    bl VecFx32Object_ScaleInPlaceRounded
    b .L_02032754
.L_02032748:
    ldr r1, .L_020328c8
    add r0, r4, #0x88
    bl VecFx32Object_ScaleInPlaceRounded
.L_02032754:
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    ldreq r0, [r4, #0xa0]
    cmpeq r0, #0x0
    ldreq r0, [r4, #0xa4]
    cmpeq r0, #0x0
    beq .L_02032808
    add r0, r4, #0x98
    bl VecFx32Object_GetMagnitude
    mov r5, r0
    cmp r5, #0x1000
    blt .L_020327e0
    ldr r0, [r4, #0x9c]
    mov r1, r5
    bl func_020adc90
    str r0, [r4, #0x9c]
    ldr r0, [r4, #0xa0]
    mov r1, r5
    bl func_020adc90
    str r0, [r4, #0xa0]
    ldr r0, [r4, #0xa4]
    mov r1, r5
    bl func_020adc90
    str r0, [r4, #0xa4]
    add r0, r4, #0x18
    add r1, r4, #0x98
    bl VecFx32Object_Add
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x1dc]
    cmp r1, r0
    ldreq r1, .L_020328cc
    add r0, r4, #0x98
    ldrne r1, .L_020328c0
    bl VecFx32Object_ScaleInPlaceRounded
    b .L_02032808
.L_020327e0:
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r1, sp, #0x0
    add r0, r4, #0x98
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02032808:
    ldr r0, [r4, #0x14]
    tst r0, #0x40
    bne .L_020328b8
    ldr r1, [r4, #0x1dc]
    ldr r2, [r4, #0x24]
    cmp r2, r1
    bgt .L_02032884
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    bge .L_02032884
    ldr r0, [r4, #0xd0]
    tst r0, #0x2000
    moveq r0, #0x0
    beq .L_02032854
    bic r0, r0, #0x2000
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x44]
    mvn r1, #0x1
    bl func_020adae4
.L_02032854:
    str r0, [r4, #0x44]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8c]
    blx r1
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x2
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x20000000
    str r0, [r4, #0x14]
    b .L_020328a8
.L_02032884:
    cmp r2, r1
    ble .L_020328a8
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xb0]
    blx r1
    ldr r1, [r4, #0x44]
    sub r0, r1, r0
    str r0, [r4, #0x44]
.L_020328a8:
    ldr r1, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r0, r1
    strlt r1, [r4, #0x24]
.L_020328b8:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_020328c0: .word 0xee1
.L_020328c4: .word 0xf5c
.L_020328c8: .word 0xfae
.L_020328cc: .word 0x99a
    .size Actor_IntegrateMotion, . - Actor_IntegrateMotion

