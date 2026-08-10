; Matching retail form; see src/game/actor_table_record_frame_update.c.
.text
.extern data_021052fc
.extern func_02005070
.extern func_02032228
.extern func_020328d0
.extern Actor_UpdateAnimationState
.extern func_02034164
.extern Actor_QueryTerrainHeight
.extern ActorFeedback_SpawnIndexedPresentation
.extern func_020adae4
    .global ActorTableRecord_UpdateFrame
    .type ActorTableRecord_UpdateFrame, @function
ActorTableRecord_UpdateFrame: ; 0x0203cf8c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x18]
    blx r1
    add r0, r4, #0x200
    ldr r2, [r4, #0x20c]
    ldrh r1, [r0, #0x8]
    ldrh r3, [r0, #0xa]
    mov r2, r2, lsl #0x13
    add r0, r1, r2, lsr #0x13
    mov r1, #0x2
    add r0, r3, r0
    bl func_020adae4
    mov r1, #0x2000
    rsb r1, r1, #0x0
    ldr r2, [r4, #0x20c]
    and r0, r0, r1, lsr #0x13
    and r1, r2, r1
    orr r0, r1, r0
    str r0, [r4, #0x20c]
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa]
    ldr r0, [r4, #0x20c]
    bic r0, r0, #0x4000
    bic r0, r0, #0x8000
    str r0, [r4, #0x20c]
    ldr r0, [r4, #0x10]
    tst r0, #0x1000000
    beq .L_0203d01c
    mov r0, r4
    bl func_02034164
    cmp r0, #0x0
    beq .L_0203d250
.L_0203d01c:
    ldrb r0, [r4, #0x210]
    cmp r0, #0x0
    beq .L_0203d054
    sub r0, r0, #0x1
    strb r0, [r4, #0x210]
    ldr r1, [r4, #0x214]
    add r0, r4, #0x88
    ldrsh r1, [r1, #0x6]
    mov r2, r1, lsl #0xc
    mov r1, r2, asr #0x7
    add r1, r2, r1, lsr #0x18
    mov r1, r1, asr #0x8
    bl func_020328d0
    b .L_0203d0ac
.L_0203d054:
    ldr r1, [r4, #0x214]
    add r0, r4, #0x88
    ldrsh r1, [r1, #0x8]
    mov r2, r1, lsl #0xc
    mov r1, r2, asr #0x7
    add r1, r2, r1, lsr #0x18
    mov r1, r1, asr #0x8
    bl func_020328d0
    ldr r1, [r4, #0xd0]
    add r0, r4, #0x88
    bic r1, r1, #0x40
    str r1, [r4, #0xd0]
    bl func_02005070
    ldr r1, .L_0203d258
    cmp r0, r1
    bge .L_0203d0ac
    adds r1, r4, #0x88
    addne r1, r1, #0x4
    mov r0, #0x0
    str r0, [r1, #0x0]
    str r0, [r1, #0x4]
    str r0, [r1, #0x8]
.L_0203d0ac:
    ldrb r0, [r4, #0x211]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneb r0, [r4, #0x211]
    ldr r0, [r4, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0203d170
    ldr r0, .L_0203d25c
    ldr r2, [r4, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r1, [r4, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r5, r2, asr #0x10
    ldr r3, [r0, #0x0]
    mov r6, r1, asr #0x10
    ldr r3, [r3, #0x2c]
    mov r1, r5
    mov r2, r6
    blx r3
    mov r1, r0, lsl #0x12
    mov r7, r1, lsr #0x1c
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r7, #0x1
    bne .L_0203d170
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl Actor_QueryTerrainHeight
    ldr r1, [r4, #0x24]
    mov r0, r0, lsl #0x4
    cmp r0, r1, asr #0xc
    blt .L_0203d170
    mov r0, r4
    mov r1, r7
    mov r2, #0x100
    bl ActorFeedback_SpawnIndexedPresentation
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x10000000
    str r0, [r4, #0x14]
.L_0203d170:
    ldr r1, [r4, #0xd0]
    mov r0, r4
    orr r1, r1, #0x2000
    str r1, [r4, #0xd0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    ldr r0, [r4, #0xd0]
    tst r0, #0x2000
    bne .L_0203d1fc
    ldr r0, [r4, #0x3c]
    mov r1, #0x3
    bl func_020adae4
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    mov r1, #0x3
    bl func_020adae4
    str r0, [r4, #0x40]
    ldr r2, [r4, #0x3c]
    smull r1, r3, r2, r2
    adds ip, r1, #0x800
    smull r2, r1, r0, r0
    adc r3, r3, #0x0
    adds r2, r2, #0x800
    mov ip, ip, lsr #0xc
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    orr ip, ip, r3, lsl #0x14
    ldr r0, .L_0203d258
    add r1, ip, r1
    cmp r1, r0
    mov r0, #0x0
    strlt r0, [r4, #0x3c]
    strlt r0, [r4, #0x40]
.L_0203d1fc:
    ldr r0, [r4, #0x20c]
    mov r0, r0, lsl #0x12
    movs r0, r0, asr #0x1f
    beq .L_0203d238
    add r0, r4, #0x88
    bl func_02005070
    mov r1, #0x10
    bl func_020adae4
    ldr r1, [r4, #0x54]
    mov r3, #0x800
    strh r0, [r1, #0x36]
    ldr r1, [r4, #0x8c]
    ldr r2, [r4, #0x90]
    mov r0, r4
    bl func_02032228
.L_0203d238:
    mov r0, r4
    bl Actor_UpdateAnimationState
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
.L_0203d250:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0203d258: .word 0x19a
.L_0203d25c: .word data_021052fc

    .size ActorTableRecord_UpdateFrame, . - ActorTableRecord_UpdateFrame
