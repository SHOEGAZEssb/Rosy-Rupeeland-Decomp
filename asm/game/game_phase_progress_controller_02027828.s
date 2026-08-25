; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern data_020c3820
.extern func_020befec

    .global GamePhaseProgressController_GetAdjustedThreshold
    .type GamePhaseProgressController_GetAdjustedThreshold, @function
GamePhaseProgressController_GetAdjustedThreshold: ; 0x02027828
    stmdb sp!, {r4, lr}
    add r0, r0, r1
    ldr r2, .L_02027850
    ldrb r0, [r0, #0x2c]
    ldr r4, [r2, r1, lsl #0x2]
    mov r1, #0x64
    mul r0, r4, r0
    bl func_020befec
    add r0, r4, r0
    ldmia sp!, {r4, pc}
.L_02027850: .word data_020c3820
    .size GamePhaseProgressController_GetAdjustedThreshold, . - GamePhaseProgressController_GetAdjustedThreshold

