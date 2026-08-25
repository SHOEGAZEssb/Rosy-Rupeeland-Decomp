; Matching retail form; see src/game/actor_collection_descriptor_helpers.c.
.text

    .global ActorCollection_GetFlagBit1
    .type ActorCollection_GetFlagBit1, @function
ActorCollection_GetFlagBit1: ; 0x02030b7c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe78]
    mov r0, r0, lsl #0x1e
    mov r0, r0, asr #0x1f
    bx lr
    .size ActorCollection_GetFlagBit1, . - ActorCollection_GetFlagBit1

