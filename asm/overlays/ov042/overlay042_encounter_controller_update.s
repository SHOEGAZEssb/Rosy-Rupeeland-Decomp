.text
.extern func_ov042_021fcf80
.extern genrand_int32
.extern func_020bf1f8
.extern func_ov042_021fda24
.extern func_ov042_021fe544
.extern func_020a1ec0
.extern func_ov042_02207114
.extern func_ov066_02210514
.extern func_020593ac
.extern func_020befec
.extern func_0205943c
.extern func_ov042_02201234
.extern func_ov042_02203678
.extern func_ov042_0220368c
.extern func_ov042_021fda0c
.extern func_ov042_021ff2f8
.extern func_ov042_021fe670
.extern func_ov042_02203658
.extern func_ov071_02211a10
.extern func_ov071_02210440
.extern func_ov042_02201ea0
.extern Sound_StopDirectSequence
.extern func_020594ec
.extern func_ov071_02210540
.extern func_0205940c
.extern func_020a1794
.extern func_ov042_022009a0
.extern func_ov042_02200bc0
.extern func_ov042_0220549c
.extern func_ov042_022080f0
.extern func_ov042_02208aac
.extern func_ov042_02209360
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov042_021fe2f0
.extern func_ov042_02205180
.extern func_ov042_022080d4
.extern func_ov042_02208a90
.extern func_ov042_02209344
.extern func_0209a0d8
.extern func_ov042_02200658
.extern func_ov042_02209128
.extern Heap_Free
.extern func_ov042_02208894
.extern func_ov042_02207ef0
.extern func_ov042_021fea78
.extern func_ov042_02205cb8
.extern gSoundContext
.extern data_ov042_0220b500
.extern data_ov042_0220ac78
.extern data_ov042_0220aca8
.extern data_ov042_0220ae0c
.extern data_ov042_0220ac84
.extern data_ov042_0220ac9c
.extern data_020c9670

    .global func_ov042_02201f30
