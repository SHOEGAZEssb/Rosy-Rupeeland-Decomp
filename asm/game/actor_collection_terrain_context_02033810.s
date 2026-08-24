; Matching retail form; see src/game/actor_collection_terrain_context.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_GetActorCollection

    .global Actor_GetGlobalCollectionBySlot
    .type Actor_GetGlobalCollectionBySlot, @function
Actor_GetGlobalCollectionBySlot: ; 0x02033810
    ldr r0, .L_02033820
    ldr ip, .L_02033824
    ldr r0, [r0, #0x0]
    bx ip
.L_02033820: .word gGamePhaseRuntime
.L_02033824: .word GamePhaseRuntime_GetActorCollection
    .size Actor_GetGlobalCollectionBySlot, . - Actor_GetGlobalCollectionBySlot

    .global Actor_RefreshCachedTerrainHeight
