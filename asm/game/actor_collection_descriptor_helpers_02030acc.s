; Matching retail form; see src/game/actor_collection_descriptor_helpers.c.
.text

    .global ActorCollection_GetSpriteGroup
    .type ActorCollection_GetSpriteGroup, @function
ActorCollection_GetSpriteGroup: ; 0x02030acc
    ldr r0, [r0, #0xe00]
    bx lr
    .size ActorCollection_GetSpriteGroup, . - ActorCollection_GetSpriteGroup

