; Matching retail form; see src/game/actor_collection_registration.c.
.text

    .global ActorPairMatrix_Clear
    .type ActorPairMatrix_Clear, @function
ActorPairMatrix_Clear: ; 0x0202d324
    cmp r2, r1
    movgt r3, r1
    movgt r1, r2
    movgt r2, r3
    add r3, r2, #0x1
    mul r3, r2, r3
    add r3, r3, r3, lsr #0x1f
    mov r3, r3, asr #0x1
    rsb r2, r3, r2, lsl #0x7
    add r1, r1, r2
    mov r2, #0x0
    strb r2, [r0, r1]
    bx lr
    .size ActorPairMatrix_Clear, . - ActorPairMatrix_Clear
