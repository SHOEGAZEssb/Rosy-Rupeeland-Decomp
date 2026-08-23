; Matching retail form; see src/game/actor_collection_terrain_context.c.
.text
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection

    .global Actor_GetCollectionBySlot
    .type Actor_GetCollectionBySlot, @function
Actor_GetCollectionBySlot: ; 0x02033810
    ldr r0, .L_02033820
    ldr ip, .L_02033824
    ldr r0, [r0, #0x0]
    bx ip
.L_02033820: .word data_021052fc
.L_02033824: .word GamePhaseRuntime_GetActorCollection
    .size Actor_GetCollectionBySlot, . - Actor_GetCollectionBySlot

    .global Actor_RefreshCachedTerrainHeight
