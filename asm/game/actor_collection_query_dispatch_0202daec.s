; Matching retail form; see src/game/actor_collection_query_dispatch.c.
.text
.extern Actor_TestQueryPoint

    .global ActorCollection_DispatchQueryUntilHandled
    .type ActorCollection_DispatchQueryUntilHandled, @function
ActorCollection_DispatchQueryUntilHandled: ; 0x0202daec
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r6, #0x0
    mov r9, r0
    mov r8, r1
    mov r7, r6
    add r10, r9, #0x2000
    mov r4, r6
    mov r5, #0x1
    b .L_0202db64
.L_0202db10:
    ldr r0, [r9, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_0202db60
    ldr r1, [r0, #0x14]
    tst r1, #0x200000
    moveq r1, r5
    movne r1, r4
    cmp r1, #0x0
    beq .L_0202db60
    mov r1, r8
    bl Actor_TestQueryPoint
    cmp r0, #0x0
    beq .L_0202db60
    ldr r0, [r9, r7, lsl #0x2]
    mov r1, r8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x4c]
    blx r2
    movs r6, r0
    bne .L_0202db70
.L_0202db60:
    add r7, r7, #0x1
.L_0202db64:
    ldr r0, [r10, #0xe74]
    cmp r7, r0
    blt .L_0202db10
.L_0202db70:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    .size ActorCollection_DispatchQueryUntilHandled, . - ActorCollection_DispatchQueryUntilHandled
