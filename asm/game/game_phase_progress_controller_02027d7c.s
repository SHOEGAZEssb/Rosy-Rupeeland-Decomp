; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern data_020c37e8
.extern GamePhaseProgressController_SetCounter
.extern gGameWork

    .global GamePhaseProgressController_LowerStage
    .type GamePhaseProgressController_LowerStage, @function
GamePhaseProgressController_LowerStage: ; 0x02027d7c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x14]
    sub r5, r1, #0x1
    cmp r5, #0x0
    movle r5, #0x0
    strle r5, [r4, #0x4]
    strle r5, [r4, #0xc]
    ble .L_02027db8
    ble .L_02027db8
    ldr r2, .L_02027de8
    mov r1, #0x3c
    ldr r2, [r2, #0x0]
    mul r1, r2, r1
    bl GamePhaseProgressController_SetCounter
.L_02027db8:
    mov r0, #0x0
    str r0, [r4, #0x10]
    str r5, [r4, #0x14]
    str r0, [r4, #0x24]
    str r0, [r4, #0x28]
    str r0, [r4, #0x1c]
    ldr r0, .L_02027dec
    ldr r1, [r4, #0x14]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x100
    strh r1, [r0, #0xce]
    ldmia sp!, {r3, r4, r5, pc}
.L_02027de8: .word data_020c37e8
.L_02027dec: .word gGameWork
    .size GamePhaseProgressController_LowerStage, . - GamePhaseProgressController_LowerStage

