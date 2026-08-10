; Matching retail form; see src/game/actor_collection_active_drain.c.
.text
.extern ActorCollection_UnregisterActor

    .global ActorCollection_DrainRemovalQueue
    .type ActorCollection_DrainRemovalQueue, @function
ActorCollection_DrainRemovalQueue: ; 0x0202d5c8
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    add r6, r5, #0x2000
    ldr r0, [r6, #0xe78]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r4, #0x0
    mov r7, r4
    b .L_0202d630
.L_0202d5f0:
    add r0, r5, r4, lsl #0x2
    ldr r8, [r0, #0xc00]
    cmp r8, #0x0
    beq .L_0202d62c
    mov r0, r5
    mov r1, r8
    bl ActorCollection_UnregisterActor
    cmp r8, #0x0
    beq .L_0202d624
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0202d624:
    add r0, r5, r4, lsl #0x2
    str r7, [r0, #0xc00]
.L_0202d62c:
    add r4, r4, #0x1
.L_0202d630:
    ldr r0, [r6, #0xe74]
    cmp r4, r0
    blt .L_0202d5f0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size ActorCollection_DrainRemovalQueue, . - ActorCollection_DrainRemovalQueue
