; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern gGameWork

    .global GamePhaseProgressController_Save
    .type GamePhaseProgressController_Save, @function
GamePhaseProgressController_Save: ; 0x02027a7c
    stmdb sp!, {r3, lr}
    ldr r1, .L_02027bd0
    ldr ip, [r0, #0x0]
    ldr r3, [r1, #0x0]
    mov r2, #0x0
    add r3, r3, #0x5000
    str ip, [r3, #0xdf0]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0x4]
    add r3, r3, #0x5000
    ldr lr, [r3, #0xdfc]
    and ip, ip, #0x1
    bic lr, lr, #0x1
    orr ip, lr, ip
    str ip, [r3, #0xdfc]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0x8]
    add r3, r3, #0x5000
    ldr lr, [r3, #0xdfc]
    mov ip, ip, lsl #0x1f
    bic lr, lr, #0x2
    orr ip, lr, ip, lsr #0x1e
    str ip, [r3, #0xdfc]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0xc]
    add r3, r3, #0x5000
    ldr lr, [r3, #0xdfc]
    mov ip, ip, lsl #0x1d
    bic lr, lr, #0x1c
    orr ip, lr, ip, lsr #0x1b
    str ip, [r3, #0xdfc]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0x10]
    add r3, r3, #0x5000
    ldr lr, [r3, #0xdfc]
    mov ip, ip, lsl #0x1d
    bic lr, lr, #0xe0
    orr ip, lr, ip, lsr #0x18
    str ip, [r3, #0xdfc]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0x1c]
    add r3, r3, #0x5000
    str ip, [r3, #0xdf4]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0x20]
    add r3, r3, #0x5000
    str ip, [r3, #0xdf8]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0x14]
    add r3, r3, #0x5000
    ldr lr, [r3, #0xdfc]
    mov ip, ip, lsl #0x1c
    bic lr, lr, #0xf00
    orr ip, lr, ip, lsr #0x14
    str ip, [r3, #0xdfc]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0x18]
    add r3, r3, #0x5000
    ldr lr, [r3, #0xdfc]
    mov ip, ip, lsl #0x1c
    bic lr, lr, #0xf000
    orr ip, lr, ip, lsr #0x10
    str ip, [r3, #0xdfc]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0x24]
    add r3, r3, #0x5000
    ldr lr, [r3, #0xdfc]
    mov ip, ip, lsl #0x1b
    bic lr, lr, #0x1f0000
    orr ip, lr, ip, lsr #0xb
    str ip, [r3, #0xdfc]
    ldr r3, [r1, #0x0]
    ldr ip, [r0, #0x28]
    add r3, r3, #0x5000
    str ip, [r3, #0xe00]
.L_02027ba8:
    add ip, r0, r2
    ldr r3, [r1, #0x0]
    ldrb ip, [ip, #0x2c]
    add r3, r3, r2
    add r3, r3, #0x5000
    add r2, r2, #0x1
    strb ip, [r3, #0xe04]
    cmp r2, #0xb
    blt .L_02027ba8
    ldmia sp!, {r3, pc}
.L_02027bd0: .word gGameWork
    .size GamePhaseProgressController_Save, . - GamePhaseProgressController_Save

