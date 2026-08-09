.text
.extern genrand_int32
.extern func_020adc40
.extern func_020adc90
.extern func_020ae024
.extern func_02072b68
.extern func_020a1794
.extern func_020a1ec0
.extern func_ov042_021fcf80
.extern func_ov042_021ff2f8
.extern func_ov042_02203658
.extern func_ov042_021fda24
.extern func_ov042_022051a8
.extern func_ov071_02211a10
.extern data_020c9670
    .global func_ov042_022080f0
func_ov042_022080f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x34
    mov r4, r0
    ldr r0, [r4, #0x80]
    add r0, r0, #0x1
    str r0, [r4, #0x80]
    ldr r0, [r4, #0x74]
    cmp r0, #0x5
    bgt .L_02208138
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_022085bc
.L_02208120: ; jump table
    b .L_02208144 ; case 0
    b .L_022085bc ; case 1
    b .L_022081ac ; case 2
    b .L_0220831c ; case 3
    b .L_0220838c ; case 4
    b .L_022084d8 ; case 5
.L_02208138:
    cmp r0, #0x64
    beq .L_02208510
    b .L_022085bc
.L_02208144:
    ldr r1, [r4, #0x80]
    ldr r0, .L_02208758
    mul r0, r1, r0
    cmp r0, #0x4000
    ble .L_0220817c
    mov r0, #0x2
    str r0, [r4, #0x74]
    mov r1, #0x0
    str r1, [r4, #0x6c]
    str r1, [r4, #0x70]
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    b .L_022085bc
.L_0220817c:
    mov r1, r0, asr #0x4
    ldr r0, .L_0220875c
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    ldr r1, [r4, #0x6c]
    smull r2, r0, r1, r0
    adds r1, r2, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x54]
    b .L_022085bc
.L_022081ac:
    ldr r3, [r4, #0x60]
    ldr r2, [r4, #0x54]
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0x58]
    sub r6, r3, r2
    sub r7, r1, r0
    smull r0, r2, r6, r6
    adds r3, r0, #0x800
    smull r1, r0, r7, r7
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    ldr r1, [r4, #0x6c]
    mov r3, #0xa4
    umull r2, r8, r1, r3
    mov ip, #0x0
    adds r2, r2, #0x800
    mla r8, r1, ip, r8
    mov r5, r0
    mov lr, r2, lsr #0xc
    mov r0, r6
    mov r2, r1, asr #0x1f
    mla r8, r2, r3, r8
    adc r2, r8, #0x0
    orr lr, lr, r2, lsl #0x14
    sub r1, r1, lr
    str r1, [r4, #0x6c]
    ldr r2, [r4, #0x70]
    mov r1, r5
    mov r6, r2, asr #0x1f
    umull lr, r8, r2, r3
    mla r8, r2, ip, r8
    mla r8, r6, r3, r8
    adds r6, lr, #0x800
    adc r3, r8, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r3, lsl #0x14
    sub r2, r2, r6
    str r2, [r4, #0x70]
    bl func_020adc90
    ldr r2, [r4, #0x6c]
    mov ip, r0, asr #0x1f
    mov r6, #0x0
    ldr r3, .L_02208760
    mov r1, r5
    umull r8, lr, r0, r3
    mla lr, r0, r6, lr
    mla lr, ip, r3, lr
    adds r3, r8, #0x800
    adc r0, lr, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    add r0, r2, r3
    str r0, [r4, #0x6c]
    mov r0, r7
    bl func_020adc90
    ldr lr, [r4, #0x70]
    mov r6, r0, asr #0x1f
    mov r3, #0x0
    ldr r2, .L_02208760
    add r1, r4, #0x68
    umull ip, r7, r0, r2
    mla r7, r0, r3, r7
    mla r7, r6, r2, r7
    adds r2, ip, #0x800
    adc r0, r7, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r0, lr, r2
    str r0, [r4, #0x70]
    add r0, r4, #0x50
    bl func_ov042_021ff2f8
    cmp r5, #0x5000
    bgt .L_022085bc
    ldr r0, [r4, #0x74]
    add r0, r0, #0x1
    str r0, [r4, #0x74]
    ldrb r0, [r4, #0x8a]
    cmp r0, #0x4
    blo .L_022085bc
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0x74]
    add r0, r0, #0x1
    str r0, [r4, #0x74]
    b .L_022085bc
.L_0220831c:
    ldr r0, [r4, #0x80]
    cmp r0, #0x28
    ble .L_02208378
    tst r0, #0x1f
    bne .L_02208378
    mov r0, #0x5
    str r0, [r4, #0x84]
    ldr r0, [r4, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    mov r3, r1
    ldr r0, [r0, #0xa0]
    add r2, r4, #0x50
    bl func_ov042_022051a8
    ldr r0, [r4, #0x80]
    tst r0, #0x1
    ldr r0, [r4, #0x48]
    beq .L_02208370
    ldr r1, .L_02208764
    bl func_020a1ec0
    b .L_02208378
.L_02208370:
    ldr r1, .L_02208768
    bl func_020a1ec0
.L_02208378:
    ldr r0, [r4, #0x80]
    cmp r0, #0x168
    movgt r0, #0x5
    strgt r0, [r4, #0x74]
    b .L_022085bc
.L_0220838c:
    ldr r0, [r4, #0x80]
    cmp r0, #0x320
    bge .L_022083ec
    mov r1, #0x6e000
    ldr r0, [r4, #0x54]
    rsb r1, r1, #0x0
    cmp r0, r1
    bge .L_022083c8
    ldr r0, [r4, #0x6c]
    add r0, r0, #0xcd
    str r0, [r4, #0x6c]
    cmp r0, #0x3000
    movgt r0, #0x3000
    strgt r0, [r4, #0x6c]
    b .L_02208410
.L_022083c8:
    cmp r0, #0x6e000
    ble .L_02208410
    ldr r2, [r4, #0x6c]
    add r0, r1, #0x6b000
    sub r2, r2, #0xcd
    str r2, [r4, #0x6c]
    cmp r2, r0
    strlt r0, [r4, #0x6c]
    b .L_02208410
.L_022083ec:
    mov r0, #0xd2000
    ldr r1, [r4, #0x54]
    rsb r0, r0, #0x0
    cmp r1, r0
    blt .L_02208408
    cmp r1, #0xd2000
    ble .L_02208410
.L_02208408:
    mov r0, #0x65
    str r0, [r4, #0x74]
.L_02208410:
    ldr r2, [r4, #0x70]
    ldr r0, .L_0220876c
    mov r1, #0x0
    umull r5, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    adds r2, r5, #0x800
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x70]
    add r0, r4, #0x50
    add r1, r4, #0x68
    bl func_ov042_021ff2f8
    ldr r0, [r4, #0x80]
    cmp r0, #0x1e
    ble .L_022085bc
    tst r0, #0x20
    bne .L_022085bc
    tst r0, #0xf
    bne .L_022085bc
    add r0, sp, #0x28
    add r1, r4, #0x50
    bl func_ov042_02203658
    ldr r1, [sp, #0x2c]
    ldr r0, [sp, #0x30]
    add r1, r1, #0xc000
    add r0, r0, #0x1c000
    str r1, [sp, #0x2c]
    str r0, [sp, #0x30]
    mov r0, #0x5
    str r0, [r4, #0x84]
    ldr r0, [r4, #0x48]
    add r2, sp, #0x28
    ldr r0, [r0, #0xc]
    mov r1, #0x1
    ldr r0, [r0, #0xa0]
    mov r3, #0x0
    bl func_ov042_022051a8
    ldr r0, [r4, #0x80]
    tst r0, #0x1
    ldr r0, [r4, #0x48]
    beq .L_022084cc
    ldr r1, .L_02208764
    bl func_020a1ec0
    b .L_022085bc
.L_022084cc:
    ldr r1, .L_02208768
    bl func_020a1ec0
    b .L_022085bc
.L_022084d8:
    ldr r0, [r4, #0x70]
    add r1, r4, #0x68
    add r0, r0, #0xcd
    str r0, [r4, #0x70]
    cmp r0, #0x3000
    movgt r0, #0x3000
    strgt r0, [r4, #0x70]
    add r0, r4, #0x50
    bl func_ov042_021ff2f8
    ldr r0, [r4, #0x58]
    cmp r0, #0x12c000
    movgt r0, #0x65
    strgt r0, [r4, #0x74]
    b .L_022085bc
.L_02208510:
    ldrsb r0, [r4, #0x8b]
    cmp r0, #0x0
    ble .L_02208534
    sub r0, r0, #0x1
    strb r0, [r4, #0x8b]
    ldrsb r0, [r4, #0x8b]
    cmp r0, #0x0
    moveq r0, #0x65
    streq r0, [r4, #0x74]
.L_02208534:
    ldrsb r0, [r4, #0x8b]
    ldr r1, [r4, #0x4c]
    tst r0, #0x2
    ldreqh r0, [r1, #0x42]
    orreq r0, r0, #0x4
    ldrneh r0, [r1, #0x42]
    bicne r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldrsb r0, [r4, #0x8b]
    tst r0, #0x3
    bne .L_022085bc
    add r0, sp, #0x1c
    add r1, r4, #0x50
    bl func_ov042_02203658
    bl genrand_int32
    and r0, r0, #0x1f
    ldr r1, [sp, #0x20]
    sub r0, r0, #0x10
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x20]
    bl genrand_int32
    and r0, r0, #0x1f
    ldr r2, [sp, #0x24]
    sub r0, r0, #0x10
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x24]
    ldrsb r3, [r4, #0x8b]
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    mov r3, r3, asr #0x3
    ldr r0, [r0, #0x14]
    add r2, sp, #0x1c
    and r3, r3, #0x3
    bl func_ov042_021fda24
.L_022085bc:
    ldr r0, [r4, #0x84]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r4, #0x84]
    add r0, sp, #0x10
    bl func_ov042_021fcf80
    add r0, sp, #0x10
    add r1, r4, #0x50
    cmp r1, r0
    ldrne r0, [r4, #0x54]
    add r1, sp, #0x10
    strne r0, [sp, #0x14]
    ldrne r0, [r4, #0x58]
    mov r3, #0x0
    strne r0, [sp, #0x18]
    ldr r2, [r4, #0x4c]
    ldr r0, [r4, #0x48]
    add r2, r2, #0x2c
    bl func_020a1794
    ldr r0, [r4, #0x74]
    cmp r0, #0x64
    bge .L_02208750
    cmp r0, #0x2
    blt .L_02208750
    ldr r1, [r4, #0x48]
    ldr r0, [r4, #0x54]
    ldr r2, [r1, #0x8]
    ldr r1, [r4, #0x58]
    ldr r3, [r2, #0x98]
    ldr r2, [r2, #0x9c]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_020ae024
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    add r0, r0, #0x1000
    mov r1, r0, asr #0xd
    ldr r0, [r4, #0x74]
    and r5, r1, #0x7
    cmp r0, #0x4
    ldr r0, [r4, #0x84]
    moveq r5, #0x0
    cmp r0, #0x0
    addgt r0, r5, #0x8
    andgt r5, r0, #0xff
    add r0, sp, #0x4
    add r1, sp, #0x10
    bl func_ov042_02203658
    mov r3, #0x0
    str r3, [sp, #0x0]
    ldr r0, [r4, #0x48]
    add r1, sp, #0x4
    ldr r0, [r0, #0x8]
    mov r2, #0x18000
    ldr r0, [r0, #0xe8]
    bl func_ov071_02211a10
    mov r6, r0
    cmp r6, #0x0
    ble .L_02208718
    ldrsb r0, [r4, #0x8b]
    cmp r0, #0x0
    bne .L_022086d8
    ldr r0, [r4, #0x4c]
    and r5, r5, #0x7
    add r1, r5, #0x10
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl func_02072b68
    mov r0, #0x1e
    strb r0, [r4, #0x8b]
.L_022086d8:
    ldr r0, [r4, #0x7c]
    sub r0, r0, r6
    str r0, [r4, #0x7c]
    cmp r0, #0x0
    bgt .L_02208718
    mov r0, #0x64
    str r0, [r4, #0x74]
    mov r0, #0x28
    strb r0, [r4, #0x8b]
    ldr r0, [r4, #0x4c]
    mov r1, #0x1a
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x48]
    ldr r1, .L_02208770
    bl func_020a1ec0
.L_02208718:
    ldrsb r0, [r4, #0x8b]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgtb r0, [r4, #0x8b]
    ldrsb r0, [r4, #0x8b]
    cmp r0, #0x0
    bgt .L_02208750
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r5, r1
    beq .L_02208750
    mov r1, r5
    bl func_02072b68
.L_02208750:
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02208758: .word 0x10e
.L_0220875c: .word data_020c9670
.L_02208760: .word 0x4cd
.L_02208764: .word 0xeb85
.L_02208768: .word 0xeb8c
.L_0220876c: .word 0xee1
.L_02208770: .word 0xeb83
.size func_ov042_022080f0, . - func_ov042_022080f0

