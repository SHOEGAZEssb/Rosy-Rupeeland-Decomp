; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern gGameWork

    .global GamePhaseProgressController_Load
    .type GamePhaseProgressController_Load, @function
GamePhaseProgressController_Load: ; 0x02027930
    ldr r1, .L_02027a78
    mov r2, #0x0
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdf0]
    str r3, [r0, #0x0]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdfc]
    mov r3, r3, lsl #0x1f
    mov r3, r3, asr #0x1f
    str r3, [r0, #0x4]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdfc]
    mov r3, r3, lsl #0x1e
    mov r3, r3, asr #0x1f
    str r3, [r0, #0x8]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdfc]
    mov r3, r3, lsl #0x1b
    mov r3, r3, asr #0x1d
    str r3, [r0, #0xc]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdfc]
    mov r3, r3, lsl #0x18
    mov r3, r3, asr #0x1d
    str r3, [r0, #0x10]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdf4]
    str r3, [r0, #0x1c]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdf8]
    str r3, [r0, #0x20]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdfc]
    mov r3, r3, lsl #0x14
    mov r3, r3, lsr #0x1c
    str r3, [r0, #0x14]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdfc]
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x1c
    str r3, [r0, #0x18]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xdfc]
    mov r3, r3, lsl #0xb
    mov r3, r3, lsr #0x1b
    str r3, [r0, #0x24]
    ldr r3, [r1, #0x0]
    add r3, r3, #0x5000
    ldr r3, [r3, #0xe00]
    str r3, [r0, #0x28]
.L_02027a20:
    ldr r3, [r1, #0x0]
    add ip, r0, r2
    add r3, r3, r2
    add r3, r3, #0x5000
    ldrb r3, [r3, #0xe04]
    add r2, r2, #0x1
    cmp r2, #0xb
    strb r3, [ip, #0x2c]
    blt .L_02027a20
    ldr r2, .L_02027a78
    ldr r3, [r0, #0x14]
    ldr r1, [r2, #0x0]
    add r1, r1, #0x100
    strh r3, [r1, #0xce]
    ldr r1, [r2, #0x0]
    ldr r3, [r0, #0x18]
    add r1, r1, #0x100
    strh r3, [r1, #0x2e]
    ldr r1, [r0, #0x20]
    ldr r0, [r2, #0x0]
    str r1, [r0, #0x7f8]
    bx lr
.L_02027a78: .word gGameWork
    .size GamePhaseProgressController_Load, . - GamePhaseProgressController_Load

