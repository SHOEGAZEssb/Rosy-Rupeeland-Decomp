; Matching retail form; see src/game/game_phase_state_runtime.c.
.text
.extern ByteTileMapOwner_GetCell

    .global GamePhaseState_QueryTerrainHeight
GamePhaseState_QueryTerrainHeight: ; 0x0200eb14
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    blt L_0200eb50
    add r0, r0, #0x2000
    ldr r0, [r0, #0xeb0]
    ldr r3, [r0, #0x20]
    mov ip, r3, lsl #0x10
    cmp r1, ip, lsr #0x10
    bge L_0200eb50
    cmp r2, #0x0
    blt L_0200eb50
    cmp r2, r3, lsr #0x10
    bge L_0200eb50
    bl ByteTileMapOwner_GetCell
    ldmia sp!, {r3, pc}
L_0200eb50:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size GamePhaseState_QueryTerrainHeight, . - GamePhaseState_QueryTerrainHeight

