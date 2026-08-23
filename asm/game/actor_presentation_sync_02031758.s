; Matching retail form; see src/game/actor_presentation_sync.c.
.text
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern RectS32_Set
.extern func_02030b7c
.extern Actor_GetCollisionCenter
.extern Actor_BuildCollisionRect
.extern Actor_GetOwningCollection
.extern Actor_BuildWorldInteractionBounds
.extern Actor_QueryTerrainCell
.extern func_02056f34
.extern ActorInteractionIcon_UpdatePresentation
.extern ActorInteractionIcon_UpdateEnabledState
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020adae4
.extern gSceneTouchInitialData

    .global Actor_UpdatePresentation
    .type Actor_UpdatePresentation, @function
Actor_UpdatePresentation: ; 0x02031758
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x60
    ldr r4, .L_02031ca4
    mov r3, #0x0
    str r4, [r0, #0x0]
    str r3, [r0, #0x4]
    mov r5, r1
    str r3, [r0, #0x8]
    ldr r6, [r5, #0x14]
    mov r4, r2
    tst r6, #0x200000
    beq .L_020317a0
    ldr r1, [r5, #0x54]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x8
    strneh r0, [r1, #0x24]
    b .L_02031c9c
.L_020317a0:
    ldr r2, [r5, #0x1c]
    ldr r1, [r5, #0x20]
    mov r7, r2, asr #0xc
    tst r6, #0x1000000
    mov r2, r1, asr #0xc
    strne r7, [r0, #0x4]
    strne r2, [r0, #0x8]
    bne .L_02031858
    tst r6, #0x80000
    bne .L_020317e4
    ldr r6, [r4, #0x4]
    ldr r3, [r4, #0x8]
    ldr r1, [r5, #0x24]
    sub r6, r7, r6, asr #0xc
    sub r2, r2, r3, asr #0xc
    mov r1, r1, asr #0xc
    b .L_0203184c
.L_020317e4:
    ldr r8, [r5, #0x1d0]
    ldr r1, [r5, #0x1c]
    ldr ip, [r5, #0x20]
    ldr r9, [r5, #0x24]
    smull r2, r6, r1, r8
    adds r7, r2, #0x800
    ldr lr, [r4, #0x4]
    ldr r1, [r4, #0x8]
    smull r10, r2, ip, r8
    adc r6, r6, r3
    adds ip, r10, #0x800
    mov r7, r7, lsr #0xc
    smull r10, r8, r9, r8
    adc r9, r2, r3
    adds r2, r10, #0x800
    mov r10, ip, lsr #0xc
    adc r3, r8, r3
    mov r8, r2, lsr #0xc
    orr r8, r8, r3, lsl #0x14
    orr r7, r7, r6, lsl #0x14
    mov r2, lr, asr #0xc
    orr r10, r10, r9, lsl #0x14
    mov r1, r1, asr #0xc
    rsb r6, r2, r7, asr #0xc
    rsb r2, r1, r10, asr #0xc
    mov r1, r8, asr #0xc
.L_0203184c:
    str r6, [r0, #0x4]
    sub r1, r2, r1
    str r1, [r0, #0x8]
.L_02031858:
    ldrsh r6, [r5, #0x6c]
    ldr r1, [r0, #0x4]
    ldr r3, [r5, #0x54]
    rsb r6, r6, #0x0
    cmp r1, r6
    blt .L_020318cc
    ldrsh r6, [r5, #0x68]
    rsb r6, r6, #0x100
    cmp r1, r6
    bge .L_020318cc
    ldrsh r6, [r5, #0x6e]
    ldr r7, [r0, #0x8]
    rsb r6, r6, #0x0
    cmp r7, r6
    blt .L_020318cc
    ldrsh r6, [r5, #0x6a]
    rsb r6, r6, #0xc0
    cmp r7, r6
    bge .L_020318cc
    cmp r3, #0x0
    strneh r1, [r3, #0x2c]
    strneh r7, [r3, #0x2e]
    ldrneh r0, [r3, #0x24]
    bicne r0, r0, #0x8
    strneh r0, [r3, #0x24]
    ldr r0, [r5, #0x10]
    orr r0, r0, #0x4
    str r0, [r5, #0x10]
    b .L_020318fc
.L_020318cc:
    cmp r3, #0x0
    beq .L_020318f0
    ldrh r1, [r3, #0x24]
    orr r1, r1, #0x8
    strh r1, [r3, #0x24]
    ldr r1, [r0, #0x8]
    ldr r0, [r0, #0x4]
    strh r0, [r3, #0x2c]
    strh r1, [r3, #0x2e]
.L_020318f0:
    ldr r0, [r5, #0x10]
    bic r0, r0, #0x4
    str r0, [r5, #0x10]
.L_020318fc:
    ldr r0, [r5, #0x54]
    cmp r0, #0x0
    beq .L_020319a8
    ldr r0, [r5, #0x14]
    tst r0, #0x1000000
    beq .L_0203192c
    ldr r0, [r5, #0x5c]
    rsb r1, r2, #0x8000
    mov r0, r0, lsl #0x10
    add r0, r1, r0, asr #0x10
    strh r0, [r3, #0x28]
    b .L_02031944
.L_0203192c:
    tst r0, #0x4000
    ldreq r0, [r5, #0x5c]
    rsbeq r1, r2, #0x8000
    moveq r0, r0, lsl #0x10
    addeq r0, r1, r0, asr #0x10
    streqh r0, [r3, #0x28]
.L_02031944:
    ldr r0, [r5, #0x10]
    tst r0, #0x4000000
    beq .L_020319a8
    ldr r7, [r5, #0x1d0]
    ldr r1, [r5, #0x1d4]
    ldr r0, [r5, #0x1d8]
    smull r2, r3, r1, r7
    adds r6, r2, #0x800
    smull r2, r1, r0, r7
    adc r3, r3, #0x0
    adds r0, r2, #0x800
    mov r6, r6, lsr #0xc
    adc r1, r1, #0x0
    mov r0, r0, lsr #0xc
    orr r6, r6, r3, lsl #0x14
    orr r0, r0, r1, lsl #0x14
    mov r1, #0x10
    bl func_020adae4
    mov r7, r0
    mov r0, r6
    mov r1, #0x10
    bl func_020adae4
    ldr r1, [r5, #0x54]
    strh r0, [r1, #0x32]
    strh r7, [r1, #0x34]
.L_020319a8:
    ldr r0, [r5, #0x14]
    tst r0, #0x1000000
    bne .L_02031c9c
    ldr r0, [r5, #0x1e0]
    cmp r0, #0x0
    beq .L_02031b30
    ldr r1, [r5, #0x184]
    cmp r1, #0x0
    beq .L_02031b04
    mov r0, r5
    bl Actor_GetOwningCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_02031af4
    mov r0, r5
    bl Actor_GetOwningCollection
    bl func_02030b7c
    cmp r0, #0x0
    beq .L_02031ad8
    add r0, sp, #0x50
    mov r1, r5
    add r2, r5, #0x18
    bl Actor_BuildWorldInteractionBounds
    mov r0, r5
    bl Actor_GetOwningCollection
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    add r0, sp, #0x20
    add r1, r1, #0x18
    bl VecFx32Object_InitCopy
    mov r0, r5
    bl Actor_GetOwningCollection
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    add r0, sp, #0x40
    add r2, sp, #0x20
    bl Actor_BuildCollisionRect
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    mov r1, #0x0
    add r0, sp, #0x30
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x0]
    bl RectS32_Set
    add r0, sp, #0x30
    add r1, sp, #0x50
    add r2, sp, #0x40
    add r3, sp, #0xc
    bl func_02056f34
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_02031ac8
    ldrb r1, [r5, #0x1e4]
    cmp r1, #0x0
    beq .L_02031aa8
    beq .L_02031b0c
    ldrb r0, [r5, #0x49]
    cmp r0, r1
    bne .L_02031b0c
.L_02031aa8:
    mov r0, r5
    bl Actor_GetOwningCollection
    bl func_02030b7c
    mov r1, r0
    ldr r0, [r5, #0x1e0]
    and r1, r1, #0x1
    bl ActorInteractionIcon_UpdateEnabledState
    b .L_02031b0c
.L_02031ac8:
    ldr r0, [r5, #0x1e0]
    mov r1, #0x0
    bl ActorInteractionIcon_UpdateEnabledState
    b .L_02031b0c
.L_02031ad8:
    ldr r0, [r5, #0x14]
    tst r0, #0x1000
    bne .L_02031b0c
    ldr r0, [r5, #0x1e0]
    mov r1, #0x0
    bl ActorInteractionIcon_UpdateEnabledState
    b .L_02031b0c
.L_02031af4:
    ldr r0, [r5, #0x1e0]
    mov r1, #0x0
    bl ActorInteractionIcon_UpdateEnabledState
    b .L_02031b0c
.L_02031b04:
    mov r1, #0x0
    bl ActorInteractionIcon_UpdateEnabledState
.L_02031b0c:
    add r0, sp, #0x10
    mov r1, r5
    bl Actor_GetCollisionCenter
    ldr r0, [r5, #0x1e0]
    add r2, sp, #0x10
    mov r1, r4
    bl ActorInteractionIcon_UpdatePresentation
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_02031b30:
    ldr r0, [r5, #0xa8]
    cmp r0, #0x0
    beq .L_02031c9c
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x20]
    mov r0, r5
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl Actor_QueryTerrainCell
    ldr r1, [r5, #0x14]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    tst r1, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02031c8c
    tst r1, #0x2000000
    beq .L_02031c8c
    ldr r0, [r5, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x4
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne .L_02031c8c
    ldr r3, [r5, #0x1dc]
    ldr r6, [r5, #0x24]
    cmp r6, r3
    ble .L_02031c8c
    ldr r0, [sp, #0x8]
    mov r2, #0x0
    mov r0, r0, lsl #0x16
    mov r0, r0, lsr #0x1b
    sub r1, r0, #0x11
    cmp r1, #0x3
    bhi .L_02031bd0
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0xb
    movne r2, r0
.L_02031bd0:
    cmp r2, #0x0
    bne .L_02031c8c
    sub r0, r6, r3
    cmp r0, #0x5800
    movlt r1, #0x1
    blt .L_02031bf4
    cmp r0, #0x20000
    movgt r1, #0x3
    movle r1, #0x2
.L_02031bf4:
    ldr r0, [r5, #0xa8]
    ldrb r2, [r0, #0x38]
    cmp r1, r2
    beq .L_02031c08
    bl GraphicsSpriteState_SetAnimationIndex
.L_02031c08:
    ldr r2, [r5, #0xa8]
    ldr r0, [sp, #0x8]
    ldrh r1, [r2, #0x24]
    mov r0, r0, lsl #0x1b
    mov r0, r0, asr #0x1b
    bic r1, r1, #0x8
    strh r1, [r2, #0x24]
    ldr r3, [r5, #0x1c]
    ldr r2, [r4, #0x4]
    ldr r1, [r5, #0xa8]
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    strh r2, [r1, #0x2c]
    ldr r3, [r5, #0x20]
    ldr r1, [r4, #0x8]
    ldr r2, [r5, #0x1dc]
    sub r1, r3, r1
    mov r1, r1, asr #0xc
    sub r3, r1, #0x2
    ldr r1, [r5, #0xa8]
    sub r2, r3, r2, asr #0xc
    strh r2, [r1, #0x2e]
    ldr r1, [r5, #0x1dc]
    cmp r1, r0, lsl #0x10
    movlt r1, #0x2
    ldr r0, [r5, #0xa8]
    movge r1, #0x1
    strb r1, [r0, #0x3a]
    ldr r0, .L_02031ca8
    ldr r1, [r5, #0xa8]
    sub r0, r0, r3
    strh r0, [r1, #0x28]
    b .L_02031c9c
.L_02031c8c:
    ldr r1, [r5, #0xa8]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x8
    strh r0, [r1, #0x24]
.L_02031c9c:
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02031ca4: .word gSceneTouchInitialData
.L_02031ca8: .word 0x8007
    .size Actor_UpdatePresentation, . - Actor_UpdatePresentation
