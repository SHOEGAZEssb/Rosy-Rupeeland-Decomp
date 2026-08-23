; Matching retail form; see src/game/actor_mode_nibble_update.c.
.text
.extern Actor_SynchronizeStatePresentation
.extern ActorDerivedRuntime_UpdateFrame
    .global ActorModeNibble_UpdateFrame
    .type ActorModeNibble_UpdateFrame, @function
ActorModeNibble_UpdateFrame: ; 0x0203c748
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x10]
    tst r1, #0x1000000
    beq .L_0203c764
    bl ActorDerivedRuntime_UpdateFrame
    ldmia sp!, {r4, pc}
.L_0203c764:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    add ip, r4, #0x200
    ldrh r0, [ip, #0x8]
    mov r1, r0, lsl #0x14
    mov r2, r1, lsr #0x14
    tst r2, #0x1
    beq .L_0203c800
    mov r1, #0x1000
    rsb r1, r1, #0x0
    bic r2, r2, #0x1
    mov r2, r2, lsl #0x10
    mov r3, r1, lsr #0x14
    and r1, r0, r1
    and r0, r3, r2, lsr #0x10
    orr r0, r1, r0
    strh r0, [ip, #0x8]
    mov r1, #0x1
    strh r1, [r4, #0xd6]
    ldr r0, [r4, #0x10]
    tst r0, #0x8
    beq .L_0203c7d8
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldr r1, [r4, #0xf0]
    ldr r2, [r2, #0x74]
    blx r2
    ldmia sp!, {r4, pc}
.L_0203c7d8:
    ldrh r0, [ip, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    movne r1, #0x0
    cmp r1, #0x0
    ldreq r0, [r4, #0x14]
    orreq r0, r0, #0x6
    streq r0, [r4, #0x14]
    b .L_0203c858
.L_0203c800:
    tst r2, #0x2
    beq .L_0203c858
    ldrsh r1, [r4, #0xd6]
    cmp r1, #0x1
    bne .L_0203c858
    ldr r1, [r4, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0203c858
    mov r1, #0x1000
    rsb r1, r1, #0x0
    bic r2, r2, #0x2
    mov r2, r2, lsl #0x10
    mov r3, r1, lsr #0x14
    and r1, r0, r1
    and r0, r3, r2, lsr #0x10
    orr r0, r1, r0
    strh r0, [ip, #0x8]
    mov r0, #0x0
    strh r0, [r4, #0xd6]
.L_0203c858:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r0, r4
    bl Actor_SynchronizeStatePresentation
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
    ldmia sp!, {r4, pc}

    .size ActorModeNibble_UpdateFrame, . - ActorModeNibble_UpdateFrame
