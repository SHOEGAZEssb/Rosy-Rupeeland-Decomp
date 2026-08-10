; Matching retail form; see src/game/type7_actor_animation_update.c.
.text
.extern data_020e16b0
.extern data_020e1720
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_02072b68
.extern func_020740c8
.global Type7Actor_UpdateAnimationState
.type Type7Actor_UpdateAnimationState, @function
Type7Actor_UpdateAnimationState: ; 0x02046208
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r5, #0x1f8]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x54]
    ldr r2, [r5, #0x1f0]
    ldr r3, [r5, #0x1f4]
    bl func_020740c8
    ldrsh r0, [r5, #0xd6]
    mov r4, #0x100
    cmp r0, #0x12
    addls pc, pc, r0, lsl #0x2
    b .L_02046434
.L_02046244: ; jump table
    b .L_02046434 ; case 0
    b .L_02046330 ; case 1
    b .L_02046290 ; case 2
    b .L_02046290 ; case 3
    b .L_020462c8 ; case 4
    b .L_020462c8 ; case 5
    b .L_02046290 ; case 6
    b .L_02046290 ; case 7
    b .L_02046434 ; case 8
    b .L_02046434 ; case 9
    b .L_02046434 ; case 10
    b .L_020462f8 ; case 11
    b .L_02046368 ; case 12
    b .L_02046398 ; case 13
    b .L_020463f8 ; case 14
    b .L_020463c8 ; case 15
    b .L_0204647c ; case 16
    b .L_020462c8 ; case 17
    b .L_020464b8 ; case 18
.L_02046290:
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_020464e0
.L_020462c8:
    ldr r0, [r5, #0x54]
    mov r1, #0x21
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_020464e0
.L_020462f8:
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_020464e0
.L_02046330:
    ldrb r1, [r5, #0xd4]
    ldr r0, [r5, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_020464e0
.L_02046368:
    ldr r0, [r5, #0x54]
    mov r1, #0x12
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_020464e0
.L_02046398:
    ldr r0, [r5, #0x54]
    mov r1, #0x11
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_020464e0
.L_020463c8:
    ldr r0, [r5, #0x54]
    mov r1, #0x10
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_020464e0
.L_020463f8:
    ldr r0, .L_020464ec
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x70]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_020464f0
    bne .L_02046428
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02046428:
    cmp r3, #0x0
    moveq r4, #0x180
    movne r4, #0x140
.L_02046434:
    ldr r0, [r5, #0x54]
    ldrb r1, [r5, #0xd4]
    ldrb r2, [r0, #0x38]
    cmp r1, r2
    beq .L_0204644c
    bl func_02072b68
.L_0204644c:
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x268]
    tst r0, #0x400000
    movne r4, #0x140
    b .L_020464e0
.L_0204647c:
    ldr r0, [r5, #0x54]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x24
    beq .L_020464a4
    mov r1, #0x24
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_020464a4:
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_020464e0
.L_020464b8:
    ldr r0, [r5, #0x54]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x1a
    beq .L_020464e0
    mov r1, #0x1a
    bl func_02072b68
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
.L_020464e0:
    ldr r0, [r5, #0x54]
    strh r4, [r0, #0x36]
    ldmia sp!, {r3, r4, r5, pc}
.L_020464ec: .word data_020e16b0
.L_020464f0: .word data_020e1720
.size Type7Actor_UpdateAnimationState, . - Type7Actor_UpdateAnimationState
