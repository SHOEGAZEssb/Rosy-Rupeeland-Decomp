    .text
    .extern data_ov014_021fd948
    .extern func_02092260
    .extern func_02092288
    .extern func_020946a8
    .extern func_02094738
    .extern func_ov000_021fc164
    .extern func_ov000_021fc450
    .extern func_ov000_021fc460
    .extern func_ov000_021fc560
    .extern func_ov014_021fce14
    .extern func_ov014_021fd2f8

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov014/overlay014_state_machines.c. */
    .global func_ov014_021fd67c

func_ov014_021fd67c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x78]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x26c]
    cmp r0, #0x0
    beq L_021fd6ac
    cmp r0, #0x1
    beq L_021fd6cc
    cmp r0, #0x2
    beq L_021fd734
    b L_021fd798
L_021fd6ac:
    mov r0, r4
    mov r1, #0x4
    bl func_020946a8
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021fd6cc:
    ldr r0, [r5, #0x78]
    bl func_ov000_021fc450
    cmp r0, #0x0
    beq L_021fd728
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_021fd710
    mov r0, r5
    mov r1, #0x0
    bl func_ov014_021fd2f8
    mov r0, r5
    mov r1, #0x8
    bl func_02092288
L_021fd710:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fd734
L_021fd728:
    ldr r0, [r5, #0x78]
    bl func_ov000_021fc460 ; func_ov001_021fc460
    b L_021fd798
L_021fd734:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fd77c
    ldr r0, [r5, #0x78]
    add r1, r5, #0x30
    bl func_ov000_021fc560
    cmp r0, #0x0
    beq L_021fd798
    mov r0, r5
    mov r1, #0x8
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fd798
L_021fd77c:
    mov r0, r4
    mov r1, #0x6
    bl func_02094738
    ldr r1, L_021fd7b0
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov014_021fce14
L_021fd798:
    ldr r0, [r5, #0x78]
    cmp r0, #0x0
    beq L_021fd7a8
    bl func_ov000_021fc164
L_021fd7a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fd7b0: .word data_ov014_021fd948
    .size func_ov014_021fd67c, . - func_ov014_021fd67c
