; Matching retail form; see src/game/game_phase_state_lifecycle.c.
.text
.extern OverlaySlot_Init
.extern GamePhaseVisualEffect_Init
.extern GamePhaseRegionTable_Init
.extern func_0201dbc8
.extern ActorCollection_Init

    .global GamePhaseState_Init
GamePhaseState_Init: ; 0x0200e4dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    add r0, r4, #0x4
    str r1, [r4, #0x0]
    bl ActorCollection_Init
    add r0, r4, #0x2a4
    add r0, r0, #0x2c00
    bl OverlaySlot_Init
    add r0, r4, #0x2b4
    add r1, r4, #0x2000
    mov r2, #0x0
    add r0, r0, #0x2c00
    str r2, [r1, #0xeb0]
    bl GamePhaseVisualEffect_Init
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201dbc8
    add r1, r4, #0x2000
    ldr r2, [r1, #0xf7c]
    add r0, r4, #0x2f80
    bic r2, r2, #0x1
    orr r2, r2, #0x3
    str r2, [r1, #0xf7c]
    bl GamePhaseRegionTable_Init
    add r1, r4, #0x2f00
    mov r0, #0x1
    strh r0, [r1, #0x90]
    ldrsh r2, [r1, #0x92]
    mov r0, r4
    bic r2, r2, #0xff
    orr r2, r2, #0x8
    strh r2, [r1, #0x92]
    ldrsh r2, [r1, #0x92]
    bic r2, r2, #0xff00
    orr r2, r2, #0x800
    strh r2, [r1, #0x92]
    ldmia sp!, {r4, pc}
    .size GamePhaseState_Init, . - GamePhaseState_Init

