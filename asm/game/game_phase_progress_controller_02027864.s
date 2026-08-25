; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern GamePhaseProgressController_RefreshWarningState
.extern func_020bf1f8

    .global GamePhaseProgressController_AddCounterFromProgress
    .type GamePhaseProgressController_AddCounterFromProgress, @function
GamePhaseProgressController_AddCounterFromProgress: ; 0x02027864
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, r1
    mov r1, #0xa
    bl func_020bf1f8
    mov r1, #0xe10
    mul r2, r0, r1
    ldr r0, [r4, #0x0]
    ldr r1, .L_020278b0
    adds r3, r2, r0
    mov r0, #0x0
    adc r2, r0, #0x0
    subs r0, r3, r1
    sbcs r0, r2, #0x0
    movge r3, r1
    mov r0, r4
    str r3, [r4, #0x0]
    bl GamePhaseProgressController_RefreshWarningState
    ldmia sp!, {r4, pc}
.L_020278b0: .word 0x6e002800
    .size GamePhaseProgressController_AddCounterFromProgress, . - GamePhaseProgressController_AddCounterFromProgress

