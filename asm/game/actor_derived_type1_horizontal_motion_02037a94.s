; Matching retail form; see src/game/actor_derived_type1_horizontal_motion.c.
.text
.extern gSystemState

    .global func_02037a94
    .type func_02037a94, @function
func_02037a94: ; 0x02037a94
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r2, #0x0
    str r2, [r0, #0x90]
    str r2, [r0, #0x40]
    ldr r1, [r0, #0x230]
    tst r1, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, .L_02037ba4
    ldrh r1, [r1, #0x1a]
    str r2, [r0, #0x3c]
    tst r1, #0x30
    beq .L_02037b58
    tst r1, #0x20
    subne r1, r2, #0x1800
    strne r1, [r0, #0x3c]
    ldrne r1, [r0, #0x230]
    mov r3, #0x0
    orrne r1, r1, #0x80000000
    moveq r1, #0x1800
    streq r1, [r0, #0x3c]
    ldreq r1, [r0, #0x230]
    biceq r1, r1, #0x80000000
    str r1, [r0, #0x230]
    ldr r2, [r0, #0x230]
    ldr r1, .L_02037ba8
    bic r2, r2, #0x1
    orr r2, r2, #0x2
    str r2, [r0, #0x230]
    ldr r5, [r0, #0x8c]
    ldr ip, [r0, #0x3c]
    umull r7, r6, r5, r1
    rsb r2, r1, #0x1000
    mla r6, r5, r3, r6
    umull r4, lr, ip, r2
    mov r5, r5, asr #0x1f
    mla r6, r5, r1, r6
    adds r7, r7, #0x800
    adc r5, r6, #0x0
    mov r6, r7, lsr #0xc
    mla lr, ip, r3, lr
    mov r1, ip, asr #0x1f
    mla lr, r1, r2, lr
    adds r4, r4, #0x800
    adc r1, lr, #0x0
    mov r2, r4, lsr #0xc
    orr r6, r6, r5, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    add r1, r6, r2
    str r1, [r0, #0x8c]
.L_02037b58:
    ldr r3, [r0, #0x8c]
    ldr r1, .L_02037bac
    mov r2, #0x0
    umull lr, ip, r3, r1
    mla ip, r3, r2, ip
    mov r2, r3, asr #0x1f
    mla ip, r2, r1, ip
    adds r3, lr, #0x800
    adc r1, ip, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r0, #0x8c]
    ldr r1, [r0, #0x3c]
    cmp r1, #0x0
    movne r1, #0x180
    strneh r1, [r0, #0xde]
    moveq r1, #0x100
    streqh r1, [r0, #0xde]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02037ba4: .word gSystemState
.L_02037ba8: .word 0xe66
.L_02037bac: .word 0xccd
    .size func_02037a94, . - func_02037a94
