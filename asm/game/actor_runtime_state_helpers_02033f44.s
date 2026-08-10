; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text

    .global Actor_GetCachedTerrainHeight
    .type Actor_GetCachedTerrainHeight, @function
Actor_GetCachedTerrainHeight: ; 0x02033f44
    ldr r0, [r0, #0x1dc]
    bx lr
    .size Actor_GetCachedTerrainHeight, . - Actor_GetCachedTerrainHeight

    .global func_02033f4c

