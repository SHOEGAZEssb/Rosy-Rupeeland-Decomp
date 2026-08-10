; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text

    .global func_02033f20
    .type func_02033f20, @function
func_02033f20: ; 0x02033f20
    str r1, [r0, #0x1d4]
    str r2, [r0, #0x1d8]
    bx lr
    .size func_02033f20, . - func_02033f20

    .global Actor_RefreshTerrainHeightIfEnabled
