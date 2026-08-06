; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern data_020c37f4
.extern func_020befec

    .global func_02027d14
    .type func_02027d14, @function
func_02027d14: ; 0x02027d14
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x14]
    mov r4, #0x0
    cmp r2, #0xa
    bge .L_02027d70
    ldr r0, [r5, #0x18]
    ldr r1, .L_02027d78
    cmp r2, r0
    ldr r0, [r1, r2, lsl #0x2]
    movlt r1, #0x1
    movge r1, r4
    cmp r1, #0x0
    beq .L_02027d64
    mov r1, #0x5
    bl func_020befec
    ldr r1, [r5, #0x1c]
    cmp r1, r0
    movge r4, #0x1
    b .L_02027d70
.L_02027d64:
    ldr r1, [r5, #0x1c]
    cmp r1, r0
    movge r4, #0x1
.L_02027d70:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02027d78: .word data_020c37f4
    .size func_02027d14, . - func_02027d14

