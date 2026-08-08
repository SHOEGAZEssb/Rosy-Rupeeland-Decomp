.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */
    .extern func_ov039_02203770
    .global func_ov039_022036f0
func_ov039_022036f0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r1, #0xa
    mov r5, r0
    sub r4, r1, #0x1
    mov r6, #0x4
L_02203704:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x74]
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    bne L_02203764
    add r1, r0, #0xc
    bl func_ov039_02203770
    add r2, r5, r4, lsl #0x2
    ldr r1, [r2, #0x74]
    ldr r0, [r1, #0x1c]
    add r0, r0, #0x1
    str r0, [r1, #0x1c]
    ldr r1, [r2, #0x74]
    ldr r0, [r1, #0x4]
    cmp r0, #0x2bc000
    bgt L_02203760
    cmp r0, #0x144000
    blt L_02203760
    ldr r0, [r1, #0x8]
    cmp r0, #0x280000
    bgt L_02203760
    cmp r0, #0x6e000
    bge L_02203764
L_02203760:
    str r6, [r1, #0x18]
L_02203764:
    subs r4, r4, #0x1
    bpl L_02203704
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov039_022036f0, .-func_ov039_022036f0

