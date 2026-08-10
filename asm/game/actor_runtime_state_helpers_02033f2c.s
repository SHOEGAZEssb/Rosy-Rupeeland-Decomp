; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text
.extern Actor_RefreshTerrainHeight

    .global Actor_RefreshTerrainHeightIfEnabled
    .type Actor_RefreshTerrainHeightIfEnabled, @function
Actor_RefreshTerrainHeightIfEnabled: ; 0x02033f2c
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x14]
    tst r1, #0x1000000
    ldmneia sp!, {r3, pc}
    bl Actor_RefreshTerrainHeight
    ldmia sp!, {r3, pc}
    .size Actor_RefreshTerrainHeightIfEnabled, . - Actor_RefreshTerrainHeightIfEnabled

    .global func_02033f44
