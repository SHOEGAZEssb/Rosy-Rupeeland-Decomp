.text

/* Exact fallback; see src/overlays/ov030/overlay030_line_trace.c for documented portable C. */
.extern data_ov030_021ff7cc
.extern data_ov030_021ff820
.extern GraphicsSpriteCanvas_FillRect
.extern func_ov030_021fd520
.extern func_ov030_021fd680
.extern func_ov030_021fd694
.extern func_ov030_021fd6ac


    .global func_ov030_021fd720
func_ov030_021fd720:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r0
    str r1, [sp, #0x8]
    mov r0, r1
    ldr r1, [r0, #0x8]
    ldr r0, [sp, #0x8]
    mov r6, #0x1
    ldr r4, [r10, #0x1c4]
    ldr r3, [r10, #0x1c0]
    ldr r2, [r0, #0x4]
    ldr r7, [r10, #0x1bc]
    add r8, r3, r4
    add r0, r1, r4
    subs r4, r2, r7
    str r6, [sp, #0x1c]
    sub r5, r0, r8
    rsbmi r4, r4, #0x0
    submi r6, r6, #0x2
    cmp r5, #0x0
    mvnlt r0, #0x0
    rsblt r5, r5, #0x0
    strlt r0, [sp, #0x1c]
    cmp r4, r5
    ble L_021fd8b4
    rsb r0, r4, #0x0
    str r0, [sp, #0x18]
    mov r0, #0x0
    str r0, [sp, #0x14]
    b L_021fd8a4
L_021fd798:
    mov r11, #0x0
    mov r9, r11
    b L_021fd7cc
L_021fd7a4:
    ldr r1, L_021fd9f4
    mov r0, r10
    ldr r3, [r1, r9, lsl #0x2]
    ldr r1, L_021fd9f8
    ldr r2, [r1, r9, lsl #0x2]
    add r1, r7, r3
    add r2, r8, r2
    bl func_ov030_021fd6ac
    add r11, r11, r0
    add r9, r9, #0x1
L_021fd7cc:
    cmp r9, #0x15
    bge L_021fd7dc
    cmp r11, #0x0
    beq L_021fd7a4
L_021fd7dc:
    cmp r11, #0x0
    beq L_021fd7ec
    add r0, r10, #0x1e8
    bl func_ov030_021fd680
L_021fd7ec:
    sub r2, r8, #0x2
    str r2, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x0]
    sub r1, r7, #0x1
    add r3, r7, #0x1
    bl GraphicsSpriteCanvas_FillRect
    add r0, r8, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x0]
    sub r1, r7, #0x2
    sub r2, r8, #0x1
    add r3, r7, #0x2
    bl GraphicsSpriteCanvas_FillRect
    add r2, r8, #0x2
    str r2, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x0]
    sub r1, r7, #0x1
    add r3, r7, #0x1
    bl GraphicsSpriteCanvas_FillRect
    mov r0, r10
    mov r1, r7
    mov r2, r8
    bl func_ov030_021fd520
    cmp r0, #0x0
    strne r7, [r10, #0x1bc]
    ldrne r0, [r10, #0x1c4]
    subne r0, r8, r0
    strne r0, [r10, #0x1c0]
    bne L_021fd9ec
    ldr r0, [sp, #0x18]
    add r7, r7, r6
    adds r0, r0, r5, lsl #0x1
    str r0, [sp, #0x18]
    subpl r0, r0, r4, lsl #0x1
    strpl r0, [sp, #0x18]
    ldrpl r0, [sp, #0x1c]
    addpl r8, r8, r0
    ldr r0, [sp, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
L_021fd8a4:
    ldr r0, [sp, #0x14]
    cmp r0, r4
    ble L_021fd798
    b L_021fd9e0
L_021fd8b4:
    rsb r0, r5, #0x0
    str r0, [sp, #0x10]
    mov r0, #0x0
    str r0, [sp, #0xc]
    b L_021fd9d4
L_021fd8c8:
    mov r11, #0x0
    mov r9, r11
    b L_021fd8fc
L_021fd8d4:
    ldr r1, L_021fd9f4
    mov r0, r10
    ldr r3, [r1, r9, lsl #0x2]
    ldr r1, L_021fd9f8
    ldr r2, [r1, r9, lsl #0x2]
    add r1, r7, r3
    add r2, r8, r2
    bl func_ov030_021fd6ac
    add r11, r11, r0
    add r9, r9, #0x1
L_021fd8fc:
    cmp r9, #0x15
    bge L_021fd90c
    cmp r11, #0x0
    beq L_021fd8d4
L_021fd90c:
    cmp r11, #0x0
    beq L_021fd91c
    add r0, r10, #0x1e8
    bl func_ov030_021fd680
L_021fd91c:
    sub r2, r8, #0x2
    str r2, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x0]
    sub r1, r7, #0x1
    add r3, r7, #0x1
    bl GraphicsSpriteCanvas_FillRect
    add r0, r8, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x0]
    sub r1, r7, #0x2
    sub r2, r8, #0x1
    add r3, r7, #0x2
    bl GraphicsSpriteCanvas_FillRect
    add r2, r8, #0x2
    str r2, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x0]
    sub r1, r7, #0x1
    add r3, r7, #0x1
    bl GraphicsSpriteCanvas_FillRect
    mov r0, r10
    mov r1, r7
    mov r2, r8
    bl func_ov030_021fd520
    cmp r0, #0x0
    strne r7, [r10, #0x1bc]
    ldrne r0, [r10, #0x1c4]
    subne r0, r8, r0
    strne r0, [r10, #0x1c0]
    bne L_021fd9ec
    ldr r0, [sp, #0x1c]
    add r8, r8, r0
    ldr r0, [sp, #0x10]
    adds r0, r0, r4, lsl #0x1
    str r0, [sp, #0x10]
    subpl r0, r0, r5, lsl #0x1
    strpl r0, [sp, #0x10]
    ldr r0, [sp, #0xc]
    addpl r7, r7, r6
    add r0, r0, #0x1
    str r0, [sp, #0xc]
L_021fd9d4:
    ldr r0, [sp, #0xc]
    cmp r0, r5
    ble L_021fd8c8
L_021fd9e0:
    ldr r1, [sp, #0x8]
    add r0, r10, #0x1b8
    bl func_ov030_021fd694
L_021fd9ec:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd9f4: .word data_ov030_021ff7cc
L_021fd9f8: .word data_ov030_021ff820
.size func_ov030_021fd720, .-func_ov030_021fd720
