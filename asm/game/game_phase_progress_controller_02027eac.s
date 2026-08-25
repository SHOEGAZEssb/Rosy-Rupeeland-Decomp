; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern data_020c37f4
.extern func_020befec

    .global GamePhaseProgressController_ClassifyProgress
    .type GamePhaseProgressController_ClassifyProgress, @function
GamePhaseProgressController_ClassifyProgress: ; 0x02027eac
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x14]
    ldr r0, [r5, #0x18]
    ldr r1, .L_02027f28
    cmp r2, r0
    movlt r0, #0x1
    movge r0, #0x0
    ldr r4, [r1, r2, lsl #0x2]
    cmp r0, #0x0
    beq .L_02027ee8
    mov r0, r4
    mov r1, #0x5
    bl func_020befec
    mov r4, r0
.L_02027ee8:
    mov r0, #0x55
    mul r0, r4, r0
    ldr r5, [r5, #0x1c]
    mov r1, #0x64
    bl func_020befec
    cmp r5, r0
    movge r0, #0x2
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0x32
    mul r0, r4, r0
    mov r1, #0x64
    bl func_020befec
    cmp r5, r0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02027f28: .word data_020c37f4
    .size GamePhaseProgressController_ClassifyProgress, . - GamePhaseProgressController_ClassifyProgress

