.text
.extern func_020adc40
.extern func_020adc90
.extern func_02072b68
.extern func_020a1ec0
.extern func_ov042_021fcf80
.extern func_ov042_021ff2f8
.extern func_ov042_02207f58
.extern func_ov042_022088fc
.extern func_ov042_022089e8
.extern func_ov042_022091f4
.extern data_ov042_0220ac90
.extern data_ov042_0220ae64
.extern data_ov042_0220b018
.extern data_ov042_0220b0ac
    .global func_ov042_02200bc0
func_ov042_02200bc0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x248
    mov r4, r0
    add r0, sp, #0xc
    bl func_ov042_021fcf80
    mov lr, #0x0
    mov r9, #0xa
    sub r1, lr, #0x50
    add r8, sp, #0x228
    add r10, sp, #0x200
    sub r3, r9, #0x46
    add ip, sp, #0x208
    sub r6, lr, #0x56
    add r7, sp, #0x1f8
    add r0, sp, #0x230
    mov r5, #0x50
    add r2, sp, #0x210
    str r1, [sp, #0x1f4]
    str r1, [r8, #0x0]
    sub r1, lr, #0xa
    str r1, [r7, #0x0]
    sub r1, r9, #0x78
    str r3, [r8, #0x4]
    str r6, [r7, #0x4]
    str r6, [r10, #0x4]
    str r9, [r10, #0x0]
    sub r8, r9, #0x50
    add r10, sp, #0x218
    sub r9, r9, #0x1e
    str r8, [r10, #0x0]
    add r8, sp, #0x220
    str r9, [r10, #0x4]
    mov r10, #0x46
    add r7, sp, #0x240
    mov r6, #0x5a
    str r10, [r8, #0x0]
    str r9, [r8, #0x4]
    add r10, sp, #0x238
    sub r9, r5, #0xaa
    sub r8, r5, #0xb4
    str r5, [r0, #0x0]
    str r3, [r0, #0x4]
    ldr r5, .L_02201210
    str lr, [sp, #0x1f0]
    add r0, sp, #0x0
    str r3, [ip, #0x4]
    str lr, [ip, #0x0]
    str lr, [r2, #0x0]
    str r1, [r2, #0x4]
    str r9, [r10, #0x0]
    str r8, [r10, #0x4]
    str r6, [r7, #0x0]
    str r1, [r7, #0x4]
    mov r2, #0x6
.L_02200c98:
    ldrh r1, [r5], #0x2
    subs r2, r2, #0x1
    strh r1, [r0], #0x2
    bne .L_02200c98
    ldr r3, .L_02201214
    add r2, sp, #0x190
    mov r1, #0x30
.L_02200cb4:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02200cb4
    ldr r3, .L_02201218
    add r2, sp, #0xfc
    mov r1, #0x4a
.L_02200cd0:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02200cd0
    ldr r3, .L_0220121c
    add r2, sp, #0x18
    mov r1, #0x72
.L_02200cec:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02200cec
    ldr r0, [r4, #0x150]
    add r1, sp, #0x190
    cmp r0, #0x0
    addlt r1, sp, #0x0
    blt .L_02200d24
    cmp r0, #0x1
    addeq r1, sp, #0xfc
    beq .L_02200d24
    cmp r0, #0x2
    addeq r1, sp, #0x18
.L_02200d24:
    ldr r0, [r4, #0xc0]
    sub r0, r0, #0x1
    str r0, [r4, #0xc0]
    cmp r0, #0x0
    bgt .L_02200ddc
    ldr r2, [r4, #0xbc]
    mov r0, #0x0
    mov r2, r2, lsl #0x1
    ldrh r2, [r1, r2]
    add r7, sp, #0x1f0
    add r6, sp, #0x1f4
    and r2, r2, #0xf
    str r2, [r4, #0xc8]
    ldr r2, [r4, #0xbc]
    mov r5, #0x3e8
    mov r2, r2, lsl #0x1
    ldrh r2, [r1, r2]
    ldr r3, .L_02201220
    mov r2, r2, lsl #0xc
    mov r2, r2, lsr #0x10
    str r2, [r4, #0xcc]
    str r0, [r4, #0xd0]
    ldr r2, [r4, #0xc8]
    ldr r2, [r7, r2, lsl #0x3]
    mov r2, r2, lsl #0xc
    str r2, [r4, #0x158]
    ldr r2, [r4, #0xc8]
    ldr r2, [r6, r2, lsl #0x3]
    mov r2, r2, lsl #0xc
    str r2, [r4, #0x15c]
    str r5, [r4, #0xc0]
    ldr r2, [r4, #0xbc]
    add r2, r2, #0x1
    str r2, [r4, #0xbc]
    mov r2, r2, lsl #0x1
    ldrh r1, [r1, r2]
    cmp r1, r3
    streq r0, [r4, #0xbc]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x1c8]
    cmp r0, #0x0
    beq .L_02200ddc
    ldr r0, [r4, #0xbc]
    cmp r0, #0x4
    movge r0, #0x0
    strge r0, [r4, #0xbc]
.L_02200ddc:
    ldr r3, [r4, #0x158]
    ldr r2, [r4, #0xa8]
    ldr r1, [r4, #0x15c]
    ldr r0, [r4, #0xac]
    sub r5, r3, r2
    sub r6, r1, r0
    smull r0, r2, r5, r5
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
    bl func_020adc40
    ldr r9, [r4, #0xb4]
    ldr r2, .L_02201224
    mov r3, #0x0
    umull r1, r7, r9, r2
    adds r8, r1, #0x800
    mla r7, r9, r3, r7
    mov r1, r9, asr #0x1f
    mla r7, r1, r2, r7
    adc r1, r7, #0x0
    mov r7, r8, lsr #0xc
    orr r7, r7, r1, lsl #0x14
    sub r1, r9, r7
    str r1, [r4, #0xb4]
    ldr r1, [r4, #0xb8]
    mov r7, r0
    umull r0, r8, r1, r2
    mla r8, r1, r3, r8
    adds r0, r0, #0x800
    mov r3, r0, lsr #0xc
    mov r0, r1, asr #0x1f
    mla r8, r0, r2, r8
    adc r0, r8, #0x0
    orr r3, r3, r0, lsl #0x14
    sub r0, r1, r3
    str r0, [r4, #0xb8]
    ldr r0, [r4, #0xd0]
    cmp r0, #0x0
    bne .L_02201028
    cmp r7, #0x0
    ble .L_02200f28
    mov r0, r5
    mov r1, r7
    bl func_020adc90
    mov r1, #0xa4
    umull r5, r3, r0, r1
    mov r2, #0x0
    adds r5, r5, #0x800
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r1, r5, lsr #0xc
    ldr r2, [r4, #0xb4]
    orr r1, r1, r0, lsl #0x14
    add r2, r2, r1
    mov r0, r6
    mov r1, r7
    str r2, [r4, #0xb4]
    bl func_020adc90
    mov r1, #0xa4
    umull r5, r3, r0, r1
    mov r2, #0x0
    adds r5, r5, #0x800
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r1, r5, lsr #0xc
    ldr r2, [r4, #0xb8]
    orr r1, r1, r0, lsl #0x14
    add r1, r2, r1
    add r0, r4, #0xa4
    str r1, [r4, #0xb8]
    add r1, r4, #0xb0
    bl func_ov042_021ff2f8
.L_02200f28:
    cmp r7, #0x5000
    bgt .L_02201208
    ldr r0, [r4, #0xcc]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0xc0]
    beq .L_02201208
    mov r1, #0x1
    str r1, [r4, #0xd0]
    ldr r0, [r4, #0xcc]
    subs r5, r0, #0x1
    bne .L_02200f88
    ldr r0, [r4, #0x150]
    cmp r0, #0x0
    bge .L_02200fd4
    ldr r0, [r4, #0x74]
    ldr r0, [r0, #0x74]
    cmp r0, #0x64
    movlt r1, #0x0
    cmp r1, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0xc0]
    subeq r5, r0, #0x1
    b .L_02200fd4
.L_02200f88:
    cmp r5, #0x1
    bne .L_02200fd4
    ldr r6, [r4, #0x58]
    mov r2, #0x0
    ldrh r3, [r6, #0x42]
    ldr r1, .L_02201228
    mov r0, #0x3
    bic r3, r3, #0x4
    strh r3, [r6, #0x42]
    str r2, [r4, #0x16c]
    str r1, [r4, #0x164]
    sub r6, r0, #0x1
.L_02200fb8:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x78]
    ldr r2, [r4, #0x150]
    mov r1, r6
    bl func_ov042_022088fc
    subs r6, r6, #0x1
    bpl .L_02200fb8
.L_02200fd4:
    cmp r5, #0x0
    blt .L_02201208
    cmp r5, #0x2
    ldr r0, [r4, #0x4c]
    bne .L_02200ff8
    ldr r0, [r0, #0xc]
    mov r1, #0x6
    bl func_02072b68
    b .L_02201010
.L_02200ff8:
    ldr r0, [r0, #0xc]
    mov r1, #0x2
    bl func_02072b68
    ldr r0, [r4, #0x48]
    ldr r1, .L_0220122c
    bl func_020a1ec0
.L_02201010:
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02201208
.L_02201028:
    add r0, r0, #0x1
    str r0, [r4, #0xd0]
    cmp r0, #0x14
    bne .L_02201138
    ldr r0, [r4, #0xcc]
    subs r0, r0, #0x1
    bne .L_02201098
    ldr r0, [r4, #0x150]
    cmp r0, #0x0
    bge .L_02201070
    ldr r0, [r4, #0x74]
    mov r1, #0x4
    bl func_ov042_02207f58
    ldr r0, [r4, #0xe4]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r4, #0xe4]
    b .L_02201138
.L_02201070:
    moveq r5, #0x2
    movne r5, #0x4
    b .L_0220108c
.L_0220107c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x68]
    mov r1, r5
    bl func_ov042_02207f58
.L_0220108c:
    subs r5, r5, #0x1
    bpl .L_0220107c
    b .L_02201138
.L_02201098:
    cmp r0, #0x1
    bne .L_02201114
    ldr r0, [r4, #0x4c]
    mov r1, #0x5
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x48]
    ldr r1, .L_02201230
    bl func_020a1ec0
    mov r0, #0x0
    str r0, [r4, #0x188]
    ldr r1, [r4, #0x16c]
    mov r0, #0x3
    add r1, r1, #0x1
    str r1, [r4, #0x16c]
    sub r5, r0, #0x1
.L_022010fc:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x78]
    bl func_ov042_022089e8
    subs r5, r5, #0x1
    bpl .L_022010fc
    b .L_02201138
.L_02201114:
    cmp r0, #0x2
    bne .L_02201138
    mov r0, #0x2
    sub r5, r0, #0x1
.L_02201124:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x84]
    bl func_ov042_022091f4
    subs r5, r5, #0x1
    bpl .L_02201124
.L_02201138:
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_022011e4
    mov r1, #0x0
    bl func_02072b68
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x50]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x50]
    mov r2, #0x0
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x174]
    ldr r0, [r4, #0x50]
    str r1, [r0, #0x30]
    ldr r1, [r4, #0x178]
    ldr r0, [r4, #0x50]
    str r1, [r0, #0x34]
    str r2, [r4, #0x184]
    str r2, [r4, #0x180]
    ldr r0, [r4, #0x54]
    str r2, [r0, #0x34]
    ldr r1, [r4, #0x54]
    ldr r0, [r1, #0x34]
    str r0, [r1, #0x30]
    str r2, [r4, #0x194]
    str r2, [r4, #0x190]
    str r2, [r4, #0x1ac]
    str r2, [r4, #0x1a8]
    str r2, [r4, #0x1a0]
    str r2, [r4, #0x19c]
.L_022011e4:
    ldr r0, [r4, #0xd0]
    cmp r0, #0x14
    ble .L_02201208
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    ldrb r0, [r0, #0x38]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0xc0]
.L_02201208:
    add sp, sp, #0x248
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02201210: .word data_ov042_0220ac90
.L_02201214: .word data_ov042_0220ae64
.L_02201218: .word data_ov042_0220b018
.L_0220121c: .word data_ov042_0220b0ac
.L_02201220: .word 0xffff
.L_02201224: .word 0x19a
.L_02201228: .word 0x14a000
.L_0220122c: .word 0xb485
.L_02201230: .word 0xeb8d
.size func_ov042_02200bc0, . - func_ov042_02200bc0