func_ov042_02201f30:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x15c
    mov r4, r0
    ldr r0, [r4, #0x1c0]
    cmp r0, #0x0
    beq .L_0220203c
    add r5, r0, #0x1
    str r5, [r4, #0x1c0]
    tst r5, #0x3
    bne .L_02201fc0
    add r0, sp, #0xfc
    bl func_ov042_021fcf80
    ldr r0, [r4, #0xa8]
    str r0, [sp, #0x100]
    ldr r0, [r4, #0xac]
    str r0, [sp, #0x104]
    bl genrand_int32
    mov r1, #0xa0
    bl func_020bf1f8
    ldr r2, [sp, #0x100]
    sub r0, r1, #0x50
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x100]
    bl genrand_int32
    and r0, r0, #0x7f
    mov r3, r5, asr #0x3
    ldr r1, [sp, #0x104]
    sub r0, r0, #0x60
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x104]
    ldr r0, [r4, #0x48]
    mov r1, #0x2
    ldr r0, [r0, #0x14]
    add r2, sp, #0xfc
    and r3, r3, #0x3
    bl func_ov042_021fda24
.L_02201fc0:
    tst r5, #0x1
    beq .L_02202028
    add r0, sp, #0xf0
    bl func_ov042_021fcf80
    ldr r0, [r4, #0xa8]
    str r0, [sp, #0xf4]
    ldr r0, [r4, #0xac]
    str r0, [sp, #0xf8]
    bl genrand_int32
    mov r1, #0xb4
    bl func_020bf1f8
    ldr r2, [sp, #0xf4]
    sub r0, r1, #0x5a
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0xf4]
    bl genrand_int32
    mov r1, #0xa0
    bl func_020bf1f8
    sub r0, r1, #0xa0
    ldr r2, [sp, #0xf8]
    add r1, sp, #0xf0
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0xf8]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x14]
    bl func_ov042_021fe544
.L_02202028:
    tst r5, #0xf
    bne .L_0220203c
    ldr r0, [r4, #0x48]
    ldr r1, .L_02202df4
    bl func_020a1ec0
.L_0220203c:
    ldr r0, [r4, #0x1b4]
    cmp r0, #0x1
    bne .L_02202054
    mov r0, r4
    bl func_ov042_02207114
    b .L_0220362c
.L_02202054:
    cmp r0, #0x2
    ldr r0, [r4, #0x1b0]
    bne .L_02202824
    cmp r0, #0x0
    beq .L_0220221c
    add r0, r0, #0x1
    str r0, [r4, #0x1b0]
    cmp r0, #0x2
    bne .L_022020cc
    ldr r0, [r4, #0x48]
    mov r2, #0x1
    ldr r0, [r0, #0x10]
    mov r1, #0x4
    str r2, [r0, #0x538]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x8]
    bl func_ov066_02210514 ; func_ov071_02210514
    ldr r0, .L_02202df8
    mov r3, #0x0
    str r0, [r4, #0xb8]
    str r3, [sp, #0x0]
    ldr r0, .L_02202dfc
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02202e00
    mov r2, #0x4
    bl func_020593ac
    ldr r0, [r4, #0x1b0]
    add r0, r0, #0x1
    str r0, [r4, #0x1b0]
.L_022020cc:
    ldr r0, [r4, #0x1b0]
    cmp r0, #0x8c
    ble .L_022021c8
    cmp r0, #0xb4
    bge .L_02202198
    ldr r2, [r4, #0xac]
    ldr r1, [r4, #0xb8]
    mov r0, #0x82000
    add r1, r2, r1
    rsb r0, r0, #0x0
    str r1, [r4, #0xac]
    cmp r1, r0
    ldrle r0, [r4, #0x1b0]
    suble r0, r0, #0x1
    strle r0, [r4, #0x1b0]
    ble .L_02202124
    ldr r0, [r4, #0xb8]
    mov r1, #0x9
    bl func_020befec
    ldr r1, [r4, #0xb8]
    sub r0, r1, r0
    str r0, [r4, #0xb8]
.L_02202124:
    ldr r1, [r4, #0x1d4]
    mov r0, #0x82000
    add r1, r1, #0x1
    str r1, [r4, #0x1d4]
    mov r1, #0x2
    str r1, [r4, #0x1d0]
    mov r1, #0x384
    str r1, [r4, #0x1d8]
    mov r1, #0x800
    str r1, [r4, #0x1dc]
    ldr r1, [r4, #0xac]
    rsb r0, r0, #0x0
    sub r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0xf
    rsbs r3, r0, #0x7f
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, .L_02202dfc
    movmi r3, #0x0
    cmp r3, #0x7f
    ldr r0, [r0, #0x0]
    ldr r1, .L_02202e00
    movgt r3, #0x7f
    mov r2, #0x4
    bl func_0205943c
    b .L_022021c8
.L_02202198:
    cmp r0, #0x134
    bge .L_022021c8
    ldr r0, [r4, #0xac]
    add r0, r0, #0x9a
    add r0, r0, #0x1100
    str r0, [r4, #0xac]
    ldr r0, [r4, #0x1dc]
    subs r0, r0, #0x52
    str r0, [r4, #0x1dc]
    movmi r0, #0x0
    strmi r0, [r4, #0x1dc]
    strmi r0, [r4, #0x1d4]
.L_022021c8:
    ldr r0, [r4, #0x1b0]
    cmp r0, #0x8c
    bne .L_022021ec
    ldr r0, [r4, #0x48]
    mov r1, #0x6
    str r1, [r0, #0x1c8]
    ldr r0, [r4, #0x1b0]
    add r0, r0, #0x1
    str r0, [r4, #0x1b0]
.L_022021ec:
    ldr r0, [r4, #0x1b0]
    cmp r0, #0xb4
    bne .L_02202208
    ldr r0, [r4, #0x48]
    mov r1, #0x7
    ldr r0, [r0, #0x8]
    bl func_ov066_02210514 ; func_ov071_02210514
.L_02202208:
    ldr r0, [r4, #0x1b0]
    cmp r0, #0x134
    movge r0, #0x0
    strge r0, [r4, #0x1b0]
    b .L_022027d0
.L_0220221c:
    ldr r0, [r4, #0x1bc]
    cmp r0, #0x0
    bne .L_02202634
    mov r0, r4
    bl func_ov042_02201234
    ldr r3, .L_02202e04
    ldr r5, .L_02202e08
    ldr r1, .L_02202e0c
    add r0, sp, #0x114
    rsb r2, r3, #0x0
    str r5, [sp, #0x108]
    str r1, [sp, #0x10c]
    str r3, [sp, #0x110]
    bl func_ov042_02203678
    ldr r2, .L_02202e10
    add r0, sp, #0x120
    mov r1, #0x0
    bl func_ov042_02203678
    ldr r1, .L_02202e14
    ldr r2, .L_02202e18
    add r0, sp, #0x12c
    bl func_ov042_02203678
    ldr r1, .L_02202e14
    ldr r2, .L_02202e04
    add r0, sp, #0x138
    bl func_ov042_02203678
    ldr r2, .L_02202e1c
    add r0, sp, #0x144
    mov r1, #0x0
    bl func_ov042_02203678
    ldr r1, .L_02202e0c
    ldr r2, .L_02202e04
    add r0, sp, #0x150
    bl func_ov042_02203678
    ldr r0, [r4, #0xe0]
    ldr r1, .L_02202e20
    mov r0, r0, lsl #0x4
    bl func_020befec
    add r0, r0, r0, lsl #0x1
    sub r5, r0, #0x2
    cmp r5, #0x2
    movlt r5, #0x2
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    cmp r1, #0x0
    bne .L_02202390
    add r0, sp, #0xe4
    bl func_ov042_021fcf80
    bl genrand_int32
    mov r1, #0x6
    bl func_020bf1f8
    mov r0, #0xc
    add r3, sp, #0x108
    mul r5, r1, r0
    add r2, r1, #0x1
    mla r1, r2, r0, r3
    add r0, sp, #0x6c
    add r2, r3, r5
    bl func_ov042_0220368c
    add r0, sp, #0xe4
    add r1, sp, #0x6c
    bl func_ov042_021fda0c
    bl genrand_int32
    ldr r1, .L_02202e24
    add r2, sp, #0x10c
    ldr r7, [r2, r5]
    and r1, r0, r1
    ldr r2, [sp, #0xe8]
    add r0, sp, #0x110
    smull r6, r3, r2, r1
    adds r2, r6, #0x800
    ldr r5, [r0, r5]
    adc r0, r3, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r0, r7, r2
    ldr r2, [sp, #0xec]
    str r0, [sp, #0xe8]
    smull r3, r1, r2, r1
    adds r2, r3, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, r5, r2
    str r1, [sp, #0xec]
    add r0, sp, #0xe4
    add r1, r4, #0xa4
    bl func_ov042_021ff2f8
    ldr r0, [r4, #0x48]
    add r1, sp, #0xe4
    ldr r0, [r0, #0x14]
    bl func_ov042_021fe670
.L_02202390:
    mov r2, #0x0
    add r0, sp, #0xd8
    add r1, r4, #0xa4
    str r2, [sp, #0x8]
    bl func_ov042_02203658
    ldr r1, [sp, #0xe0]
    add r0, sp, #0x60
    sub r2, r1, #0x28000
    add r1, sp, #0xd8
    str r2, [sp, #0xe0]
    bl func_ov042_02203658
    add r0, sp, #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x48]
    add r1, sp, #0x60
    ldr r0, [r0, #0x8]
    mov r2, #0x64000
    ldr r0, [r0, #0xe8]
    mov r3, #0x5
    bl func_ov071_02211a10
    mov r5, r0
    add r0, sp, #0x54
    add r1, r4, #0xa4
    bl func_ov042_02203658
    ldr r0, [r4, #0x48]
    add r1, sp, #0x54
    ldr r0, [r0, #0x8]
    mov r2, #0x64000
    mov r3, #0x1
    bl func_ov071_02210440
    ldr r1, [sp, #0xe0]
    add r0, sp, #0x48
    add r1, r1, #0x28000
    str r1, [sp, #0xe0]
    add r1, sp, #0xd8
    bl func_ov042_02203658
    add r0, sp, #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x48]
    add r1, sp, #0x48
    ldr r0, [r0, #0x8]
    mov r2, #0x64000
    ldr r0, [r0, #0xe8]
    mov r3, #0x5
    bl func_ov071_02211a10
    add r5, r5, r0
    add r0, sp, #0x3c
    add r1, r4, #0xa4
    bl func_ov042_02203658
    ldr r0, [r4, #0x48]
    add r1, sp, #0x3c
    ldr r0, [r0, #0x8]
    mov r2, #0x64000
    mov r3, #0x1
    bl func_ov071_02210440
    ldr r1, [sp, #0xe0]
    add r0, sp, #0x30
    add r1, r1, #0x50000
    str r1, [sp, #0xe0]
    add r1, sp, #0xd8
    bl func_ov042_02203658
    add r0, sp, #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x48]
    add r1, sp, #0x30
    ldr r0, [r0, #0x8]
    mov r2, #0x46000
    ldr r0, [r0, #0xe8]
    mov r3, #0x5
    bl func_ov071_02211a10
    ldr r1, [sp, #0xe0]
    add r5, r5, r0
    add r2, r1, #0x28000
    add r0, sp, #0x24
    add r1, sp, #0xd8
    str r2, [sp, #0xe0]
    bl func_ov042_02203658
    add r0, sp, #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x48]
    add r1, sp, #0x24
    ldr r0, [r0, #0x8]
    mov r2, #0x1e000
    ldr r0, [r0, #0xe8]
    mov r3, #0x5
    bl func_ov071_02211a10
    add r0, r5, r0
    cmp r0, #0x0
    ble .L_022025d8
    ldr r0, [r4, #0xe0]
    sub r0, r0, #0x1
    str r0, [r4, #0xe0]
    ldr r0, [r4, #0x1c4]
    cmp r0, #0x0
    moveq r0, #0x8
    streq r0, [r4, #0x1c4]
    ldr r1, [r4, #0x1c8]
    mov r0, r4
    add r1, r1, #0x1
    str r1, [r4, #0x1c8]
    ldr r1, [sp, #0x8]
    bl func_ov042_02201ea0
    ldr r0, .L_02202e28
    add r3, sp, #0xcc
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r0, [r4, #0xe0]
    ldr r1, .L_02202e20
    bl func_020befec
    rsb r7, r0, #0x2
    cmp r7, #0x2
    movgt r7, #0x2
    cmp r7, #0x0
    movlt r7, #0x0
    add r1, sp, #0xcc
    ldr r0, [r4, #0xc4]
    ldr r5, [r1, r7, lsl #0x2]
    cmp r0, r5
    beq .L_02202580
    ldr r0, [r4, #0x48]
    ldr r1, .L_02202e2c
    bl func_020a1ec0
    mov r0, #0x1
    str r0, [r4, #0xdc]
.L_02202580:
    str r5, [r4, #0xc4]
    ldr r6, .L_02202e30
    add r5, sp, #0xb4
    str r7, [r4, #0x150]
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1}
    stmia r5, {r0, r1}
    ldr r0, [r4, #0xe0]
    mov r1, #0xeb
    bl func_020befec
    rsbs r2, r0, #0x5
    movmi r2, #0x0
    add r1, sp, #0xb4
    ldr r0, [r4, #0x1e4]
    ldr r1, [r1, r2, lsl #0x2]
    cmp r0, r1
    movne r0, #0x1
    strne r0, [r4, #0x1e8]
    str r1, [r4, #0x1e4]
    mov r0, #0x5a
    str r0, [r4, #0xe8]
.L_022025d8:
    ldr r0, [r4, #0x1c4]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r4, #0x1c4]
    ldr r0, [r4, #0xe0]
    cmp r0, #0x0
    bgt .L_022027d0
    ldr r1, [r4, #0x1bc]
    add r0, r4, #0x154
    add r1, r1, #0x1
    str r1, [r4, #0x1bc]
    ldr r2, [r4, #0x48]
    mov r3, #0x2
    add r1, r4, #0xa4
    str r3, [r2, #0x1ec]
    bl func_ov042_021fda0c
    mov r2, #0x0
    ldr r0, .L_02202dfc
    str r2, [r4, #0x1c4]
    ldr r0, [r0, #0x0]
    mov r1, #0xe1
    bl Sound_StopDirectSequence
    b .L_022027d0
.L_02202634:
    add r1, r0, #0x1
    ldr r0, .L_02202e34
    str r1, [r4, #0x1bc]
    cmp r1, r0
    bge .L_022026d8
    tst r1, #0x3
    bne .L_022026ac
    add r0, sp, #0xa8
    add r1, r4, #0xa4
    bl func_ov042_02203658
    bl genrand_int32
    and r0, r0, #0x3f
    ldr r1, [sp, #0xac]
    sub r0, r0, #0x20
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0xac]
    bl genrand_int32
    and r0, r0, #0x3f
    ldr r2, [sp, #0xb0]
    sub r0, r0, #0x20
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0xb0]
    ldr r0, [r4, #0x48]
    ldr r3, [r4, #0x1bc]
    ldr r0, [r0, #0x14]
    mov r3, r3, asr #0x3
    mov r1, #0x1
    add r2, sp, #0xa8
    and r3, r3, #0x3
    bl func_ov042_021fda24
.L_022026ac:
    ldr r0, [r4, #0x1bc]
    tst r0, #0xf
    bne .L_022026d8
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r0, .L_02202dfc
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02202e38
    mov r3, #0x7f
    bl func_020593ac
.L_022026d8:
    ldr r0, [r4, #0x158]
    cmp r0, #0x1000
    subgt r0, r0, #0x1000
    strgt r0, [r4, #0x158]
    mov r0, #0x1000
    ldr r1, [r4, #0x158]
    rsb r0, r0, #0x0
    cmp r1, r0
    addlt r0, r1, #0x1000
    strlt r0, [r4, #0x158]
    mov r0, #0x71000
    ldr r1, [r4, #0x15c]
    rsb r0, r0, #0x0
    cmp r1, r0
    subgt r0, r1, #0x33
    subgt r0, r0, #0x1300
    strgt r0, [r4, #0x15c]
    mov r0, #0x73000
    ldr r1, [r4, #0x15c]
    rsb r0, r0, #0x0
    cmp r1, r0
    addlt r0, r1, #0x33
    addlt r0, r0, #0x1300
    strlt r0, [r4, #0x15c]
    ldr r0, [r4, #0x1bc]
    cmp r0, #0x118
    bne .L_02202754
    ldr r0, .L_02202dfc
    mov r1, #0x1d
    ldr r0, [r0, #0x0]
    bl func_020594ec
.L_02202754:
    ldr r0, [r4, #0x1bc]
    cmp r0, #0x12c
    bne .L_0220276c
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x8]
    bl func_ov071_02210540
.L_0220276c:
    ldr r1, [r4, #0x1bc]
    ldr r0, .L_02202e3c
    cmp r1, r0
    ldreq r0, [r4, #0x48]
    moveq r1, #0x8
    streq r1, [r0, #0x1c8]
    bl genrand_int32
    mov r1, #0xa
    bl func_020bf1f8
    ldr r2, [r4, #0x158]
    sub r0, r1, #0x5
    add r0, r2, r0, lsl #0xc
    str r0, [r4, #0xa8]
    bl genrand_int32
    mov r1, #0xa
    bl func_020bf1f8
    ldr r2, [r4, #0x15c]
    sub r1, r1, #0x5
    add r1, r2, r1, lsl #0xc
    str r1, [r4, #0xac]
    ldr r0, .L_02202dfc
    ldr r1, .L_02202e00
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_0205940c
.L_022027d0:
    ldr r2, [r4, #0x4c]
    ldr r0, [r4, #0x48]
    add r1, r4, #0xa4
    add r2, r2, #0x2c
    mov r3, #0x52
    bl func_020a1794
    add r0, sp, #0x9c
    bl func_ov042_021fcf80
    ldr r0, [r4, #0x4c]
    ldr r3, .L_02202e40
    ldr r0, [r0, #0x30]
    add r1, sp, #0x9c
    str r0, [sp, #0xa0]
    ldr r2, [r4, #0x4c]
    mov r0, r4
    ldr r2, [r2, #0x34]
    sub r2, r2, #0x5a000
    str r2, [sp, #0xa4]
    ldr r2, [r4, #0xe0]
    bl func_ov042_022009a0
    b .L_0220362c
.L_02202824:
    cmp r0, #0x0
    beq .L_02202850
    add r0, r0, #0x1
    str r0, [r4, #0x1b0]
    cmp r0, #0x1e
    bne .L_02202850
    ldr r0, [r4, #0x48]
    ldr r1, .L_02202e44
    bl func_020a1ec0
    mov r0, #0x0
    str r0, [r4, #0x1b0]
.L_02202850:
    ldr r0, [r4, #0x1bc]
    cmp r0, #0x0
    bne .L_02202864
    mov r0, r4
    bl func_ov042_02200bc0
.L_02202864:
    ldr r0, [r4, #0xa0]
    bl func_ov042_0220549c
    mov r0, #0x4
    sub r5, r0, #0x1
.L_02202874:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x68]
    bl func_ov042_022080f0
    subs r5, r5, #0x1
    bpl .L_02202874
    mov r0, #0x3
    sub r5, r0, #0x1
.L_02202890:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x78]
    bl func_ov042_02208aac
    subs r5, r5, #0x1
    bpl .L_02202890
    mov r0, #0x2
    ldr r5, [r4, #0x1ec]
    sub r6, r0, #0x1
.L_022028b0:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x84]
    bl func_ov042_02209360
    subs r6, r6, #0x1
    bpl .L_022028b0
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    beq .L_02202918
    cmp r5, #0x0
    bne .L_022028e8
    ldr r0, [r4, #0x48]
    ldr r1, .L_02202e48
    bl func_020a1ec0
    b .L_02202918
.L_022028e8:
    cmp r5, r0
    bne .L_02202918
    ldr r0, .L_02202dfc
    ldr r1, .L_02202e4c
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl func_0205940c
    ldr r0, [r4, #0x48]
    ldr r1, .L_02202e50
    bl func_020a1ec0
    mov r0, #0x0
    str r0, [r4, #0x1ec]
.L_02202918:
    ldr r0, [r4, #0x16c]
    cmp r0, #0x0
    blt .L_02202aac
    add r0, sp, #0x18
    add r1, r4, #0x160
    bl func_ov042_02203658
    mov r3, #0x0
    str r3, [sp, #0x0]
    ldr r0, [r4, #0x48]
    add r1, sp, #0x18
    ldr r0, [r0, #0x8]
    mov r2, #0x64000
    ldr r0, [r0, #0xe8]
    bl func_ov071_02211a10
    ldr r0, [r4, #0x16c]
    cmp r0, #0x0
    bne .L_022029f8
    ldr r1, [r4, #0x164]
    ldr r0, .L_02202e54
    rsb r2, r1, #0x0
    mov r1, #0x0
    umull r5, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r2, r5, #0x800
    mov r0, #0x800
    adc r1, r3, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    sub r1, r0, #0x4800
    cmp r2, r1
    ldr r0, .L_02202e58
    movlt r2, r1
    cmp r2, r0
    movgt r2, r0
    ldr r0, [r4, #0x164]
    adds r0, r0, r2
    str r0, [r4, #0x164]
    bpl .L_022029ec
    mov r0, #0x0
    str r0, [r4, #0x164]
    ldr r0, [r4, #0x16c]
    mov r1, #0x4
    add r0, r0, #0x1
    str r0, [r4, #0x16c]
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x58]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
.L_022029ec:
    mov r0, #0x1
    str r0, [r4, #0xd0]
    b .L_02202aac
.L_022029f8:
    cmp r0, #0x2
    bne .L_02202a74
    ldr r2, [r4, #0x164]
    mov r0, #0x800
    mov r1, r2, asr #0x1f
    mov r1, r1, lsl #0xa
    adds r3, r0, r2, lsl #0xa
    orr r1, r1, r2, lsr #0x16
    adc r1, r1, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    sub r1, r0, #0x5800
    cmp r2, r1
    movlt r2, r1
    ldr r0, .L_02202e58
    ldr r1, [r4, #0x164]
    cmp r2, r0
    movgt r2, r0
    mov r0, #0x1c0000
    add r1, r1, r2
    rsb r0, r0, #0x0
    str r1, [r4, #0x164]
    cmp r1, r0
    bge .L_02202aac
    mov r0, r0, asr #0x15
    str r0, [r4, #0x16c]
    ldr r1, [r4, #0x58]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_02202aac
.L_02202a74:
    ble .L_02202aac
    add r0, r0, #0x1
    str r0, [r4, #0x16c]
    ldr r1, [r4, #0x58]
    tst r0, #0x2
    ldrneh r0, [r1, #0x42]
    bicne r0, r0, #0x4
    ldreqh r0, [r1, #0x42]
    orreq r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r4, #0x16c]
    cmp r0, #0x28
    mvnge r0, #0x0
    strge r0, [r4, #0x16c]
.L_02202aac:
    ldr r2, [r4, #0x4c]
    ldr r0, [r4, #0x48]
    add r1, r4, #0xa4
    add r2, r2, #0x2c
    mov r3, #0x0
    bl func_020a1794
    ldr r2, [r4, #0x58]
    ldr r0, [r4, #0x48]
    add r1, r4, #0x160
    add r2, r2, #0x2c
    mov r3, #0x0
    bl func_020a1794
    ldr r2, [r4, #0x4c]
    ldr r0, [r4, #0x19c]
    ldr r1, [r2, #0x30]
    mov ip, #0x0
    add r0, r1, r0
    str r0, [r2, #0x30]
    ldr r2, [r4, #0x4c]
    ldr r0, [r4, #0x1a0]
    ldr r1, [r2, #0x34]
    ldr r3, .L_02202e5c
    add r0, r1, r0
    str r0, [r2, #0x34]
    ldr r6, [r4, #0x180]
    mov r5, #0x800
    umull r0, r1, r6, r3
    adds r2, r0, #0x800
    mla r1, r6, ip, r1
    mov r0, r6, asr #0x1f
    mla r1, r0, r3, r1
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r6, r1
    str r0, [r4, #0x180]
    ldr r7, [r4, #0x184]
    sub r1, ip, #0xa
    umull r0, r2, r7, r3
    adds r0, r0, #0x800
    mov r6, r0, lsr #0xc
    mov r0, r7, asr #0x1f
    mla r2, r7, ip, r2
    mla r2, r0, r3, r2
    adc r0, r2, #0x0
    orr r6, r6, r0, lsl #0x14
    sub r0, r7, r6
    str r0, [r4, #0x184]
    ldr r0, [r4, #0x50]
    ldr r6, [r4, #0x174]
    ldr r2, [r0, #0x30]
    ldr r0, [r0, #0x34]
    sub r6, r6, r2
    ldr r2, [r4, #0x178]
    ldr r7, [r4, #0x180]
    sub r0, r2, r0
    mov r2, r6, asr #0x1f
    mov r2, r2, lsl #0xa
    orr r2, r2, r6, lsr #0x16
    adds r6, r5, r6, lsl #0xa
    adc r2, r2, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r2, lsl #0x14
    add r2, r7, r6
    str r2, [r4, #0x180]
    ldr r7, [r4, #0x184]
    mov r2, r0, asr #0x1f
    mov r2, r2, lsl #0xa
    orr r2, r2, r0, lsr #0x16
    adds r6, r5, r0, lsl #0xa
    adc r0, r2, #0x0
    mov r2, r6, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r0, r7, r2
    str r0, [r4, #0x184]
    ldr r6, [r4, #0x50]
    ldr r0, [r4, #0x180]
    ldr r2, [r6, #0x30]
    add r0, r2, r0
    str r0, [r6, #0x30]
    ldr r6, [r4, #0x50]
    ldr r0, [r4, #0x184]
    ldr r2, [r6, #0x34]
    add r0, r2, r0
    str r0, [r6, #0x34]
    ldr r0, [r4, #0x50]
    str r1, [r0, #0x44]
    ldr r0, [r4, #0x190]
    umull r2, r1, r0, r3
    mla r1, r0, ip, r1
    mov r6, r0
    mov r0, r0, asr #0x1f
    mla r1, r0, r3, r1
    adds r2, r2, r5
    adc r0, r1, ip
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r6, r1
    str r0, [r4, #0x190]
    ldr r7, [r4, #0x194]
    add r0, r4, #0x198
    umull r1, r2, r7, r3
    adds r6, r1, r5
    mla r2, r7, ip, r2
    mov r1, r7, asr #0x1f
    mla r2, r1, r3, r2
    adc r1, r2, ip
    mov r2, r6, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    sub r1, r7, r2
    str r1, [r4, #0x194]
    ldr r6, [r4, #0x54]
    ldr r1, [r4, #0x190]
    ldr r2, [r6, #0x30]
    ldr r6, [r6, #0x34]
    rsb r7, r2, #0x0
    rsb r2, r6, #0x0
    mov r6, r7, asr #0x1f
    mov r6, r6, lsl #0xa
    orr r6, r6, r7, lsr #0x16
    adds r7, r5, r7, lsl #0xa
    adc r6, r6, ip
    mov r7, r7, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    add r1, r1, r7
    str r1, [r4, #0x190]
    mov r1, r2, asr #0x1f
    mov r1, r1, lsl #0xa
    orr r1, r1, r2, lsr #0x16
    adds r2, r5, r2, lsl #0xa
    ldr r6, [r4, #0x194]
    adc r1, r1, ip
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, r6, r2
    str r1, [r4, #0x194]
    ldr r7, [r4, #0x54]
    ldr r2, [r4, #0x190]
    ldr r6, [r7, #0x30]
    add r1, r4, #0x1a4
    add r2, r6, r2
    str r2, [r7, #0x30]
    ldr r7, [r4, #0x54]
    ldr r2, [r4, #0x194]
    ldr r6, [r7, #0x34]
    add r2, r6, r2
    str r2, [r7, #0x34]
    ldr r8, [r4, #0x1a8]
    umull r7, r6, r8, r3
    adds r7, r7, r5
    mla r6, r8, ip, r6
    mov r2, r8, asr #0x1f
    mla r6, r2, r3, r6
    mov r7, r7, lsr #0xc
    adc r2, r6, ip
    orr r7, r7, r2, lsl #0x14
    sub r2, r8, r7
    str r2, [r4, #0x1a8]
    ldr r8, [r4, #0x1ac]
    umull r7, r6, r8, r3
    adds r7, r7, r5
    mla r6, r8, ip, r6
    mov r2, r8, asr #0x1f
    mla r6, r2, r3, r6
    mov r7, r7, lsr #0xc
    adc r2, r6, ip
    orr r7, r7, r2, lsl #0x14
    sub r2, r8, r7
    str r2, [r4, #0x1ac]
    ldr lr, [r4, #0x19c]
    ldr r3, [r4, #0x1a0]
    rsb r7, lr, #0x0
    mov lr, r7, asr #0x1f
    mov lr, lr, lsl #0xa
    rsb r3, r3, #0x0
    adds r8, r5, r7, lsl #0xa
    orr lr, lr, r7, lsr #0x16
    mov r6, r3, asr #0x1f
    adc r7, lr, ip
    mov r8, r8, lsr #0xc
    mov r6, r6, lsl #0xa
    ldr r2, [r4, #0x1a8]
    orr r8, r8, r7, lsl #0x14
    add r2, r2, r8
    adds r5, r5, r3, lsl #0xa
    orr r6, r6, r3, lsr #0x16
    str r2, [r4, #0x1a8]
    adc r2, r6, ip
    mov r3, r5, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    ldr r2, [r4, #0x1ac]
    add r2, r2, r3
    str r2, [r4, #0x1ac]
    bl func_ov042_021ff2f8
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    ldrb r0, [r0, #0x38]
    cmp r0, #0x4
    bne .L_02202e68
    mov r1, #0x21000
    rsb r1, r1, #0x0
    ldr r0, [r4, #0x50]
    sub r2, r1, #0xb000
    str r1, [r0, #0x30]
    ldr r0, [r4, #0x50]
    mov r1, #0x5
    str r2, [r0, #0x34]
    ldr r0, [r4, #0x50]
    str r1, [r0, #0x44]
    b .L_02202eb4
.L_02202df4: .word 0xb480
.L_02202df8: .word 0x1333
.L_02202dfc: .word gSoundContext
.L_02202e00: .word 0x16b
.L_02202e04: .word 0x3de00
.L_02202e08: .word data_ov042_0220b500
.L_02202e0c: .word 0xfffa5400
.L_02202e10: .word 0xfff73100
.L_02202e14: .word 0x5ac00
.L_02202e18: .word 0xfffc2200
.L_02202e1c: .word 0x8cf00
.L_02202e20: .word 0x1d6
.L_02202e24: .word 0xfff
.L_02202e28: .word data_ov042_0220ac78
.L_02202e2c: .word 0xb580
.L_02202e30: .word data_ov042_0220aca8
.L_02202e34: .word 0x109
.L_02202e38: .word 0x169
.L_02202e3c: .word 0x13b
.L_02202e40: .word 0x582
.L_02202e44: .word 0xeb8f
.L_02202e48: .word 0xeb87
.L_02202e4c: .word 0x1d7
.L_02202e50: .word 0xeb88
.L_02202e54: .word 0x333
.L_02202e58: .word 0xfffffe66
.L_02202e5c: .word 0x171
.L_02202e60: .word data_ov042_0220ae0c
.L_02202e64: .word data_ov042_0220ac84
.L_02202e68:
    cmp r0, #0x5
    bne .L_02202eb4
    ldr r1, [r4, #0x188]
    ldr r3, .L_02202e60
    ldr r0, [r4, #0x50]
    ldr r2, [r3, r1, lsl #0x2]
    mov r1, #0x5
    str r2, [r0, #0x30]
    ldr r2, [r4, #0x188]
    ldr r0, [r4, #0x50]
    add r2, r2, #0x1
    ldr r2, [r3, r2, lsl #0x2]
    str r2, [r0, #0x34]
    ldr r0, [r4, #0x50]
    str r1, [r0, #0x44]
    ldr r0, [r4, #0x188]
    cmp r0, #0x14
    addlt r0, r0, #0x2
    strlt r0, [r4, #0x188]
.L_02202eb4:
    ldr r2, [r4, #0x150]
    cmp r2, #0x0
    blt .L_02202f40
    ldr r0, [r4, #0x1bc]
    cmp r0, #0x0
    ldreq r0, .L_02202e64
    ldreq r1, [r4, #0x1b8]
    ldreq r0, [r0, r2, lsl #0x2]
    andeq r0, r1, r0
    cmpeq r0, #0x1
    bne .L_02202f40
    add r0, sp, #0x90
    bl func_ov042_021fcf80
    ldr r0, [r4, #0xa8]
    str r0, [sp, #0x94]
    ldr r0, [r4, #0xac]
    str r0, [sp, #0x98]
    bl genrand_int32
    mov r1, #0x5a
    bl func_020bf1f8
    ldr r2, [sp, #0x94]
    sub r0, r1, #0x2d
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x94]
    bl genrand_int32
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0xf
    ldr r1, [sp, #0x98]
    add r0, r0, #0x96000
    sub r0, r1, r0
    str r0, [sp, #0x98]
    ldr r0, [r4, #0x48]
    add r1, sp, #0x90
    ldr r0, [r0, #0x14]
    bl func_ov042_021fe2f0
.L_02202f40:
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x1c8]
    cmp r0, #0x2
    bne .L_02202f8c
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x50]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x29000
    rsb r0, r0, #0x0
    str r0, [r4, #0x178]
    ldr r1, [r4, #0x48]
    ldr r0, [r1, #0x1c8]
    add r0, r0, #0x1
    str r0, [r1, #0x1c8]
.L_02202f8c:
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x1c8]
    cmp r0, #0x1
    beq .L_022035f4
    ldr r0, [r4, #0x1bc]
    cmp r0, #0x0
    bne .L_02203430
    ldr r0, [r4, #0xe4]
    cmp r0, #0x0
    bne .L_02202ff0
    ldr r0, [r4, #0x74]
    ldr r0, [r0, #0x74]
    cmp r0, #0x64
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x1
    bne .L_02202ff0
    ldr r1, [r4, #0xe4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0xe4]
    str r0, [r4, #0x150]
    str r0, [r4, #0xbc]
    str r0, [r4, #0xd0]
    str r0, [r4, #0xcc]
.L_02202ff0:
    add r0, sp, #0xc
    add r1, r4, #0xa4
    bl func_ov042_02203658
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x48]
    add r1, sp, #0xc
    ldr r0, [r0, #0x8]
    mov r2, #0x64000
    ldr r0, [r0, #0xe8]
    mov r3, #0x7
    bl func_ov071_02211a10
    cmp r0, #0x0
    ble .L_02203328
    ldr r5, [r4, #0xe0]
    sub r0, r5, r0
    str r0, [r4, #0xe0]
    cmp r0, #0x0
    bgt .L_022031ac
    mov r0, #0x0
    str r0, [r4, #0xe0]
    mov r1, #0x1
    str r1, [r4, #0x1c0]
    str r1, [r4, #0x1bc]
    ldr r0, .L_02202dfc
    rsb r1, r1, #0x16c
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_0205940c
    ldr r0, [r4, #0xa0]
    bl func_ov042_02205180
    mov r0, #0x4
    sub r5, r0, #0x1
.L_02203074:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x68]
    bl func_ov042_022080d4
    subs r5, r5, #0x1
    bpl .L_02203074
    mov r0, #0x3
    sub r5, r0, #0x1
.L_02203090:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x78]
    bl func_ov042_02208a90
    subs r5, r5, #0x1
    bpl .L_02203090
    mov r0, #0x2
    sub r5, r0, #0x1
.L_022030ac:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x84]
    bl func_ov042_02209344
    subs r5, r5, #0x1
    bpl .L_022030ac
    ldr r0, [r4, #0x16c]
    ldr r1, .L_02203634
    cmp r0, #0x0
    movge r0, #0x3
    strge r0, [r4, #0x16c]
    ldr r0, [r4, #0x48]
    add r3, r1, #0x2
    ldr r2, [r0, #0x0]
    mov r0, #0x1
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x50]
    add r2, r1, #0x1
    bl func_0209a0d8
    ldr r0, [r4, #0x50]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x50]
    mov r1, #0x7
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x50]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x50]
    mov r1, #0x0
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r4, #0x4c]
    mov r2, #0x0
    ldrh r1, [r3, #0x42]
    sub r0, r2, #0x46000
    orr r1, r1, #0x4
    strh r1, [r3, #0x42]
    ldr r3, [r4, #0x54]
    ldrh r1, [r3, #0x42]
    orr r1, r1, #0x4
    strh r1, [r3, #0x42]
    str r2, [r4, #0xa8]
    str r0, [r4, #0xac]
    str r2, [r4, #0xb8]
    str r2, [r4, #0xb4]
    ldr r1, [r4, #0x174]
    ldr r0, [r4, #0x50]
    str r1, [r0, #0x30]
    ldr r1, [r4, #0x178]
    ldr r0, [r4, #0x50]
    str r1, [r0, #0x34]
    str r2, [r4, #0x184]
    str r2, [r4, #0x180]
    b .L_02203328
.L_022031ac:
    ldr r0, [r4, #0xd0]
    cmp r0, #0x0
    ldreq r0, [r4, #0x4c]
    ldreq r0, [r0, #0xc]
    ldreqb r1, [r0, #0x38]
    cmpeq r1, #0x0
    bne .L_022031e4
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_022031e4:
    ldr r0, [r4, #0x50]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x0
    bne .L_02203304
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x50]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r2, r1, lsl #0x1
    ldr lr, .L_02203638
    mov r0, r0, lsl #0x1
    ldrsh r3, [lr, r0]
    mov r0, #0x6
    ldr ip, [r4, #0x50]
    smulbb r6, r3, r0
    str r6, [ip, #0x30]
    ldrsh r3, [lr, r2]
    ldr ip, [r4, #0x178]
    ldr r2, [r4, #0x50]
    smlabb r0, r3, r0, ip
    mov r1, #0x0
    str r0, [r2, #0x34]
    str r1, [r4, #0x184]
    str r1, [r4, #0x180]
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov ip, r0, lsl #0x1
    add r1, ip, #0x1
    ldr r2, .L_02203638
    mov r1, r1, lsl #0x1
    ldrsh r3, [r2, r1]
    mov r1, ip, lsl #0x1
    ldrsh r2, [r2, r1]
    ldr r1, [r4, #0x54]
    mov r3, r3, lsl #0x1
    str r3, [r1, #0x30]
    ldr r1, [r4, #0x54]
    add r2, r2, r2, lsl #0x1
    mov r0, #0x0
    str r2, [r1, #0x34]
    str r0, [r4, #0x194]
    str r0, [r4, #0x190]
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov ip, r0, lsl #0x1
    add r1, ip, #0x1
    mov r2, r1, lsl #0x1
    ldr r3, .L_02203638
    mov r1, ip, lsl #0x1
    ldrsh r2, [r3, r2]
    ldrsh r1, [r3, r1]
    mov r0, #0x0
    mov r2, r2, lsl #0x1
    str r2, [r4, #0x19c]
    mov r1, r1, lsl #0x1
    str r1, [r4, #0x1a0]
    str r0, [r4, #0x1ac]
    str r0, [r4, #0x1a8]
.L_02203304:
    ldr r0, .L_0220363c
    cmp r5, r0
    blt .L_02203320
    ldr r1, [r4, #0xe0]
    cmp r1, r0
    movlt r0, #0x0
    strlt r0, [r4, #0xe4]
.L_02203320:
    mov r0, #0x5a
    str r0, [r4, #0xe8]
.L_02203328:
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0xc]
    ldrb r0, [r1, #0x38]
    cmp r0, #0x1
    bne .L_022033e8
    ldrh r0, [r1, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_022033e8
    ldr r0, .L_02203640
    add r3, sp, #0x84
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r0, [r4, #0xe0]
    mov r1, #0xfa
    bl func_020befec
    rsb r5, r0, #0x2
    cmp r5, #0x2
    movgt r5, #0x2
    cmp r5, #0x0
    blt .L_022033c4
    add r1, sp, #0x84
    ldr r0, [r4, #0xc4]
    ldr r6, [r1, r5, lsl #0x2]
    cmp r0, r6
    beq .L_022033b4
    mov r0, r4
    mov r1, r6
    bl func_ov042_02200658
    mov r0, #0x0
    str r0, [r4, #0xbc]
    ldr r0, [r4, #0x48]
    ldr r1, .L_02203644
    bl func_020a1ec0
.L_022033b4:
    str r6, [r4, #0xc4]
    ldr r0, [r4, #0xe4]
    cmp r0, #0x0
    strlt r5, [r4, #0x150]
.L_022033c4:
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_022033e8:
    ldr r0, [r4, #0x50]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x1
    bne .L_022035f4
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_022035f4
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x50]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_022035f4
.L_02203430:
    add r2, r0, #0x1
    str r2, [r4, #0x1bc]
    cmp r2, #0xf0
    blt .L_022035f4
    mov r0, #0x0
    str r0, [r4, #0x1c0]
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    str r1, [r0, #0x1ec]
    cmp r2, #0x190
    bge .L_022034e8
    sub r0, r2, #0xf0
    mov r1, #0x6e
    mul r1, r0, r1
    mov r1, r1, lsl #0x10
    ldr r2, .L_02203648
    mov r3, r1, lsr #0x10
    cmp r2, r1, lsr #0x10
    bhs .L_022034a4
    ldr r1, [r4, #0x50]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r4, #0x50]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    b .L_022035f4
.L_022034a4:
    mov r2, r3, asr #0x4
    ldr r1, .L_02203638
    mov r2, r2, lsl #0x2
    ldrsh r1, [r1, r2]
    mov r2, #0x398
    ldr r3, [r4, #0x50]
    mov r1, r1, asr #0x4
    rsb r1, r1, #0x100
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    strh r1, [r3, #0x3c]
    strh r1, [r3, #0x3e]
    ldr r1, [r4, #0x50]
    mul r2, r0, r2
    ldr r0, [r1, #0xc]
    strh r2, [r0, #0x30]
    b .L_022035f4
.L_022034e8:
    ldr r0, .L_0220364c
    cmp r2, r0
    bne .L_02203508
    str r1, [r4, #0x23c]
    ldr r0, [r4, #0x48]
    ldr r1, .L_02203650
    bl func_020a1ec0
    b .L_022035f4
.L_02203508:
    add r0, r0, #0x64
    cmp r2, r0
    bne .L_022035f4
    mov r0, #0x2
    sub r6, r0, #0x1
    mov r5, #0x0
.L_02203520:
    add r0, r4, r6, lsl #0x2
    ldr r7, [r0, #0x84]
    cmp r7, #0x0
    beq .L_0220354c
    beq .L_02203544
    mov r0, r7
    bl func_ov042_02209128
    mov r0, r7
    bl Heap_Free
.L_02203544:
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x84]
.L_0220354c:
    subs r6, r6, #0x1
    bpl .L_02203520
    mov r0, #0x3
    sub r6, r0, #0x1
    mov r5, #0x0
.L_02203560:
    add r0, r4, r6, lsl #0x2
    ldr r7, [r0, #0x78]
    cmp r7, #0x0
    beq .L_0220358c
    beq .L_02203584
    mov r0, r7
    bl func_ov042_02208894
    mov r0, r7
    bl Heap_Free
.L_02203584:
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x78]
.L_0220358c:
    subs r6, r6, #0x1
    bpl .L_02203560
    mov r0, #0x4
    sub r6, r0, #0x1
    mov r5, #0x0
.L_022035a0:
    add r0, r4, r6, lsl #0x2
    ldr r7, [r0, #0x68]
    cmp r7, #0x0
    beq .L_022035cc
    beq .L_022035c4
    mov r0, r7
    bl func_ov042_02207ef0
    mov r0, r7
    bl Heap_Free
.L_022035c4:
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x68]
.L_022035cc:
    subs r6, r6, #0x1
    bpl .L_022035a0
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x14]
    bl func_ov042_021fea78
    mov r0, r4
    mov r1, #0x4
    bl func_ov042_02200658
    mov r0, r4
    bl func_ov042_02205cb8
.L_022035f4:
    add r0, sp, #0x78
    bl func_ov042_021fcf80
    ldr r0, [r4, #0x4c]
    ldr r3, .L_02203654
    ldr r0, [r0, #0x30]
    add r1, sp, #0x78
    str r0, [sp, #0x7c]
    ldr r2, [r4, #0x4c]
    mov r0, r4
    ldr r2, [r2, #0x34]
    sub r2, r2, #0x60000
    str r2, [sp, #0x80]
    ldr r2, [r4, #0xe0]
    bl func_ov042_022009a0
.L_0220362c:
    add sp, sp, #0x15c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02203634: .word 0x12eb
.L_02203638: .word data_020c9670
.L_0220363c: .word 0x2ee
.L_02203640: .word data_ov042_0220ac9c
.L_02203644: .word 0xeb8e
.L_02203648: .word 0x3a98
.L_0220364c: .word 0x19a
.L_02203650: .word 0xb482
.L_02203654: .word 0x352
.size func_ov042_02201f30, . - func_ov042_02201f30

