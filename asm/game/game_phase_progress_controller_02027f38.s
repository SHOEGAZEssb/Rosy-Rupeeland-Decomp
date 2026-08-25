; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern func_020befec

    .global GamePhaseProgressController_RefreshCurrentStageAdjustment
    .type GamePhaseProgressController_RefreshCurrentStageAdjustment, @function
GamePhaseProgressController_RefreshCurrentStageAdjustment: ; 0x02027f38
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x24]
    cmp r4, #0x0
    movlt r4, #0x0
    blt .L_02027f58
    cmp r4, #0x14
    movgt r4, #0x14
.L_02027f58:
    ldr r0, [r5, #0x28]
    mov r1, #0xe10
    bl func_020befec
    rsb r0, r0, #0xc8
    mov r1, #0xa
    bl func_020befec
    adds r1, r4, r0
    movmi r1, #0x0
    bmi .L_02027f84
    cmp r1, #0x14
    movgt r1, #0x14
.L_02027f84:
    ldr r0, [r5, #0x14]
    add r0, r5, r0
    strb r1, [r0, #0x2c]
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseProgressController_RefreshCurrentStageAdjustment, . - GamePhaseProgressController_RefreshCurrentStageAdjustment

