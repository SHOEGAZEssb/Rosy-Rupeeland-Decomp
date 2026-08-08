.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */
    .extern func_ov039_022014f8
    .extern func_020ae024
    .extern func_02005058
    .global func_ov039_02203480
func_ov039_02203480:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    cmp r1, #0x0
    beq L_022035c8
    cmp r1, #0x1
    bne L_02203538
    add r0, sp, #0x0
    add r1, r4, #0x2c
    add r2, r4, #0xac
    bl func_ov039_022014f8
    ldr r1, [r4, #0x48]
    ldr r0, [sp, #0x4]
    ldr r2, [r1, #0x8]
    ldr r1, [sp, #0x8]
    ldr r2, [r2, #0x48]
    ldr r3, [r2, #0x30]
    ldr r2, [r2, #0x34]
    sub r0, r3, r0
    rsb r0, r0, #0x0
    sub r1, r2, r1
    bl func_020ae024
    add r1, r4, #0x1000
    ldr r2, [r1, #0xccc]
    ldr r1, L_022035d0
    sub r2, r0, r2
    mov r0, #0x8000
    cmp r2, r1
    subgt r2, r2, #0x10000
    rsb r0, r0, #0x0
    cmp r2, r0
    addlt r2, r2, #0x10000
    cmp r2, #0x258
    addgt r0, r4, #0x1000
    ldrgt r1, [r0, #0xcd0]
    addgt r1, r1, #0x1e
    strgt r1, [r0, #0xcd0]
    mov r0, #0x258
    rsb r0, r0, #0x0
    cmp r2, r0
    addlt r0, r4, #0x1000
    ldrlt r1, [r0, #0xcd0]
    sublt r1, r1, #0x1e
    strlt r1, [r0, #0xcd0]
    add r0, sp, #0x0
    bl func_02005058
L_02203538:
    add r0, r4, #0x1000
    ldr r1, [r0, #0xcd0]
    cmp r1, #0x0
    addlt r1, r1, #0xf
    strlt r1, [r0, #0xcd0]
    add r0, r4, #0x1000
    ldr r1, [r0, #0xcd0]
    cmp r1, #0x0
    subgt r1, r1, #0xf
    strgt r1, [r0, #0xcd0]
    add r1, r4, #0x1000
    ldr r2, [r1, #0xcd0]
    cmp r2, #0xf
    bge L_02203580
    mvn r0, #0xe
    cmp r2, r0
    movgt r0, #0x0
    strgt r0, [r1, #0xcd0]
L_02203580:
    add r0, r4, #0x1000
    ldr r1, [r0, #0xcd0]
    cmp r1, #0x190
    movgt r1, #0x190
    strgt r1, [r0, #0xcd0]
    add r0, r4, #0x1000
    mov r1, #0x190
    ldr r2, [r0, #0xcd0]
    rsb r1, r1, #0x0
    cmp r2, r1
    strlt r1, [r0, #0xcd0]
    add r1, r4, #0x1000
    ldr r2, [r1, #0xccc]
    ldr r0, [r1, #0xcd0]
    add r2, r2, r0
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0xccc]
L_022035c8:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_022035d0: .word 0x7fff
    .size func_ov039_02203480, .-func_ov039_02203480

