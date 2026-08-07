    .text
/* Exact fallback; see src/overlays/ov017/overlay017_status_text.c. */
    .extern data_021f3ecc
    .extern data_ov017_022016e0
    .extern func_020628c8
    .extern func_02075598
    .extern func_020755bc
    .extern func_02076004
    .extern func_02076148
    .extern func_020761f8
    .extern func_020791e0
    .extern gDebugFont
.global func_ov017_021ffdb4
func_ov017_021ffdb4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x2c
    ldr r3, L_02200050
    mov r6, r0
    ldr r0, [r3, #0x0]
    mov r5, r1
    mov r4, r2
    bl func_020755bc
    ldr r0, L_02200050
    ldr r1, [r6, #0x1d8]
    ldr r0, [r0, #0x0]
    bl func_02075598
    ldr r0, [r6, #0x3bc]
    cmp r0, #0x0
    beq L_021ffe30
    ldr r0, L_02200054
    mov r1, #0x2d4
    bl func_020791e0
    mov r1, #0xe
    str r1, [sp, #0x0]
    mov r1, #0x4
    str r1, [sp, #0x4]
    mov r1, #0x0
    ldr r2, L_02200050
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, #0x90
    mov r3, #0x41
    bl func_02076148
    b L_021ffe6c
L_021ffe30:
    ldr r0, L_02200054
    ldr r1, L_02200058
    bl func_020791e0
    mov r1, #0xe
    str r1, [sp, #0x0]
    mov r1, #0x4
    str r1, [sp, #0x4]
    mov r1, #0x0
    ldr r2, L_02200050
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, #0x90
    mov r3, #0x41
    bl func_02076148
L_021ffe6c:
    ldr r0, L_0220005c
    ldr r0, [r0, #0x80]
    cmp r0, #0x0
    bne L_021ffebc
    ldr r0, L_02200054
    mov r1, #0x2d4
    bl func_020791e0
    mov r1, #0xe
    str r1, [sp, #0x0]
    mov r1, #0x4
    str r1, [sp, #0x4]
    mov r1, #0x0
    ldr r2, L_02200050
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, #0x90
    mov r3, #0x51
    bl func_02076148
    b L_021ffef8
L_021ffebc:
    ldr r0, L_02200054
    ldr r1, L_02200058
    bl func_020791e0
    mov r1, #0xe
    str r1, [sp, #0x0]
    mov r1, #0x4
    str r1, [sp, #0x4]
    mov r1, #0x0
    ldr r2, L_02200050
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, #0x90
    mov r3, #0x51
    bl func_02076148
L_021ffef8:
    mov r2, #0x3e8
    add r0, sp, #0xc
    mov r1, r4
    rsb r2, r2, #0x0
    mov r3, #0x0
    bl func_02076004
    mov r0, r5
    bl func_020628c8
    ldr r3, L_02200050
    mov r1, r0
    mov r2, #0x6
    ldr r0, [r3, #0x0]
    sub r3, r2, #0x7
    bl func_020761f8
    add r4, r0, #0x2
    ldr r0, L_02200054
    ldr r1, L_02200060
    bl func_020791e0
    mov r1, r0
    ldr r0, L_02200050
    mov r2, #0x6
    ldr r0, [r0, #0x0]
    mov r3, #0x0
    bl func_020761f8
    add r0, r0, #0x2
    add r4, r4, r0
    ldr r0, L_02200050
    add r1, sp, #0xc
    ldr r0, [r0, #0x0]
    mov r2, #0x6
    mov r3, #0x0
    bl func_020761f8
    add r0, r4, r0
    cmp r0, #0x70
    addgt r0, r0, r0, lsr #0x1f
    movgt r0, r0, asr #0x1
    mov r4, #0x48
    rsbgt r0, r0, #0x38
    addgt r4, r4, r0
    mov r0, r5
    bl func_020628c8
    mov r2, #0xe
    str r2, [sp, #0x0]
    mov r1, #0x6
    str r1, [sp, #0x4]
    sub r1, r1, #0x7
    str r1, [sp, #0x8]
    ldr r2, L_02200050
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, r4
    mov r3, #0x68
    bl func_02076148
    add r2, r4, r0
    ldr r0, L_02200054
    ldr r1, L_02200060
    add r4, r2, #0x2
    bl func_020791e0
    mov r1, r0
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, L_02200050
    add r2, r4, #0x2
    ldr r0, [r0, #0x0]
    mov r3, #0x68
    bl func_02076148
    add r0, r0, #0x2
    add r0, r4, r0
    add r2, r0, #0x2
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, L_02200050
    add r1, sp, #0xc
    ldr r0, [r0, #0x0]
    mov r3, #0x68
    bl func_02076148
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
L_02200050: .word gDebugFont
L_02200054: .word data_021f3ecc
L_02200058: .word 0x2d5
L_0220005c: .word data_ov017_022016e0
L_02200060: .word 0x2d6

    .size func_ov017_021ffdb4, . - func_ov017_021ffdb4
