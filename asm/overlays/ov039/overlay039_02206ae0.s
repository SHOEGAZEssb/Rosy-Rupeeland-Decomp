.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern func_0209e384
    .extern func_02072b68
    .extern Sound_Play
    .extern func_0209e35c
    .extern func_02005030
    .extern func_ov049_0220bbdc
    .extern func_02005058
    .extern func_0205940c
    .extern func_020ae024
    .extern func_ov039_0220608c
    .extern func_02004fe0
    .extern func_ov039_02205f64
    .extern func_020befec
    .extern func_ov007_021fc0dc
    .extern func_0200500c
    .extern func_ov039_02205c18
    .extern func_020adc40
    .extern func_020adc90
    .extern func_ov039_022014f8
    .extern func_020050a4
    .extern data_ov039_022082c4
    .extern gSystemState
    .extern gSoundContext
    .extern data_020c9670
    .global func_ov039_02206ae0
func_ov039_02206ae0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xd0
    mov r5, #0x0
    ldr r3, L_02207118
    add r2, sp, #0x40
    mov r4, r0
    mov r6, r5
    mov r7, r5
    mov r1, #0x10
L_02206b04:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02206b04
    ldrsh r0, [r4, #0xb6]
    mov r8, #0x0
    cmp r0, #0x0
    bne L_02206c64
    ldr r0, L_0220711c
    ldrh r1, [r0, #0x1a]
    tst r1, #0x40
    orrne r0, r7, #0x2
    andne r7, r0, #0xff
    subne r6, r6, #0x1000
    tst r1, #0x80
    orrne r0, r7, #0x1
    andne r7, r0, #0xff
    addne r6, r6, #0x1000
    tst r1, #0x20
    orrne r0, r7, #0x8
    andne r7, r0, #0xff
    subne r5, r5, #0x1000
    tst r1, #0x10
    orrne r0, r7, #0x4
    andne r7, r0, #0xff
    addne r5, r5, #0x1000
    cmp r7, #0x0
    movne r0, #0x0
    strne r0, [r4, #0xd4]
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    ldr r0, [r4, #0x80]
    bne L_02206bc8
    bl func_0209e384
    cmp r0, #0x0
    beq L_02206c64
    ldr r0, [r4, #0x50]
    mov r1, #0x3
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, L_02207120
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
    mov r8, #0x1
    str r8, [r4, #0xac]
    str r8, [r4, #0xb0]
    b L_02206c64
L_02206bc8:
    mov r9, #0x0
    bl func_0209e35c
    cmp r0, #0x0
    beq L_02206c28
    ldrb r0, [r4, #0xa4]
    ldr r1, [r4, #0x50]
    cmp r5, #0x0
    mov r0, r0, asr #0x1
    and r9, r0, #0xff
    cmpeq r6, #0x0
    addne r0, r9, #0x8
    andne r9, r0, #0xff
    add r0, sp, #0x10
    add r1, r1, #0x1c
    bl func_02005030
    ldr r0, [r4, #0x80]
    add r1, sp, #0x10
    ldr r0, [r0, #0xc]
    mov r2, r9
    mov r3, #0x0
    bl func_ov049_0220bbdc
    add r0, sp, #0x10
    bl func_02005058
    mov r9, #0x1
L_02206c28:
    cmp r9, #0x0
    beq L_02206c64
    ldr r0, L_02207120
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl func_0205940c
    ldr r0, L_02207120
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl Sound_Play
    mov r0, #0x0
    str r0, [r4, #0xac]
    mov r8, #0x1
L_02206c64:
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    ldreq r0, L_02207124
    ldreq r9, L_02207128
    streq r0, [r4, #0xa8]
    ldrne r0, L_0220712c
    moveq r10, #0x1800
    strne r0, [r4, #0xa8]
    ldrsh r0, [r4, #0xb6]
    movne r9, #0x52
    movne r10, #0x148
    cmp r0, #0x0
    movne r9, #0x29
    cmp r5, #0x0
    cmpeq r6, #0x0
    beq L_02206d20
    mov r0, r6
    mov r1, r5
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r2, L_02207130
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r0]
    mov r0, r3, lsl #0x1
    ldrsh r0, [r2, r0]
    smull r2, r3, r1, r10
    adds r5, r2, #0x800
    smull r2, r1, r0, r10
    adc r0, r3, #0x0
    mov r3, r5, lsr #0xc
    ldr r5, [r4, #0x88]
    orr r3, r3, r0, lsl #0x14
    add r0, r5, r3
    adds r2, r2, #0x800
    str r0, [r4, #0x88]
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r2, [r4, #0x8c]
    add r0, sp, #0x40
    add r1, r2, r1
    str r1, [r4, #0x8c]
    ldrb r0, [r0, r7]
    mov r0, r0, lsl #0x1
    strb r0, [r4, #0xa4]
L_02206d20:
    ldrsh r0, [r4, #0xb6]
    cmp r0, #0x0
    ldreqsh r0, [r4, #0xb8]
    cmpeq r0, #0x0
    bne L_02206d80
    ldr r3, [r4, #0x48]
    ldrb r0, [r4, #0xa4]
    ldrh r2, [r3, #0x40]
    subs r1, r0, r2
    beq L_02206d80
    mvn r0, #0x7
    cmp r1, r0
    addlt r1, r1, #0x10
    cmp r1, #0x8
    subgt r1, r1, #0x10
    cmp r1, #0x0
    mvnlt r0, #0x0
    blt L_02206d70
    movgt r0, #0x1
    movle r0, #0x0
L_02206d70:
    add r0, r2, r0
    and r0, r0, #0xf
    strh r0, [r3, #0x40]
    mov r8, #0x1
L_02206d80:
    cmp r8, #0x0
    beq L_02206e0c
    ldr r1, [r4, #0x48]
    mov r0, r4
    ldrh r1, [r1, #0x40]
    mov r1, r1, asr #0x1
    and r5, r1, #0xff
    bl func_ov039_0220608c
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    beq L_02206dfc
    add r0, sp, #0x30
    bl func_02004fe0
    add r2, sp, #0x30
    mov r0, r4
    mov r1, r5
    bl func_ov039_02205f64
    ldr r3, [sp, #0x3c]
    ldr r2, [r4, #0x50]
    add r1, r5, #0x8
    str r3, [r2, #0x44]
    ldr r6, [sp, #0x38]
    ldr r5, [r4, #0x50]
    ldr r3, [sp, #0x34]
    add r0, sp, #0x30
    str r3, [r5, #0x30]
    mov r2, #0x0
    str r6, [r5, #0x34]
    str r2, [r5, #0x38]
    and r5, r1, #0xff
    bl func_02005058
L_02206dfc:
    ldr r0, [r4, #0x48]
    mov r1, r5
    ldr r0, [r0, #0xc]
    bl func_02072b68
L_02206e0c:
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    beq L_02206f7c
    mov r1, #0x12c
    bl func_020befec
    ldr r1, [r4, #0xac]
    mov r5, r0
    add r1, r1, #0x1
    str r1, [r4, #0xac]
    ldr r0, [r4, #0x80]
    rsb r1, r1, #0x384
    ldr r0, [r0, #0x20]
    bl func_ov007_021fc0dc
    ldr r0, [r4, #0xac]
    mov r1, #0x12c
    bl func_020befec
    cmp r5, r0
    beq L_02206f7c
    cmp r5, #0x2
    blt L_02206f68
    mov r1, #0x0
    add r0, sp, #0x50
    mov r3, r1
    sub r2, r1, #0x1000
    bl func_0200500c
    ldr r1, L_02207134
    add r0, sp, #0x60
    rsb r2, r1, #0x0
    mov r3, #0x0
    bl func_0200500c
    mov r2, #0x0
    add r0, sp, #0x70
    mov r3, r2
    mov r1, #0x1000
    bl func_0200500c
    ldr r1, L_02207134
    add r0, sp, #0x80
    mov r3, #0x0
    mov r2, r1
    bl func_0200500c
    mov r1, #0x0
    add r0, sp, #0x90
    mov r2, #0x1000
    mov r3, r1
    bl func_0200500c
    ldr r1, L_02207138
    add r0, sp, #0xa0
    mov r3, #0x0
    rsb r2, r1, #0x0
    bl func_0200500c
    mov r1, #0x1000
    mov r2, #0x0
    add r0, sp, #0xb0
    rsb r1, r1, #0x0
    mov r3, r2
    bl func_0200500c
    ldr r1, L_02207138
    add r0, sp, #0xc0
    mov r3, #0x0
    mov r2, r1
    bl func_0200500c
    ldr r1, [r4, #0x48]
    add r2, sp, #0x50
    ldrh r1, [r1, #0x40]
    mov r0, r4
    mov r1, r1, asr #0x1
    add r1, r2, r1, lsl #0x4
    bl func_ov039_02205c18
    mov r0, #0x0
    str r0, [r4, #0xac]
    add r0, sp, #0xc0
    bl func_02005058
    add r0, sp, #0xb0
    bl func_02005058
    add r0, sp, #0xa0
    bl func_02005058
    add r0, sp, #0x90
    bl func_02005058
    add r0, sp, #0x80
    bl func_02005058
    add r0, sp, #0x70
    bl func_02005058
    add r0, sp, #0x60
    bl func_02005058
    add r0, sp, #0x50
    bl func_02005058
    b L_02206f7c
L_02206f68:
    ldr r0, [r4, #0x50]
    add r1, r5, #0x4
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl func_02072b68
L_02206f7c:
    ldr r0, [r4, #0x8c]
    ldr r2, [r4, #0x88]
    smull r1, r3, r0, r9
    adds r5, r1, #0x800
    smull r1, r0, r2, r9
    adc r3, r3, #0x0
    adds r1, r1, #0x800
    mov r5, r5, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r2, r1
    str r0, [r4, #0x88]
    ldr r0, [r4, #0x8c]
    orr r5, r5, r3, lsl #0x14
    sub r0, r0, r5
    str r0, [r4, #0x8c]
    ldrsh r2, [r4, #0xb6]
    mov r1, #0x0
    mov r0, #0x800
    cmp r2, #0x0
    bne L_02207068
    ldr r5, [r4, #0x8c]
    ldr r7, [r4, #0x88]
    smull r3, r2, r5, r5
    smull r6, r5, r7, r7
    adds r6, r6, r0
    adc r5, r5, r1
    adds r3, r3, r0
    mov r6, r6, lsr #0xc
    adc r0, r2, r1
    mov r1, r3, lsr #0xc
    orr r6, r6, r5, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r6, r1
    bl func_020adc40
    ldr r6, [r4, #0xa8]
    mov r5, r0
    cmp r5, r6
    ble L_02207068
    ldr r0, [r4, #0x88]
    mov r1, r5
    bl func_020adc90
    smull r2, r1, r0, r6
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x88]
    ldr r6, [r4, #0xa8]
    ldr r0, [r4, #0x8c]
    mov r1, r5
    bl func_020adc90
    smull r2, r1, r0, r6
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x8c]
L_02207068:
    add r0, sp, #0x20
    mov r5, #0x0
    bl func_02004fe0
    ldr r1, [r4, #0x48]
    add r0, sp, #0x0
    add r1, r1, #0x2c
    add r2, r4, #0x84
    bl func_ov039_022014f8
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    ldr r0, [sp, #0x24]
    cmp r0, #0x144000
    blt L_022070b0
    cmp r0, #0x2bc000
    ble L_022070c0
L_022070b0:
    ldr r0, [r4, #0x88]
    mov r5, #0x1
    rsb r0, r0, #0x0
    str r0, [r4, #0x88]
L_022070c0:
    ldr r0, [sp, #0x28]
    cmp r0, #0x84000
    blt L_022070d4
    cmp r0, #0x280000
    ble L_022070e4
L_022070d4:
    ldr r0, [r4, #0x8c]
    mov r5, #0x1
    rsb r0, r0, #0x0
    str r0, [r4, #0x8c]
L_022070e4:
    cmp r5, #0x0
    ldrnesh r0, [r4, #0xb6]
    cmpne r0, #0x0
    beq L_02207108
    ldr r0, L_02207120
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xe
    bl Sound_Play
L_02207108:
    add r0, sp, #0x20
    bl func_02005058
    add sp, sp, #0xd0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_02207118: .word data_ov039_022082c4
L_0220711c: .word gSystemState
L_02207120: .word gSoundContext
L_02207124: .word 0x1e66
L_02207128: .word 0x333
L_0220712c: .word 0x119a
L_02207130: .word data_020c9670
L_02207134: .word 0xb33
L_02207138: .word 0xfffff4cd
    .size func_ov039_02206ae0, .-func_ov039_02206ae0

