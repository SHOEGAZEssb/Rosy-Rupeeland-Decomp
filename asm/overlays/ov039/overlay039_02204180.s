.text
/* Exact fallback; see overlay039_secondary_effects.c for portable C. */
    .extern gFx32CosSinTable
    .global func_ov039_02204180
func_ov039_02204180:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r1, #0x8
    mov r8, #0x16
    sub lr, r1, #0x1
    ldr r3, L_02204268
    mov r1, #0x0
    mov r4, #0x50
    mov r5, #0x3c
    mov r6, #0xc
    mov r9, r8
L_022041a8:
    add r2, r0, lr, lsl #0x2
    ldr r7, [r2, #0x28]
    cmp r7, #0x0
    beq L_0220425c
    mul r10, lr, r4
    mul r7, lr, r5
    ldr ip, [r2, #0x48]
    add r10, r10, #0xc8
    add r10, ip, r10
    str r10, [r2, #0x48]
    ldr r10, [r2, #0x68]
    add r7, r7, #0x12c
    add r7, r10, r7
    str r7, [r2, #0x68]
    ldr r7, [r2, #0x48]
    mla ip, lr, r6, r0
    mov r7, r7, lsl #0x10
    mov r7, r7, lsr #0x10
    mov r7, r7, asr #0x4
    mov r7, r7, lsl #0x2
    ldrsh r7, [r3, r7]
    ldr r10, [r0, #0x10]
    smlabb r7, r7, r8, r10
    str r7, [ip, #0x8c]
    ldr r7, [r2, #0x68]
    ldr r2, [r0, #0x14]
    mov r7, r7, lsl #0x10
    mov r7, r7, lsr #0x10
    mov r7, r7, asr #0x4
    add r7, r3, r7, lsl #0x2
    ldrsh r7, [r7, #0x2]
    smlabb r2, r7, r9, r2
    str r2, [ip, #0x90]
    ldr r2, [ip, #0x8c]
    cmp r2, #0x2bc000
    bgt L_02204254
    cmp r2, #0x144000
    blt L_02204254
    ldr r2, [ip, #0x90]
    cmp r2, #0x280000
    bgt L_02204254
    cmp r2, #0x6e000
    bge L_0220425c
L_02204254:
    add r2, r0, lr, lsl #0x2
    str r1, [r2, #0x28]
L_0220425c:
    subs lr, lr, #0x1
    bpl L_022041a8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_02204268: .word gFx32CosSinTable
    .size func_ov039_02204180, .-func_ov039_02204180

