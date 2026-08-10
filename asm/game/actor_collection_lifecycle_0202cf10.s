; Matching retail form; see src/game/actor_collection_lifecycle.c.
.text

    .global ActorPairMatrix_ClearAll
    .type ActorPairMatrix_ClearAll, @function
ActorPairMatrix_ClearAll: ; 0x0202cf10
    mov r2, #0x0
    mov r1, r2
.L_0202cf18:
    strb r1, [r0, r2]
    add r2, r2, #0x1
    cmp r2, #0x2040
    blt .L_0202cf18
    bx lr
    .size ActorPairMatrix_ClearAll, . - ActorPairMatrix_ClearAll
