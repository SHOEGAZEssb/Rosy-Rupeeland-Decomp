.text

/* Exact fallback for func_ov041_022015b0; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_proximity.c. */
.extern gFx32CosSinTable
.extern func_020adc40

    .global func_ov041_022015b0
func_ov041_022015b0: ; 0x022015b0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r0, [r10, #0x920]
    mov r9, r1
    cmp r0, #0x0
    cmpne r0, #0x3
    mov r8, r2
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r0, #0x4
    cmpne r0, #0x6
    cmpne r0, #0xb
    beq .L_022015f0
    sub r0, r0, #0x8
    cmp r0, #0x1
    bhi .L_022015f8
.L_022015f0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022015f8:
    ldr r0, [r10, #0x624]
    cmp r0, #0x0
    bne .L_022016b8
    ldr r0, [r10, #0x4b8]
    ldr r3, .L_02201780
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r2, r0, lsl #0x1
    add r0, r0, #0x1
    mov r1, r0, lsl #0x1
    ldrsh r2, [r3, r2]
    ldr r4, [r10, #0x6c]
    mov r0, #0x30
    smlabb r4, r2, r0, r4
    ldrsh r1, [r3, r1]
    ldr r2, [r10, #0x70]
    subs r3, r4, r9
    smlabb r0, r1, r0, r2
    sub r4, r0, r8
    rsbmi r0, r3, #0x0
    movpl r0, r3
    cmp r0, #0x20000
    bgt .L_022016b8
    cmp r4, #0x0
    rsblt r0, r4, #0x0
    movge r0, r4
    cmp r0, #0x20000
    bgt .L_022016b8
    smull r0, r2, r3, r3
    adds r3, r0, #0x800
    smull r1, r0, r4, r4
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    cmp r0, #0x20000
    bge .L_022016b8
    ldr r0, [r10, #0x920]
    cmp r0, #0xc
    moveq r0, #0x1
    streq r0, [r10, #0x950]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022016b8:
    mov r7, #0x0
    mov r6, #0xc
    mov r11, r7
    mov r5, r7
    mov r4, #0x800
    b .L_02201770
.L_022016d0:
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x624]
    cmp r0, #0x4b0
    bgt .L_0220176c
    mla r0, r7, r6, r10
    ldr r1, [r0, #0x6c]
    ldr r0, [r0, #0x70]
    subs r2, r1, r9
    sub ip, r0, r8
    rsbmi r0, r2, #0x0
    movpl r0, r2
    cmp r0, #0x24000
    bgt .L_0220176c
    cmp ip, #0x0
    rsblt r0, ip, #0x0
    movge r0, ip
    cmp r0, #0x24000
    bgt .L_0220176c
    smull r1, r3, r2, r2
    mov r0, #0x800
    adds r0, r1, r0
    smull r2, r1, ip, ip
    adc r3, r3, r11
    adds r2, r2, r4
    mov r0, r0, lsr #0xc
    adc r1, r1, r5
    mov r2, r2, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    cmp r0, #0x24000
    bge .L_0220176c
    ldr r0, [r10, #0x920]
    cmp r0, #0xc
    moveq r0, #0x1
    streq r0, [r10, #0x950]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220176c:
    add r7, r7, #0xd
.L_02201770:
    cmp r7, #0x5b
    blt .L_022016d0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02201780: .word gFx32CosSinTable
    .size func_ov041_022015b0, . - func_ov041_022015b0

