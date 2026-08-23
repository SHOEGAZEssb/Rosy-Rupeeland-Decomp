; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text
.extern Actor_RefreshCachedTerrainHeight

    .global Actor_RefreshCachedTerrainHeightIfEnabled
    .type Actor_RefreshCachedTerrainHeightIfEnabled, @function
Actor_RefreshCachedTerrainHeightIfEnabled: ; 0x02033f2c
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x14]
    tst r1, #0x1000000
    ldmneia sp!, {r3, pc}
    bl Actor_RefreshCachedTerrainHeight
    ldmia sp!, {r3, pc}
    .size Actor_RefreshCachedTerrainHeightIfEnabled, . - Actor_RefreshCachedTerrainHeightIfEnabled

    .global Actor_GetCachedTerrainHeight
