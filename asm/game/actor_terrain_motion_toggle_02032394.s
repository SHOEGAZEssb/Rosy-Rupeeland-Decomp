; Matching retail form; see src/game/actor_terrain_motion_toggle.c.
.text
.extern data_021052fc
.extern ActorFeedbackResources_GetPackedSound
.extern ActorFeedback_SpawnIndexedPresentation

    .global Actor_UpdateTerrainMotionFeedback
    .type Actor_UpdateTerrainMotionFeedback, @function
Actor_UpdateTerrainMotionFeedback: ; 0x02032394
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r0, #0x8
    bl ActorFeedbackResources_GetPackedSound
    cmp r0, #0x0
    bne .L_020323c0
    mov r0, #0x7
    bl ActorFeedbackResources_GetPackedSound
    cmp r0, #0x0
    beq .L_020323fc
.L_020323c0:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa0]
    blx r1
    cmp r0, #0x0
    bne .L_020323fc
    ldr r0, [r4, #0xd0]
    tst r0, #0x10
    bne .L_020323fc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    beq .L_02032408
.L_020323fc:
    mvn r0, #0x5
    strb r0, [r4, #0x1e5]
    b .L_020324bc
.L_02032408:
    ldr r0, .L_020324c4
    ldr r1, [r4, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r2, [r4, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r1, r1, asr #0x10
    ldr r3, [r0, #0x0]
    mov r2, r2, asr #0x10
    ldr r3, [r3, #0x2c]
    blx r3
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1c
    sub r2, r1, #0x7
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r2, #0x1
    bhi .L_020324b4
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    beq .L_020324bc
    add r0, r4, #0x100
    ldrsb r2, [r0, #0xe5]
    add r2, r2, #0x1
    strb r2, [r4, #0x1e5]
    ldrsb r2, [r0, #0xe5]
    cmp r2, #0x0
    bne .L_02032490
    ldrsh r2, [r0, #0xe8]
    mov r0, r4
    bl ActorFeedback_SpawnIndexedPresentation
    b .L_020324bc
.L_02032490:
    ldrb r1, [r4, #0x1e7]
    cmp r2, r1
    ble .L_020324bc
    ldrsb r1, [r0, #0xe6]
    mvn r0, #0x0
    eor r1, r1, #0x1
    strb r1, [r4, #0x1e6]
    strb r0, [r4, #0x1e5]
    b .L_020324bc
.L_020324b4:
    mvn r0, #0x0
    strb r0, [r4, #0x1e5]
.L_020324bc:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_020324c4: .word data_021052fc
    .size Actor_UpdateTerrainMotionFeedback, . - Actor_UpdateTerrainMotionFeedback

