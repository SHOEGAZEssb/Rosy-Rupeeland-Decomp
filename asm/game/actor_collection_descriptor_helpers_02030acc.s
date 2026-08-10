; Matching retail form; see src/game/actor_collection_descriptor_helpers.c.
.text

    .global ActorCollection_GetSpriteOwner
    .type ActorCollection_GetSpriteOwner, @function
ActorCollection_GetSpriteOwner: ; 0x02030acc
    ldr r0, [r0, #0xe00]
    bx lr
    .size ActorCollection_GetSpriteOwner, . - ActorCollection_GetSpriteOwner

