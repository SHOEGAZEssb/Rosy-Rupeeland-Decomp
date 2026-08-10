; Matching retail form; see src/game/actor_step_transition_detect.c.
.text
.extern func_02033ed0
.extern func_020343e4
.extern Actor_QueryTerrainCell
.extern func_020adae4

    .global func_02031f44
    .type func_02031f44, @function
func_02031f44: ; 0x02031f44
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r5, [r4, #0x1dc]
    ldr r1, [r4, #0x24]
    cmp r1, r5
    bne .L_020320f0
    ldrb r2, [r4, #0x4a]
    ldrb r1, [r4, #0x4b]
    orr r1, r2, r1
    tst r1, #0xf
    beq .L_020320f0
    ldr r3, [r4, #0x1c]
    ldr r1, [r4, #0x3c]
    mov r2, #0x14
    mla r6, r1, r2, r3
    ldr r7, [r4, #0x20]
    ldr r3, [r4, #0x40]
    mov r8, r6, asr #0x10
    mla r7, r3, r2, r7
    mov r9, r7, asr #0x10
    mov r1, r8
    mov r2, r9
    bl Actor_QueryTerrainCell
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    cmp r1, #0x7
    moveq r10, #0x1
    movne r10, #0x0
    cmp r1, #0x6
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmpne r1, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    mov r2, #0x1
    cmp r0, #0x0
    bne .L_02032004
    sub r1, r1, #0x11
    cmp r1, #0x3
    mov r3, #0x0
    bhi .L_02031ffc
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0xb
    movne r3, r0
.L_02031ffc:
    cmp r3, #0x0
    moveq r2, #0x0
.L_02032004:
    cmp r10, #0x0
    cmpeq r2, #0x0
    movne r0, #0x0
    bne .L_020320f4
    mov r0, r4
    mov r1, r8
    mov r2, r9
    bl func_020343e4
    ldr r1, [r4, #0x14]
    mov r8, r0, lsl #0x4
    tst r1, #0x400000
    movne r10, #0x20
    sub r9, r8, r5, asr #0xc
    moveq r10, #0x10
    cmp r9, #0x0
    ble .L_020320f0
    cmp r9, r10
    bgt .L_020320f0
    ldr r3, [r4, #0x1c]
    ldr r2, [r4, #0x3c]
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x40]
    add r3, r3, r2, lsl #0x3
    add r2, r1, r0, lsl #0x3
    mov r0, r4
    mov r1, r3, asr #0x10
    mov r2, r2, asr #0x10
    bl func_020343e4
    mov r0, r0, lsl #0x4
    sub r0, r0, r5, asr #0xc
    cmp r0, r10
    bgt .L_020320f0
    str r6, [r4, #0xb4]
    mov r0, r4
    str r7, [r4, #0xb8]
    mov r1, r8, lsl #0xc
    str r1, [r4, #0xbc]
    bl func_02033ed0
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r9
    ldr r2, [r2, #0x3c]
    blx r2
    ldr r1, [r4, #0x3c]
    mov r0, #0x14
    mul r0, r1, r0
    mov r1, #0x18
    bl func_020adae4
    str r0, [r4, #0xc0]
    ldr r1, [r4, #0x40]
    mov r0, #0x14
    mul r0, r1, r0
    mov r1, #0x18
    bl func_020adae4
    str r0, [r4, #0xc4]
    mov r0, #0x0
    str r0, [r4, #0x44]
    mov r0, #0x1
    b .L_020320f4
.L_020320f0:
    mov r0, #0x0
.L_020320f4:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    .size func_02031f44, . - func_02031f44
