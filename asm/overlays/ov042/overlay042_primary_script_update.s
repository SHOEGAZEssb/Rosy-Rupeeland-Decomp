.text
.extern func_ov042_021fda0c
.extern func_ov042_021ff2f8
.extern func_020adc40
.extern func_020adc90
.extern func_020a1ec0
.extern genrand_int32
.extern func_020bf1f8
.extern func_020befec
.extern data_ov042_0220adce
.extern data_ov042_0220aec4
.extern data_ov042_0220af9c
.extern data_020c9670

    .global func_ov042_02201234
func_ov042_02201234:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x164
    mov ip, #0x0
    sub r8, ip, #0x8c
    mov r6, #0xa
    add r7, sp, #0x12c
    str r8, [sp, #0x120]
    sub r8, ip, #0x96
    add r11, sp, #0x124
    add r2, sp, #0x154
    sub r9, ip, #0xa
    mov r10, r0
    mov r4, #0x46
    sub r5, r6, #0xaa
    add lr, sp, #0x134
    str r8, [r11, #0x4]
    str r8, [r7, #0x4]
    sub r8, r6, #0x50
    str r6, [r7, #0x0]
    sub r6, r4, #0xc8
    str r6, [r2, #0x4]
    str ip, [r2, #0x0]
    str ip, [sp, #0x11c]
    str r9, [r11, #0x0]
    str r8, [lr, #0x0]
    str r5, [lr, #0x4]
    add r2, sp, #0x13c
    stmia r2, {r4, r5}
    add r0, sp, #0x144
    stmia r0, {r8, r9}
    add r3, sp, #0x14c
    stmia r3, {r4, r9}
    add r1, sp, #0x15c
    ldr r7, .L_02201e5c
    add r6, sp, #0x0
    str ip, [r1, #0x0]
    str r5, [r1, #0x4]
    mov r1, #0x1f
.L_022012cc:
    ldrh r0, [r7], #0x2
    subs r1, r1, #0x1
    strh r0, [r6], #0x2
    bne .L_022012cc
    ldr r3, .L_02201e60
    add r2, sp, #0xba
    mov r1, #0x30
.L_022012e8:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_022012e8
    ldr r3, .L_02201e64
    add r2, sp, #0x3e
    mov r1, #0x3e
.L_02201304:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02201304
    ldr r0, [r10, #0x150]
    add r4, sp, #0x0
    cmp r0, #0x1
    addeq r4, sp, #0xba
    cmp r0, #0x2
    ldr r0, [r10, #0xc0]
    addeq r4, sp, #0x3e
    sub r0, r0, #0x1
    str r0, [r10, #0xc0]
    cmp r0, #0x0
    bgt .L_0220148c
    ldr r0, [r10, #0xdc]
    mov r2, #0x0
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r10, #0xdc]
    strne r0, [r10, #0xbc]
    ldr r0, [r10, #0xbc]
    mov r0, r0, lsl #0x1
    ldrh r0, [r4, r0]
    and r0, r0, #0xf
    str r0, [r10, #0xc8]
    ldr r0, [r10, #0xbc]
    mov r0, r0, lsl #0x1
    ldrh r0, [r4, r0]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x10
    str r0, [r10, #0xcc]
    str r2, [r10, #0xd0]
    ldr r0, [r10, #0x1e8]
    cmp r0, #0x0
    beq .L_022013f8
    ldr r0, [r10, #0xcc]
    cmp r0, #0x0
    bne .L_022013f8
    ldr r1, [r10, #0xbc]
    mov r0, #0x8
    sub r1, r1, #0x1
    str r1, [r10, #0xbc]
    str r0, [r10, #0xc8]
    ldr r0, [r10, #0x1e8]
    cmp r0, #0x1
    moveq r0, #0x2
    streq r0, [r10, #0x1e8]
    beq .L_022013f8
    cmp r0, #0x3
    moveq r0, #0xd
    streq r0, [r10, #0xcc]
    beq .L_022013f8
    cmp r0, #0x4
    moveq r0, #0xe
    streq r0, [r10, #0xcc]
    beq .L_022013f8
    cmp r0, #0x5
    streq r2, [r10, #0xc8]
    streq r2, [r10, #0xcc]
    streq r2, [r10, #0x1e8]
.L_022013f8:
    ldr r0, [r10, #0xcc]
    cmp r0, #0x0
    cmpne r0, #0xf
    bne .L_02201434
    ldr r2, [r10, #0xc8]
    add r1, sp, #0x11c
    ldr r1, [r1, r2, lsl #0x3]
    add r0, sp, #0x120
    mov r1, r1, lsl #0xc
    str r1, [r10, #0x158]
    ldr r1, [r10, #0xc8]
    ldr r0, [r0, r1, lsl #0x3]
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x15c]
    b .L_02201440
.L_02201434:
    add r0, r10, #0x154
    add r1, r10, #0xa4
    bl func_ov042_021fda0c
.L_02201440:
    ldr r1, .L_02201e68
    ldr r0, .L_02201e6c
    str r1, [r10, #0xc0]
    ldr r1, [r10, #0xbc]
    add r1, r1, #0x1
    str r1, [r10, #0xbc]
    mov r1, r1, lsl #0x1
    ldrh r1, [r4, r1]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r10, #0xbc]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x1c8]
    cmp r0, #0x7
    bne .L_0220148c
    ldr r0, [r10, #0xbc]
    cmp r0, #0x4
    movge r0, #0x0
    strge r0, [r10, #0xbc]
.L_0220148c:
    ldr r1, [r10, #0x158]
    ldr r0, [r10, #0xa8]
    ldr r3, [r10, #0x15c]
    sub r8, r1, r0
    ldr r1, [r10, #0xac]
    smull r0, r2, r8, r8
    sub r6, r3, r1
    adds r3, r0, #0x800
    smull r1, r0, r6, r6
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    mov r11, r6, asr #0x1f
    mov r7, r8, asr #0x1f
    bl func_020adc40
    ldr r1, [r10, #0xb4]
    ldr r3, .L_02201e70
    mov r5, #0x0
    umull r4, r2, r1, r3
    adds r9, r4, #0x800
    mla r2, r1, r5, r2
    mov r4, r0
    mov r9, r9, lsr #0xc
    mov r0, r1, asr #0x1f
    mla r2, r0, r3, r2
    adc r0, r2, #0x0
    orr r9, r9, r0, lsl #0x14
    sub r0, r1, r9
    str r0, [r10, #0xb4]
    ldr r2, [r10, #0xb8]
    mov r0, #0x800
    mov r9, r2, asr #0x1f
    umull r1, ip, r2, r3
    adds r1, r1, #0x800
    mov r1, r1, lsr #0xc
    mla ip, r2, r5, ip
    mla ip, r9, r3, ip
    adc r3, ip, #0x0
    orr r1, r1, r3, lsl #0x14
    sub r1, r2, r1
    str r1, [r10, #0xb8]
    ldr r1, [r10, #0xd0]
    cmp r1, #0x0
    bne .L_02201830
    cmp r4, #0x0
    ble .L_0220163c
    ldr r0, [r10, #0xcc]
    mov r1, r4
    cmp r0, #0xe
    mov r0, r8
    blt .L_022015b8
    bl func_020adc90
    ldr r1, .L_02201e74
    mov r2, r5
    umull r5, r3, r0, r1
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adds r5, r5, #0x800
    adc r0, r3, #0x0
    mov r1, r5, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r2, [r10, #0xb4]
    mov r0, r6
    add r2, r2, r1
    mov r1, r4
    str r2, [r10, #0xb4]
    bl func_020adc90
    ldr r1, .L_02201e74
    b .L_02201600
.L_022015b8:
    bl func_020adc90
    ldr r1, .L_02201e78
    mov r2, r5
    umull r5, r3, r0, r1
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adds r5, r5, #0x800
    adc r0, r3, #0x0
    mov r1, r5, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r2, [r10, #0xb4]
    mov r0, r6
    add r2, r2, r1
    mov r1, r4
    str r2, [r10, #0xb4]
    bl func_020adc90
    ldr r1, .L_02201e78
.L_02201600:
    mov r2, #0x0
    umull r5, r3, r0, r1
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adds r5, r5, #0x800
    adc r0, r3, #0x0
    mov r1, r5, lsr #0xc
    ldr r2, [r10, #0xb8]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r10, #0xb8]
    add r0, r10, #0xa4
    add r1, r10, #0xb0
    bl func_ov042_021ff2f8
.L_0220163c:
    cmp r4, #0x7000
    bgt .L_02201e54
    ldr r0, [r10, #0xcc]
    cmp r0, #0x0
    cmpne r0, #0xf
    bne .L_02201670
    mov r0, #0x0
    str r0, [r10, #0xc0]
    ldr r0, [r10, #0x1e8]
    cmp r0, #0x2
    addge r0, r0, #0x1
    strge r0, [r10, #0x1e8]
    b .L_02201e54
.L_02201670:
    mov r0, #0x1
    str r0, [r10, #0xd0]
    mov r0, #0x0
    str r0, [r10, #0x1d4]
    str r0, [r10, #0x1e0]
    str r0, [r10, #0xd8]
    ldr r0, [r10, #0xcc]
    sub r0, r0, #0x1
    cmp r0, #0x1
    bhi .L_022016c0
    add r1, sp, #0x11c
    add r3, r0, #0x3
    ldr r2, [r1, r3, lsl #0x3]
    add r1, sp, #0x120
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x158]
    ldr r1, [r1, r3, lsl #0x3]
    mov r1, r1, lsl #0xc
    str r1, [r10, #0x15c]
    str r0, [r10, #0x1d0]
.L_022016c0:
    cmp r0, #0x2
    bne .L_022016e8
    ldr r2, [sp, #0x13c]
    mov r1, #0x0
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x158]
    ldr r2, [sp, #0x140]
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x15c]
    str r1, [r10, #0x1d0]
.L_022016e8:
    cmp r0, #0x3
    bne .L_02201710
    ldr r2, [sp, #0x134]
    mov r1, #0x1
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x158]
    ldr r2, [sp, #0x138]
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x15c]
    str r1, [r10, #0x1d0]
.L_02201710:
    sub r4, r0, #0x4
    cmp r4, #0x1
    bhi .L_02201744
    add r1, sp, #0x11c
    sub r3, r0, #0x1
    ldr r2, [r1, r3, lsl #0x3]
    add r1, sp, #0x120
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x158]
    ldr r1, [r1, r3, lsl #0x3]
    mov r1, r1, lsl #0xc
    str r1, [r10, #0x15c]
    str r4, [r10, #0x1d0]
.L_02201744:
    sub r4, r0, #0x6
    cmp r4, #0x1
    bhi .L_02201780
    add r1, sp, #0x11c
    sub r3, r0, #0x3
    ldr r2, [r1, r3, lsl #0x3]
    add r1, sp, #0x120
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x158]
    ldr r2, [r1, r3, lsl #0x3]
    mov r1, #0x0
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x15c]
    str r4, [r10, #0x1d0]
    str r1, [r10, #0xd8]
.L_02201780:
    cmp r0, #0x8
    blt .L_022017bc
    cmp r0, #0xb
    bgt .L_022017bc
    add r1, sp, #0x11c
    sub r3, r0, #0x5
    ldr r2, [r1, r3, lsl #0x3]
    add r1, sp, #0x120
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x158]
    ldr r2, [r1, r3, lsl #0x3]
    mov r1, #0x1
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x15c]
    str r1, [r10, #0xd8]
.L_022017bc:
    cmp r0, #0xc
    bne .L_022017f4
    ldr r3, [r10, #0xc8]
    add r1, sp, #0x11c
    ldr r3, [r1, r3, lsl #0x3]
    add r2, sp, #0x120
    mov r3, r3, lsl #0xc
    str r3, [r10, #0x158]
    ldr r3, [r10, #0xc8]
    mov r1, #0x1
    ldr r2, [r2, r3, lsl #0x3]
    mov r2, r2, lsl #0xc
    str r2, [r10, #0x15c]
    str r1, [r10, #0xd8]
.L_022017f4:
    cmp r0, #0xd
    bne .L_02201e54
    ldr r0, [r10, #0x48]
    ldr r1, .L_02201e7c
    bl func_020a1ec0
    mov r0, #0x6e
    str r0, [r10, #0xd0]
    mov r1, #0x1
    str r1, [r10, #0xd8]
    ldr r0, [r10, #0xc8]
    cmp r0, #0x8
    streq r1, [r10, #0x1e0]
    moveq r0, #0x28
    streq r0, [r10, #0x1cc]
    b .L_02201e54
.L_02201830:
    ldr r2, [r10, #0xd8]
    cmp r2, #0x0
    bne .L_022018f8
    ldr r0, [r10, #0xcc]
    sub r4, r0, #0x7
    cmp r4, #0x1
    movls r5, #0xd
    add r0, r5, #0x28
    cmp r1, r0
    bge .L_02201e54
    ldr r0, [r10, #0xd0]
    add r0, r0, #0x1
    str r0, [r10, #0xd0]
    cmp r0, r5
    blt .L_022018a4
    ldr r0, [r10, #0x1d4]
    cmp r0, #0x0
    cmpne r0, #0xf
    bne .L_02201888
    ldr r0, [r10, #0x48]
    ldr r1, .L_02201e80
    bl func_020a1ec0
.L_02201888:
    ldr r1, [r10, #0x1d4]
    mov r0, #0xfa0
    add r1, r1, #0x1
    str r1, [r10, #0x1d4]
    str r0, [r10, #0x1d8]
    mov r0, #0x400
    str r0, [r10, #0x1dc]
.L_022018a4:
    ldr r1, [r10, #0xd0]
    add r0, r5, #0x28
    cmp r1, r0
    bne .L_02201e54
    mov r0, #0x0
    str r0, [r10, #0x1d4]
    cmp r4, #0x1
    strls r0, [r10, #0xd0]
    strls r0, [r10, #0x1cc]
    strls r0, [r10, #0xc0]
    strls r0, [r10, #0xd8]
    bls .L_02201e54
    ldr r0, [r10, #0x48]
    ldr r1, .L_02201e7c
    bl func_020a1ec0
    mov r0, #0x46
    str r0, [r10, #0xd0]
    ldr r0, [r10, #0xd8]
    add r0, r0, #0x1
    str r0, [r10, #0xd8]
    b .L_02201e54
.L_022018f8:
    cmp r2, #0x1
    bne .L_02201ce8
    ldr r2, [r10, #0xcc]
    ldr r0, [r10, #0x1e0]
    sub r4, r2, #0x1
    cmp r0, #0x0
    moveq r9, #0xb4000
    movne r9, #0xd2000
    cmp r4, #0x1
    ldrls r0, [r10, #0x150]
    mov r5, #0x46
    rsbls r0, r0, r0, lsl #0x3
    subls r5, r5, r0
    bls .L_02201a6c
    sub r0, r4, #0x2
    cmp r0, #0x1
    bhi .L_022019a8
    ldr r2, [r10, #0x150]
    mov r0, #0x6
    mul r0, r2, r0
    rsb r0, r0, #0x1e
    add r5, r5, r0
    cmp r1, r5
    bne .L_02201a6c
    ldr r0, [r10, #0x48]
    ldr r1, .L_02201e7c
    bl func_020a1ec0
    cmp r4, #0x2
    bne .L_02201984
    ldr r0, [sp, #0x134]
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x158]
    ldr r0, [sp, #0x138]
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x15c]
.L_02201984:
    cmp r4, #0x3
    bne .L_02201a6c
    ldr r0, [sp, #0x13c]
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x158]
    ldr r0, [sp, #0x140]
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x15c]
    b .L_02201a6c
.L_022019a8:
    sub r0, r4, #0x4
    cmp r0, #0x1
    bhi .L_02201a20
    add r5, r5, #0x12
    cmp r1, r5
    bne .L_02201a6c
    ldr r0, [r10, #0x48]
    ldr r1, .L_02201e7c
    bl func_020a1ec0
    cmp r4, #0x4
    bne .L_022019ec
    ldr r0, [sp, #0x13c]
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x158]
    ldr r0, [sp, #0x140]
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x15c]
.L_022019ec:
    cmp r4, #0x5
    bne .L_02201a0c
    ldr r0, [sp, #0x134]
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x158]
    ldr r0, [sp, #0x138]
    mov r0, r0, lsl #0xc
    str r0, [r10, #0x15c]
.L_02201a0c:
    sub r0, r4, #0x1
    str r0, [r10, #0xcc]
    mov r0, #0x3a
    str r0, [r10, #0xd0]
    b .L_02201a6c
.L_02201a20:
    cmp r4, #0x8
    blt .L_02201a6c
    cmp r4, #0xc
    bgt .L_02201a6c
    sub r5, r5, #0xf
    cmp r1, r5
    bne .L_02201a6c
    ldr r0, [r10, #0xc8]
    cmp r0, #0x8
    moveq r0, #0x2
    streq r0, [r10, #0xd8]
    moveq r0, #0x1
    streq r0, [r10, #0xd0]
    beq .L_02201a6c
    ldr r1, .L_02201e84
    mov r0, #0x0
    str r1, [r10, #0xd0]
    str r0, [r10, #0x1cc]
    str r0, [r10, #0xc0]
.L_02201a6c:
    ldr r2, [r10, #0xd0]
    add r1, r5, #0x23
    cmp r2, r1
    bge .L_02201b0c
    add r0, r2, #0x1
    str r0, [r10, #0xd0]
    cmp r0, r1
    bne .L_02201a98
    ldr r0, [r10, #0x48]
    ldr r1, .L_02201e7c
    bl func_020a1ec0
.L_02201a98:
    ldr r0, .L_02201e70
    mov r1, #0x0
    umull r9, r4, r8, r0
    mla r4, r8, r1, r4
    umull r3, r2, r6, r0
    mla r2, r6, r1, r2
    adds r1, r9, #0x800
    mla r4, r7, r0, r4
    adc r4, r4, #0x0
    mov r6, r1, lsr #0xc
    adds r1, r3, #0x800
    mla r2, r11, r0, r2
    orr r6, r6, r4, lsl #0x14
    adc r0, r2, #0x0
    mov r1, r1, lsr #0xc
    str r6, [r10, #0xb4]
    orr r1, r1, r0, lsl #0x14
    str r1, [r10, #0xb8]
    add r0, r10, #0xa4
    add r1, r10, #0xb0
    bl func_ov042_021ff2f8
    ldr r0, [r10, #0xd0]
    cmp r0, r5
    blt .L_02201e54
    ldr r0, [r10, #0x1cc]
    cmp r0, #0x1e
    addlt r0, r0, #0x2
    strlt r0, [r10, #0x1cc]
    b .L_02201e54
.L_02201b0c:
    add r0, r5, #0x32
    cmp r2, r0
    bge .L_02201ba4
    ldr r0, [r10, #0x1e0]
    cmp r0, #0x0
    ldrne r0, [r10, #0xb8]
    addne r0, r0, #0x9a
    addne r0, r0, #0x1d00
    strne r0, [r10, #0xb8]
    bne .L_02201b6c
    ldr r0, [r10, #0x150]
    cmp r0, #0x2
    ldreq r0, [r10, #0xb8]
    addeq r0, r0, #0xe1
    addeq r0, r0, #0x1a00
    streq r0, [r10, #0xb8]
    beq .L_02201b6c
    cmp r0, #0x1
    ldr r0, [r10, #0xb8]
    addeq r0, r0, #0x1000
    streq r0, [r10, #0xb8]
    addne r0, r0, #0x148
    addne r0, r0, #0xc00
    strne r0, [r10, #0xb8]
.L_02201b6c:
    mov r0, #0x0
    str r0, [r10, #0xb4]
    add r0, r10, #0xa4
    add r1, r10, #0xb0
    bl func_ov042_021ff2f8
    ldr r0, [r10, #0xac]
    cmp r0, r9
    ble .L_02201e54
    add r0, r5, #0x32
    str r0, [r10, #0xd0]
    ldr r0, [r10, #0x48]
    ldr r1, .L_02201e88
    bl func_020a1ec0
    b .L_02201e54
.L_02201ba4:
    add r0, r5, #0x46
    cmp r2, r0
    bge .L_02201bf4
    bl genrand_int32
    mov r1, #0xa
    bl func_020bf1f8
    ldr r2, [r10, #0x158]
    sub r0, r1, #0x5
    add r0, r2, r0, lsl #0xc
    str r0, [r10, #0xa8]
    bl genrand_int32
    mov r1, #0xa
    bl func_020bf1f8
    sub r0, r1, #0x5
    add r0, r9, r0, lsl #0xc
    str r0, [r10, #0xac]
    ldr r0, [r10, #0xd0]
    add r0, r0, #0x1
    str r0, [r10, #0xd0]
    b .L_02201e54
.L_02201bf4:
    bne .L_02201ca8
    ldr r0, [r10, #0x1cc]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r10, #0x1cc]
    ldr r0, [r10, #0x1e0]
    cmp r0, #0x0
    bne .L_02201c68
    ldr r0, [r10, #0xa8]
    ldr r1, [r10, #0xb4]
    cmp r0, #0x0
    ldrgt r2, .L_02201e8c
    add r0, r10, #0xa4
    ldrle r2, .L_02201e90
    add r1, r1, r2
    str r1, [r10, #0xb4]
    ldr r2, [r10, #0xb8]
    add r1, r10, #0xb0
    sub r2, r2, #0x33
    sub r2, r2, #0xb00
    str r2, [r10, #0xb8]
    bl func_ov042_021ff2f8
    mov r0, #0x6e000
    ldr r1, [r10, #0xac]
    rsb r0, r0, #0x0
    cmp r1, r0
    addlt r0, r5, #0x47
    strlt r0, [r10, #0xd0]
    b .L_02201e54
.L_02201c68:
    bl genrand_int32
    mov r1, #0xa
    bl func_020bf1f8
    ldr r2, [r10, #0x158]
    ldr r0, .L_02201e94
    sub r1, r1, #0x5
    mla r0, r1, r0, r2
    str r0, [r10, #0xa8]
    ldr r0, [r10, #0xac]
    sub r0, r0, #0xcd
    sub r0, r0, #0xc00
    str r0, [r10, #0xac]
    cmp r0, #0xa5000
    movlt r0, #0x0
    strlt r0, [r10, #0x1e0]
    b .L_02201e54
.L_02201ca8:
    add r0, r10, #0xa4
    add r1, r10, #0xb0
    bl func_ov042_021ff2f8
    ldr r1, [r10, #0xd0]
    add r0, r5, #0x50
    add r1, r1, #0x1
    str r1, [r10, #0xd0]
    cmp r1, r0
    ble .L_02201e54
    mov r0, #0x0
    str r0, [r10, #0xc0]
    ldr r0, [r10, #0x1e8]
    cmp r0, #0x4
    addeq r0, r0, #0x1
    streq r0, [r10, #0x1e8]
    b .L_02201e54
.L_02201ce8:
    cmp r2, #0x2
    bne .L_02201dc0
    add r2, r1, #0x1
    str r2, [r10, #0xd0]
    cmp r2, #0x83
    bge .L_02201da8
    sub r1, r0, #0x224
    mul r1, r2, r1
    add r1, r1, #0x8000
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r2, r1, #0x1
    ldr r1, .L_02201e98
    mov r2, r2, lsl #0x1
    ldrsh r2, [r1, r2]
    ldr r1, .L_02201e9c
    ldr r6, [r10, #0xac]
    add r2, r2, #0x1000
    umull r4, r3, r2, r1
    mla r3, r2, r5, r3
    mov r2, r2, asr #0x1f
    adds r4, r4, r0
    mla r3, r2, r1, r3
    adc r1, r3, r5
    mov r2, r4, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    sub r1, r6, r2
    str r1, [r10, #0xac]
    ldr r2, [r10, #0x1d4]
    mov r1, #0x2
    add r2, r2, #0x1
    str r2, [r10, #0x1d4]
    str r1, [r10, #0x1d0]
    sub r1, r0, #0x224
    str r1, [r10, #0x1d8]
    str r0, [r10, #0x1dc]
    str r5, [r10, #0x1cc]
    ldr r0, [r10, #0xd0]
    mov r1, #0x2c
    bl func_020befec
    cmp r1, #0xb
    bne .L_02201e54
    ldr r0, [r10, #0x48]
    ldr r1, .L_02201e80
    bl func_020a1ec0
    b .L_02201e54
.L_02201da8:
    str r5, [r10, #0xc0]
    ldr r0, [r10, #0x1e8]
    cmp r0, #0x3
    addeq r0, r0, #0x1
    streq r0, [r10, #0x1e8]
    b .L_02201e54
.L_02201dc0:
    ldr r0, [r10, #0x1cc]
    cmp r0, #0x0
    ble .L_02201dd8
    subs r0, r0, #0x2
    str r0, [r10, #0x1cc]
    strmi r5, [r10, #0x1cc]
.L_02201dd8:
    mov r0, #0x29
    mov r1, #0x0
    umull r5, r4, r8, r0
    mla r4, r8, r1, r4
    umull r3, r2, r6, r0
    mla r2, r6, r1, r2
    adds r1, r5, #0x800
    mla r4, r7, r0, r4
    mla r2, r11, r0, r2
    adc r4, r4, #0x0
    mov r5, r1, lsr #0xc
    adds r1, r3, #0x800
    ldr r0, [r10, #0xb4]
    orr r5, r5, r4, lsl #0x14
    add r0, r0, r5
    str r0, [r10, #0xb4]
    adc r0, r2, #0x0
    mov r1, r1, lsr #0xc
    ldr r2, [r10, #0xb8]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r10, #0xb8]
    add r0, r10, #0xa4
    add r1, r10, #0xb0
    bl func_ov042_021ff2f8
    ldr r0, [r10, #0xd0]
    add r0, r0, #0x1
    str r0, [r10, #0xd0]
    cmp r0, #0x14
    movgt r0, #0x0
    strgt r0, [r10, #0xc0]
.L_02201e54:
    add sp, sp, #0x164
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02201e5c: .word data_ov042_0220adce
.L_02201e60: .word data_ov042_0220aec4
.L_02201e64: .word data_ov042_0220af9c
.L_02201e68: .word 0x270f
.L_02201e6c: .word 0xffff
.L_02201e70: .word 0x19a
.L_02201e74: .word 0x4cd
.L_02201e78: .word 0x3d7
.L_02201e7c: .word 0xb582
.L_02201e80: .word 0xb585
.L_02201e84: .word 0x2710
.L_02201e88: .word 0xb583
.L_02201e8c: .word 0xfffffccd
.L_02201e90: .word 0x333
.L_02201e94: .word 0xbb8
.L_02201e98: .word data_020c9670
.L_02201e9c: .word 0x1ccd
.size func_ov042_02201234, . - func_ov042_02201234

