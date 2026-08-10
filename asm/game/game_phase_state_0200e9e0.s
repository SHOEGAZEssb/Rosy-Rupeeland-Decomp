; Matching retail form; see src/game/game_phase_state_runtime.c.
.text
.extern func_0200fc64
.extern func_0201de4c

    .global GamePhaseState_UpdateRenderHelpers
GamePhaseState_UpdateRenderHelpers: ; 0x0200e9e0
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2000
    ldr r0, [r0, #0xf7c]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201de4c
    add r0, r4, #0x2000
    ldr r0, [r0, #0xeb0]
    cmp r0, #0x0
    beq L_0200ea24
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
L_0200ea24:
    add r0, r4, #0x2b4
    add r0, r0, #0x2c00
    bl func_0200fc64
    ldmia sp!, {r4, pc}
    .size GamePhaseState_UpdateRenderHelpers, . - GamePhaseState_UpdateRenderHelpers

