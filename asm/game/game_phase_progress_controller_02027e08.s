; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern GamePhaseProgressController_AddCounterFromProgress
.extern gGameWork

    .global GamePhaseProgressController_AddProgress
    .type GamePhaseProgressController_AddProgress, @function
GamePhaseProgressController_AddProgress: ; 0x02027e08
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x38]
    ldrne r0, [r4, #0x24]
    addne r0, r0, #0x1
    strne r0, [r4, #0x24]
    ldr r2, [r4, #0x1c]
    ldr r0, .L_02027e84
    add r2, r2, r1
    str r2, [r4, #0x1c]
    cmp r2, r0
    strgt r0, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    ldr r0, .L_02027e84
    add r2, r2, r1
    str r2, [r4, #0x20]
    cmp r2, r0
    strgt r0, [r4, #0x20]
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ble .L_02027e70
    mov r0, r4
    bl GamePhaseProgressController_AddCounterFromProgress
.L_02027e70:
    ldr r0, .L_02027e88
    ldr r1, [r4, #0x20]
    ldr r0, [r0, #0x0]
    str r1, [r0, #0x7f8]
    ldmia sp!, {r4, pc}
.L_02027e84: .word 0x98967f
.L_02027e88: .word gGameWork
    .size GamePhaseProgressController_AddProgress, . - GamePhaseProgressController_AddProgress

