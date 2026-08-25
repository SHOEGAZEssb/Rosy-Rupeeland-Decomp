; Matching retail form; see src/game/actor_collection_descriptor_helpers.c.
.text

    .global ActorCollection_SetFlagBit1
    .type ActorCollection_SetFlagBit1, @function
ActorCollection_SetFlagBit1: ; 0x02030b58
    add r0, r0, #0x2000
    ldr r3, [r0, #0xe78]
    mov r1, r1, lsl #0x1f
    bic r2, r3, #0x2
    mov r3, r3, lsl #0x1e
    orr r1, r2, r1, lsr #0x1e
    str r1, [r0, #0xe78]
    mov r0, r3, asr #0x1f
    bx lr
    .size ActorCollection_SetFlagBit1, . - ActorCollection_SetFlagBit1

