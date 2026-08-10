; Matching retail form; see src/game/actor_collection_query_dispatch.c.
.text

    .global ActorCollection_BroadcastQuery
    .type ActorCollection_BroadcastQuery, @function
ActorCollection_BroadcastQuery: ; 0x0202db78
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    mov r6, #0x0
    mov r7, r1
    add r9, r8, #0x2000
    mov r4, r6
    mov r5, #0x1
    b .L_0202dbd0
.L_0202db98:
    ldr r0, [r8, r6, lsl #0x2]
    cmp r0, #0x0
    beq .L_0202dbcc
    ldr r1, [r0, #0x14]
    tst r1, #0x200000
    moveq r1, r5
    movne r1, r4
    cmp r1, #0x0
    beq .L_0202dbcc
    ldr r2, [r0, #0x0]
    mov r1, r7
    ldr r2, [r2, #0x50]
    blx r2
.L_0202dbcc:
    add r6, r6, #0x1
.L_0202dbd0:
    ldr r0, [r9, #0xe74]
    cmp r6, r0
    blt .L_0202db98
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size ActorCollection_BroadcastQuery, . - ActorCollection_BroadcastQuery
