.text
/* Exact fallback; see overlay039_secondary_effects.c for portable C. */
    .extern func_0209a2ac
    .extern func_0200500c
    .extern func_ov039_022014f8
    .extern func_020befec
    .extern func_0201e0ec
    .extern func_0209c3b4
    .extern func_0209c430
    .extern func_02005058
    .extern func_ov039_02203794
    .extern func_ov039_02203064
    .extern func_ov039_0220454c
    .extern func_ov039_02205654
    .extern func_ov049_0220c8a0
    .extern func_ov039_022014e0
    .extern func_ov045_0220c48c
    .extern func_02004fe0
    .extern func_02005030
    .extern func_ov039_022035d4
    .extern func_ov049_0220c254
    .extern func_ov049_0220cf94
    .extern func_ov069_0221100c
    .extern func_ov069_02211274
    .extern data_ov039_022080ac
    .extern data_021052fc
    .global func_ov039_022039b8
func_ov039_022039b8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10c
    mov r4, r0
    ldr r2, [r4, #0xa8]
    mov r5, r1
    add r1, r2, #0x1
    str r1, [r4, #0xa8]
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r4, #0x4c]
    mov r1, r5
    mov r2, #0x1
    bl func_0209a2ac
    mov r0, #0x8
    sub r7, r0, #0x1
    mov r6, #0x1
L_022039fc:
    add r0, r4, r7, lsl #0x2
    ldr r0, [r0, #0x50]
    mov r1, r5
    mov r2, r6
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl L_022039fc
    ldrh r0, [r4, #0x42]
    tst r0, #0x4
    bne L_02203da8
    mov r8, #0x0
    mov r6, #0x40000
    add r7, sp, #0x84
    mvn ip, #0x1f
    add r5, sp, #0x8c
    str r8, [sp, #0x7c]
    str r8, [sp, #0x80]
    str r6, [r7, #0x0]
    str r6, [r7, #0x4]
    stmia r5, {r6, r8}
    add r3, sp, #0x9c
    add r1, sp, #0xac
    add r2, sp, #0xa4
    add lr, sp, #0x94
    str ip, [sp, #0x6c]
    str ip, [sp, #0x70]
    mov ip, #0x80000
    add r0, sp, #0xb4
    str ip, [lr, #0x0]
    str r6, [lr, #0x4]
    str r8, [r3, #0x0]
    str r8, [r3, #0x4]
    str r6, [r2, #0x0]
    str r6, [r2, #0x4]
    str r8, [r1, #0x0]
    str r6, [r1, #0x4]
    stmia r0, {r6, ip}
    add r11, sp, #0xbc
    add r10, sp, #0x74
    mov r9, #0x20
    str r9, [r10, #0x0]
    str r9, [r10, #0x4]
    add r9, sp, #0xc4
    add r10, sp, #0xcc
    add r5, sp, #0xd4
    mov r3, #0xc0000
    str r6, [r11, #0x0]
    str r6, [r11, #0x4]
    str ip, [r9, #0x0]
    str ip, [r9, #0x4]
    str ip, [r10, #0x0]
    str r8, [r10, #0x4]
    stmia r5, {r3, r6}
    add r7, sp, #0xdc
    stmia r7, {r3, r8}
    add r2, sp, #0xe4
    mov r0, #0x100000
    stmia r2, {r0, r6}
    add r1, sp, #0xf4
    add r2, sp, #0xec
    str ip, [r2, #0x0]
    str r6, [r2, #0x4]
    ldr r2, L_02203ee4
    str r3, [r1, #0x0]
    str ip, [r1, #0x4]
    add r9, sp, #0xfc
    ldrh r8, [r2, #0x14]
    ldrh r7, [r2, #0x16]
    stmia r9, {r3, r6}
    add r5, sp, #0x104
    stmia r5, {r0, ip}
    ldrh r5, [r2, #0x18]
    mov r1, #0x1000
    add r0, sp, #0x5c
    mov r2, r1
    mov r3, r1
    strh r8, [sp, #0x14]
    strh r7, [sp, #0x16]
    strh r5, [sp, #0x18]
    bl func_0200500c
    add r0, sp, #0x4c
    add r1, r4, #0x2c
    add r2, r4, #0xac
    bl func_ov039_022014f8
    ldr r0, [r4, #0xa8]
    mov r1, #0x6
    bl func_020befec
    add r2, r4, #0x1000
    add r1, r4, #0x1c00
    and r6, r0, #0x3
    ldrsh r0, [r1, #0xa4]
    mov r1, #0x15
    ldr r7, [r2, #0xccc]
    bl func_020befec
    add r1, r4, #0x1c00
    ldrh r2, [r1, #0xaa]
    add r3, sp, #0x14
    mov r0, r0, lsl #0x1
    ldrh r8, [r3, r0]
    cmp r2, #0x0
    beq L_02203bd0
    add r1, r4, #0x1000
    ldr r2, [r1, #0xcac]
    mov r6, #0x4
    cmp r2, #0x0
    beq L_02203c84
    ldr r0, L_02203ee8
    sub r0, r0, r2
    add r0, r0, r0, lsr #0x1f
    add r0, r2, r0, asr #0x1
    str r0, [r1, #0xcac]
    add r0, r0, #0x1000
    str r0, [sp, #0x60]
    ldr r0, [r1, #0xcac]
    rsb r0, r0, #0x1000
    str r0, [sp, #0x64]
    b L_02203c84
L_02203bd0:
    ldrh r0, [r1, #0xa6]
    cmp r0, #0x0
    beq L_02203bf8
    and r1, r0, #0x1
    mov r0, #0xfa0
    smulbb r0, r1, r0
    sub r0, r0, #0x7d0
    add r7, r7, r0
    mov r6, #0x4
    b L_02203c84
L_02203bf8:
    add r0, r4, #0x1000
    ldr r1, [r0, #0xcd8]
    cmp r1, #0x1
    ldrne r0, [r0, #0xcc4]
    cmpne r0, #0x3
    bne L_02203c58
    add r0, r4, #0x1000
    ldr r5, [r0, #0xcc0]
    mov r1, #0x7
    mov r0, r5
    bl func_020befec
    add r1, r4, #0x1c00
    ldrh r1, [r1, #0xb0]
    and r0, r0, #0x1
    add r6, r0, #0x5
    cmp r1, #0x0
    beq L_02203c84
    mov r0, #0x14
    mul r0, r5, r0
    add r0, r0, #0x1000
    str r0, [sp, #0x68]
    str r0, [sp, #0x64]
    str r0, [sp, #0x60]
    b L_02203c84
L_02203c58:
    cmp r1, #0x2
    cmpne r1, #0x3
    cmpne r1, #0x4
    cmpne r0, #0x4
    bne L_02203c84
    add r0, r4, #0x1000
    ldr r0, [r0, #0xcc0]
    mov r1, #0x3
    bl func_020befec
    and r0, r0, #0x1
    add r6, r0, #0x7
L_02203c84:
    add r0, r4, #0x1000
    ldr r3, [r0, #0xcc4]
    sub r1, r3, #0x3
    cmp r1, #0x1
    bhi L_02203d1c
    ldr r0, [r0, #0xcc0]
    and r1, r8, #0x7c00
    cmp r3, #0x4
    and r2, r8, #0x3e0
    and r5, r8, #0x1f
    mov r8, r2, asr #0x5
    mov r9, r1, asr #0xa
    rsbeq r10, r0, #0x1e
    beq L_02203cd0
    add r0, r0, r0, lsl #0x1
    add r0, r0, r0, lsr #0x1f
    mov r10, r0, asr #0x1
    cmp r10, #0x6e
    movgt r10, #0x6e
L_02203cd0:
    rsb r1, r5, #0x1f
    mul r0, r1, r10
    mov r1, #0x6e
    bl func_020befec
    rsb r1, r8, #0xc
    add r5, r5, r0
    mul r0, r1, r10
    mov r1, #0x6e
    bl func_020befec
    rsb r1, r9, #0xc
    add r8, r8, r0
    mul r0, r1, r10
    mov r1, #0x6e
    bl func_020befec
    add r1, r9, r0
    orr r0, r5, r8, lsl #0x5
    orr r0, r0, r1, lsl #0xa
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
L_02203d1c:
    add r0, r4, #0x1c00
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x0
    ldr r0, L_02203eec
    movne r9, #0x190
    ldr r0, [r0, #0x0]
    moveq r9, #0x0
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r5, r0
    bl func_0209c3b4
    add r1, sp, #0x6c
    mov r0, r9, lsl #0x10
    str r1, [sp, #0x0]
    add r1, sp, #0x7c
    mov r2, #0x1c
    mov r0, r0, lsr #0x10
    str r2, [sp, #0x4]
    add r1, r1, r6, lsl #0x4
    str r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r3, r7, lsl #0x10
    mov r6, r0, asr #0x10
    str r8, [sp, #0xc]
    add r1, sp, #0x4c
    add r2, sp, #0x5c
    mov r0, r5
    mov r3, r3, lsr #0x10
    str r6, [sp, #0x10]
    bl func_0209c430
    add r0, sp, #0x4c
    bl func_02005058
    add r0, sp, #0x5c
    bl func_02005058
L_02203da8:
    mov r0, r4
    bl func_ov039_02203794
    mov r0, r4
    bl func_ov039_02203064
    mov r0, r4
    bl func_ov039_0220454c
    ldrh r0, [r4, #0x42]
    tst r0, #0x4
    addeq r0, r4, #0x1000
    ldreq r0, [r0, #0xcac]
    cmpeq r0, #0x0
    bne L_02203de8
    add r0, r4, #0x1c00
    ldrsh r1, [r0, #0xa4]
    add r0, r4, #0xbc
    bl func_ov039_02205654
L_02203de8:
    ldr r1, [r4, #0x48]
    add r0, r4, #0x64
    ldr r1, [r1, #0x8]
    add r0, r0, #0x400
    ldr r1, [r1, #0x48]
    add r1, r1, #0x2c
    bl func_ov049_0220c8a0
    ldr r1, [r4, #0x48]
    add r0, sp, #0x1c
    ldr r1, [r1, #0x18]
    bl func_ov039_022014e0
    add r0, r4, #0x64
    add r1, sp, #0x1c
    add r0, r0, #0x400
    mov r2, #0x69000
    mov r3, #0x50000
    bl func_ov045_0220c48c ; func_ov049_0220c48c
    add r0, sp, #0x1c
    bl func_02005058
    add r0, sp, #0x3c
    bl func_02004fe0
    add r6, r4, #0x64
    add r5, sp, #0x2c
    add r7, sp, #0x3c
    b L_02203e94
L_02203e4c:
    ldr r1, [r4, #0x48]
    mov r0, r5
    ldr r1, [r1, #0x8]
    ldr r1, [r1, #0x48]
    add r1, r1, #0x2c
    bl func_02005030
    ldr r1, [sp, #0x44]
    mov r0, r4
    str r1, [sp, #0x0]
    ldr r3, [sp, #0x34]
    ldr r2, [sp, #0x38]
    ldr r1, [sp, #0x30]
    sub r2, r3, r2
    ldr r3, [sp, #0x40]
    sub r2, r2, #0x10000
    bl func_ov039_022035d4
    mov r0, r5
    bl func_02005058
L_02203e94:
    mov r1, r7
    add r0, r6, #0x400
    bl func_ov049_0220c254
    cmp r0, #0x0
    bne L_02203e4c
    add r0, r4, #0x64
    add r0, r0, #0x400
    bl func_ov049_0220cf94
    add r0, sp, #0x3c
    bl func_02005058
    add r1, r4, #0x1c00
    add r0, r4, #0x30c
    ldrh r1, [r1, #0xb0]
    add r0, r0, #0x800
    bl func_ov069_0221100c
    add r0, r4, #0x30c
    add r0, r0, #0x800
    bl func_ov069_02211274
    add sp, sp, #0x10c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02203ee4: .word data_ov039_022080ac
L_02203ee8: .word 0x4cd
L_02203eec: .word data_021052fc
    .size func_ov039_022039b8, .-func_ov039_022039b8

