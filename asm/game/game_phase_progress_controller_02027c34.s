; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern data_020c37e8
.extern data_020c37f4
.extern func_02027864
.extern func_020278b4
.extern func_02027f38
.extern func_020befec
.extern gGameWork

    .global func_02027c34
    .type func_02027c34, @function
func_02027c34: ; 0x02027c34
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x14]
    ldr r0, [r5, #0x18]
    add r4, r2, #0x1
    cmp r2, r0
    movlt r0, #0x1
    movge r0, #0x0
    cmp r0, #0x0
    beq .L_02027c7c
    ldr r0, .L_02027d08
    mov r1, #0x5
    ldr r0, [r0, r2, lsl #0x2]
    bl func_020befec
    ldr r1, [r5, #0x1c]
    sub r0, r1, r0
    str r0, [r5, #0x1c]
    b .L_02027c94
.L_02027c7c:
    ldr r0, .L_02027d08
    ldr r1, [r5, #0x1c]
    ldr r0, [r0, r2, lsl #0x2]
    sub r0, r1, r0
    str r0, [r5, #0x1c]
    str r4, [r5, #0x18]
.L_02027c94:
    ldr r0, [r5, #0x1c]
    mov r1, #0x3c
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r5, #0x1c]
    ldr r0, .L_02027d0c
    str r4, [r5, #0x14]
    ldr r2, [r0, #0x0]
    mov r0, r5
    mul r1, r2, r1
    bl func_020278b4
    ldr r1, [r5, #0x1c]
    mov r0, r5
    bl func_02027864
    mov r0, r5
    bl func_02027f38
    mov r0, #0x0
    str r0, [r5, #0x24]
    str r0, [r5, #0x28]
    ldr r1, .L_02027d10
    ldr r2, [r5, #0x14]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x100
    strh r2, [r0, #0xce]
    ldr r0, [r1, #0x0]
    ldr r1, [r5, #0x18]
    add r0, r0, #0x100
    strh r1, [r0, #0x2e]
    ldmia sp!, {r3, r4, r5, pc}
.L_02027d08: .word data_020c37f4
.L_02027d0c: .word data_020c37e8
.L_02027d10: .word gGameWork
    .size func_02027c34, . - func_02027c34

