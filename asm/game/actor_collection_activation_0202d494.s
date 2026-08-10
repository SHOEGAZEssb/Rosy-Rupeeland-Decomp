; Matching retail form; see src/game/actor_collection_activation.c.
.text
.extern ActorPairMatrix_Get
.extern ActorCollection_NotifyPairEnded
.extern ActorPairMatrix_Clear
.extern ActorCollection_RegisterActor

    .global ActorCollection_QueueActorForRemoval
    .type ActorCollection_QueueActorForRemoval, @function
ActorCollection_QueueActorForRemoval: ; 0x0202d494
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r1
    ldrb r1, [r4, #0x4d]
    mov r5, r0
    cmp r1, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202d544
    add r0, r5, #0x2000
    ldr r0, [r0, #0xe80]
    cmp r0, r4
    bne .L_0202d544
    mov r8, #0x1
    mov r9, #0x0
    add r6, r5, #0x234
    mov r7, r8
.L_0202d4d8:
    ldr r0, [r5, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_0202d50c
    mov r1, r8
    mov r2, r9
    add r0, r6, #0xc00
    bl ActorPairMatrix_Get
    cmp r0, #0x0
    beq .L_0202d50c
    ldr r1, [r5, r9, lsl #0x2]
    mov r0, r5
    mov r2, r4
    bl ActorCollection_NotifyPairEnded
.L_0202d50c:
    mov r1, r7
    mov r2, r9
    add r0, r6, #0xc00
    bl ActorPairMatrix_Clear
    add r9, r9, #0x1
    cmp r9, #0x80
    blt .L_0202d4d8
    mov r0, r5
    mov r1, r4
    bl ActorCollection_RegisterActor
    mov r1, #0x0
    str r1, [r5, #0x4]
    add r0, r5, #0x2000
    str r1, [r0, #0xe80]
.L_0202d544:
    ldrsb r1, [r4, #0x48]
    add r0, r5, #0x2000
    add r1, r5, r1, lsl #0x2
    str r4, [r1, #0xc00]
    ldr r1, [r0, #0xe78]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r0, #0xe78]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size ActorCollection_QueueActorForRemoval, . - ActorCollection_QueueActorForRemoval
