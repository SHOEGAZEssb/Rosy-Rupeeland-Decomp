.text

/* Exact fallback; see src/overlays/ov030/overlay030_board_interaction.c for documented portable C. */
.extern data_ov030_021ff708
.extern data_ov030_021ff7cc
.extern data_ov030_021ff820
.extern func_02073aa8
.extern func_ov030_021fd680


    .global func_ov030_021fd520
func_ov030_021fd520:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r5, #0x0
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r7, r5
L_021fd538:
    ldr r0, [r10, #0x1b0]
    add r0, r0, r7, lsl #0x2
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne L_021fd660
    ldr r1, L_021fd674
    mov r2, r7, lsl #0x3
    ldrsh r0, [r1, r2]
    sub r0, r0, #0x1
    cmp r9, r0
    blt L_021fd660
    add r1, r1, r2
    ldrsh r0, [r1, #0x4]
    add r0, r0, #0x1
    cmp r9, r0
    bgt L_021fd660
    ldrsh r0, [r1, #0x2]
    sub r0, r0, #0x1
    cmp r8, r0
    blt L_021fd660
    ldrsh r0, [r1, #0x6]
    add r0, r0, #0x1
    cmp r8, r0
    bgt L_021fd660
    mov r6, #0x0
    add r4, r10, r7, lsl #0x2
    ldr r11, L_021fd678
    b L_021fd658
L_021fd5a8:
    ldr r0, L_021fd67c
    ldr r1, [r11, r6, lsl #0x2]
    ldr r0, [r0, r6, lsl #0x2]
    ldr r2, [r10, #0x1c4]
    add r3, r8, r0
    ldr r0, [r4, #0x34]
    add r1, r9, r1
    sub r2, r3, r2
    bl func_02073aa8
    cmp r0, #0x0
    beq L_021fd654
    ldr r2, [r10, #0x1b0]
    ldr r0, [r2, #0x0]
    cmp r0, #0x3
    bge L_021fd618
    add r0, r2, r7, lsl #0x2
    ldrh r0, [r0, #0xa]
    cmp r0, #0x0
    beq L_021fd60c
    ldr r1, [r2, #0x4]
    add r0, r10, #0x1d0
    add r1, r1, #0x1
    str r1, [r2, #0x4]
    bl func_ov030_021fd680
    b L_021fd620
L_021fd60c:
    add r0, r10, #0x1d8
    bl func_ov030_021fd680
    b L_021fd620
L_021fd618:
    add r0, r10, #0x1e0
    bl func_ov030_021fd680
L_021fd620:
    ldr r0, [r10, #0x1b0]
    mov r2, #0x1
    add r0, r0, r7, lsl #0x2
    strh r2, [r0, #0x8]
    ldr r1, [r10, #0x1b0]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x1
    str r0, [r1, #0x0]
    ldr r0, [r10, #0x1b0]
    ldr r0, [r0, #0x0]
    cmp r0, #0x3
    moveq r5, r2
    b L_021fd660
L_021fd654:
    add r6, r6, #0x1
L_021fd658:
    cmp r6, #0x15
    blt L_021fd5a8
L_021fd660:
    add r7, r7, #0x1
    cmp r7, #0x7
    blt L_021fd538
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd674: .word data_ov030_021ff708
L_021fd678: .word data_ov030_021ff7cc
L_021fd67c: .word data_ov030_021ff820
.size func_ov030_021fd520, .-func_ov030_021fd520
