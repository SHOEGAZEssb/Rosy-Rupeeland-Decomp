; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern data_020c37ec
.extern data_020c37f0

    .global func_020278d4
    .type func_020278d4, @function
func_020278d4: ; 0x020278d4
    ldr r1, .L_02027928
    mov r3, #0x0
    ldr r2, [r1, #0x0]
    mov r1, #0x3c
    mul r1, r2, r1
    str r3, [r0, #0x10]
    ldr r2, [r0, #0x0]
    cmp r2, r1
    ldrls r1, [r0, #0x10]
    ldr r2, .L_0202792c
    addls r1, r1, #0x1
    strls r1, [r0, #0x10]
    ldr r2, [r2, #0x0]
    mov r1, #0x3c
    mul r1, r2, r1
    ldr r3, [r0, #0x0]
    cmp r3, r1
    ldrlo r1, [r0, #0x10]
    addlo r1, r1, #0x1
    strlo r1, [r0, #0x10]
    bx lr
.L_02027928: .word data_020c37f0
.L_0202792c: .word data_020c37ec
    .size func_020278d4, . - func_020278d4

