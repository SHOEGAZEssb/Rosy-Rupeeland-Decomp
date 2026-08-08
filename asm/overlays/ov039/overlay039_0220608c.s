.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern func_0200500c
    .extern func_020befec
    .extern func_02005058
    .global func_ov039_0220608c
func_ov039_0220608c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x500
    mov r4, r0
    ldr r0, [r4, #0x48]
    mov r1, #0x0
    ldrh r3, [r0, #0x40]
    add r0, sp, #0x460
    sub r2, r1, #0x8000
    mov ip, r3, asr #0x1
    mov r3, #0x4
    and r5, ip, #0xff
    bl func_0200500c
    mov r1, #0x4000
    rsb r1, r1, #0x0
    add r0, sp, #0x470
    sub r2, r1, #0x7000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x4000
    add r0, sp, #0x480
    sub r2, r1, #0xf000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x0
    add r0, sp, #0x490
    sub r2, r1, #0x11000
    mov r3, #0x1
    bl func_0200500c
    mov r1, #0x6000
    rsb r1, r1, #0x0
    add r0, sp, #0x4a0
    sub r2, r1, #0xb000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0x6000
    add r0, sp, #0x4b0
    sub r2, r1, #0x17000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0x8000
    rsb r1, r1, #0x0
    add r0, sp, #0x4c0
    sub r2, r1, #0x6000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x8000
    add r0, sp, #0x4d0
    sub r2, r1, #0x16000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x4000
    add r0, sp, #0x4e0
    sub r2, r1, #0x1a000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x4000
    rsb r1, r1, #0x0
    add r0, sp, #0x4f0
    sub r2, r1, #0x12000
    mov r3, #0x5
    bl func_0200500c
    mov r1, #0x2000
    add r0, sp, #0x3c0
    sub r2, r1, #0x9000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x2000
    rsb r1, r1, #0x0
    add r0, sp, #0x3d0
    sub r2, r1, #0x8000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x6000
    add r0, sp, #0x3e0
    sub r2, r1, #0x10000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x2000
    add r0, sp, #0x3f0
    sub r2, r1, #0x12000
    mov r3, #0x1
    bl func_0200500c
    mov r1, #0x4000
    rsb r1, r1, #0x0
    add r0, sp, #0x400
    sub r2, r1, #0xc000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0x8000
    add r0, sp, #0x410
    sub r2, r1, #0x18000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0x6000
    rsb r1, r1, #0x0
    add r0, sp, #0x420
    sub r2, r1, #0x7000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0xa000
    add r0, sp, #0x430
    sub r2, r1, #0x16000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x6000
    add r0, sp, #0x440
    sub r2, r1, #0x1a000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x2000
    rsb r1, r1, #0x0
    add r0, sp, #0x450
    sub r2, r1, #0x13000
    mov r3, #0x5
    bl func_0200500c
    mov r1, #0x5000
    add r0, sp, #0x320
    sub r2, r1, #0xb000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x9000
    add r0, sp, #0x330
    sub r2, r1, #0x12000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x1000
    add r0, sp, #0x340
    sub r2, r1, #0xa000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x5000
    add r0, sp, #0x350
    sub r2, r1, #0x14000
    mov r3, #0x1
    bl func_0200500c
    mov r1, #0x1000
    rsb r1, r1, #0x0
    add r0, sp, #0x360
    sub r2, r1, #0xe000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0xb000
    add r0, sp, #0x370
    sub r2, r1, #0x19000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0xd000
    add r0, sp, #0x380
    sub r2, r1, #0x17000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x3000
    rsb r1, r1, #0x0
    add r0, sp, #0x390
    sub r2, r1, #0x9000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x2000
    add r0, sp, #0x3a0
    sub r2, r1, #0x16000
    mov r3, #0x5
    bl func_0200500c
    mov r1, #0xa000
    add r0, sp, #0x3b0
    sub r2, r1, #0x1d000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x0
    add r0, sp, #0x280
    sub r2, r1, #0x4000
    sub r3, r1, #0x2
    bl func_0200500c
    mov r1, #0x4000
    add r0, sp, #0x290
    sub r2, r1, #0xb000
    mvn r3, #0x1
    bl func_0200500c
    mov r1, #0x4000
    rsb r1, r1, #0x0
    add r0, sp, #0x2a0
    sub r2, r1, #0x3000
    mov r3, r1, asr #0xd
    bl func_0200500c
    mov r1, #0x2000
    add r0, sp, #0x2b0
    sub r2, r1, #0xf000
    mvn r3, #0x3
    bl func_0200500c
    mov r1, #0x7000
    add r0, sp, #0x2c0
    sub r2, r1, #0x14000
    mvn r3, #0x2
    bl func_0200500c
    mov r1, #0x5000
    rsb r1, r1, #0x0
    add r0, sp, #0x2d0
    sub r2, r1, #0x8000
    mov r3, r1, asr #0xd
    bl func_0200500c
    mov r1, #0x8000
    add r0, sp, #0x2e0
    sub r2, r1, #0x11000
    mvn r3, #0x1
    bl func_0200500c
    mov r1, #0x8000
    rsb r1, r1, #0x0
    add r0, sp, #0x2f0
    sub r2, r1, #0x1000
    mov r3, r1, asr #0xe
    bl func_0200500c
    mov r1, #0x3000
    rsb r1, r1, #0x0
    add r0, sp, #0x300
    sub r2, r1, #0xe000
    mov r3, r1, asr #0xd
    bl func_0200500c
    mov r1, #0x5000
    add r0, sp, #0x310
    sub r2, r1, #0x17000
    mvn r3, #0x0
    bl func_0200500c
    mov r1, #0x0
    add r0, sp, #0x1e0
    sub r2, r1, #0x4000
    sub r3, r1, #0x2
    bl func_0200500c
    mov r1, #0x4000
    add r0, sp, #0x1f0
    sub r2, r1, #0xb000
    mvn r3, #0x1
    bl func_0200500c
    mov r1, #0x4000
    rsb r1, r1, #0x0
    add r0, sp, #0x200
    sub r2, r1, #0x3000
    mov r3, r1, asr #0xd
    bl func_0200500c
    mov r1, #0x0
    add r0, sp, #0x210
    sub r2, r1, #0xd000
    sub r3, r1, #0x4
    bl func_0200500c
    mov r1, #0x6000
    add r0, sp, #0x220
    sub r2, r1, #0x13000
    mvn r3, #0x2
    bl func_0200500c
    mov r1, #0x6000
    rsb r1, r1, #0x0
    add r0, sp, #0x230
    sub r2, r1, #0x7000
    mov r3, r1, asr #0xd
    bl func_0200500c
    mov r1, #0x8000
    add r0, sp, #0x240
    sub r2, r1, #0x11000
    mvn r3, #0x1
    bl func_0200500c
    mov r1, #0x8000
    rsb r1, r1, #0x0
    add r0, sp, #0x250
    sub r2, r1, #0x1000
    mov r3, r1, asr #0xe
    bl func_0200500c
    mov r1, #0x4000
    rsb r1, r1, #0x0
    add r0, sp, #0x260
    sub r2, r1, #0xd000
    mov r3, r1, asr #0xd
    bl func_0200500c
    mov r1, #0x4000
    add r0, sp, #0x270
    sub r2, r1, #0x15000
    mvn r3, #0x0
    bl func_0200500c
    mov r1, #0x0
    add r0, sp, #0x140
    sub r2, r1, #0x4000
    sub r3, r1, #0x2
    bl func_0200500c
    mov r1, #0x4000
    add r0, sp, #0x150
    sub r2, r1, #0xb000
    mvn r3, #0x1
    bl func_0200500c
    mov r1, #0x4000
    rsb r1, r1, #0x0
    add r0, sp, #0x160
    sub r2, r1, #0x3000
    mov r3, r1, asr #0xd
    bl func_0200500c
    mov r1, #0x2000
    rsb r1, r1, #0x0
    add r0, sp, #0x170
    sub r2, r1, #0xb000
    mov r3, r1, asr #0xb
    bl func_0200500c
    mov r1, #0x5000
    add r0, sp, #0x180
    sub r2, r1, #0x12000
    mvn r3, #0x2
    bl func_0200500c
    mov r1, #0x7000
    rsb r1, r1, #0x0
    add r0, sp, #0x190
    sub r2, r1, #0x6000
    mvn r3, #0x2
    bl func_0200500c
    mov r1, #0x8000
    add r0, sp, #0x1a0
    sub r2, r1, #0x11000
    mvn r3, #0x1
    bl func_0200500c
    mov r1, #0x8000
    rsb r1, r1, #0x0
    add r0, sp, #0x1b0
    sub r2, r1, #0x1000
    mov r3, r1, asr #0xe
    bl func_0200500c
    mov r1, #0x5000
    rsb r1, r1, #0x0
    add r0, sp, #0x1c0
    sub r2, r1, #0xd000
    mov r3, r1, asr #0xe
    bl func_0200500c
    mov r1, #0x3000
    add r0, sp, #0x1d0
    sub r2, r1, #0x14000
    mvn r3, #0x0
    bl func_0200500c
    mov r1, #0x5000
    rsb r1, r1, #0x0
    add r0, sp, #0xa0
    sub r2, r1, #0x1000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x9000
    rsb r1, r1, #0x0
    add r0, sp, #0xb0
    mov r2, r1
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x1000
    rsb r1, r1, #0x0
    add r0, sp, #0xc0
    sub r2, r1, #0x8000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x5000
    rsb r1, r1, #0x0
    add r0, sp, #0xd0
    sub r2, r1, #0xa000
    mov r3, #0x1
    bl func_0200500c
    mov r1, #0xb000
    rsb r1, r1, #0x0
    add r0, sp, #0xe0
    sub r2, r1, #0x3000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0x1000
    add r0, sp, #0xf0
    sub r2, r1, #0x10000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0xd000
    rsb r1, r1, #0x0
    add r0, sp, #0x100
    add r2, r1, #0x3000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x3000
    add r0, sp, #0x110
    sub r2, r1, #0xf000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0xa000
    rsb r1, r1, #0x0
    add r0, sp, #0x120
    sub r2, r1, #0x9000
    mov r3, #0x5
    bl func_0200500c
    mov r1, #0x2000
    rsb r1, r1, #0x0
    add r0, sp, #0x130
    sub r2, r1, #0x12000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x2000
    rsb r1, r1, #0x0
    add r0, sp, #0x0
    sub r2, r1, #0x5000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x6000
    rsb r1, r1, #0x0
    add r0, sp, #0x10
    sub r2, r1, #0x4000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x2000
    add r0, sp, #0x20
    sub r2, r1, #0xc000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x2000
    rsb r1, r1, #0x0
    add r0, sp, #0x30
    sub r2, r1, #0xe000
    mov r3, #0x1
    bl func_0200500c
    mov r1, #0x8000
    rsb r1, r1, #0x0
    add r0, sp, #0x40
    sub r2, r1, #0x8000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0x4000
    add r0, sp, #0x50
    sub r2, r1, #0x14000
    mov r3, #0x2
    bl func_0200500c
    mov r1, #0xa000
    rsb r1, r1, #0x0
    add r0, sp, #0x60
    sub r2, r1, #0x2000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x6000
    add r0, sp, #0x70
    sub r2, r1, #0x13000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x2000
    add r0, sp, #0x80
    sub r2, r1, #0x17000
    mov r3, #0x4
    bl func_0200500c
    mov r1, #0x6000
    rsb r1, r1, #0x0
    add r0, sp, #0x90
    sub r2, r1, #0xe000
    mov r3, #0x5
    bl func_0200500c
    add r0, sp, #0x460
    cmp r5, #0x3
    addeq r0, sp, #0x280
    beq L_022067d0
    cmp r5, #0x4
    addeq r0, sp, #0x1e0
    beq L_022067d0
    cmp r5, #0x5
    addeq r0, sp, #0x140
    beq L_022067d0
    cmp r5, #0x7
    addeq r0, sp, #0x0
    beq L_022067d0
    cmp r5, #0x1
    addeq r0, sp, #0x3c0
    beq L_022067d0
    cmp r5, #0x2
    addeq r0, sp, #0x320
    beq L_022067d0
    cmp r5, #0x6
    addeq r0, sp, #0xa0
L_022067d0:
    mov r1, #0xa
    sub r1, r1, #0x1
L_022067d8:
    add lr, r4, r1, lsl #0x2
    ldr r3, [lr, #0x58]
    ldrh r2, [r3, #0x40]
    cmp r2, #0x0
    bne L_02206810
    add ip, r0, r1, lsl #0x4
    ldr r2, [ip, #0x4]
    str r2, [r3, #0x30]
    ldr r3, [ip, #0x8]
    ldr r2, [lr, #0x58]
    str r3, [r2, #0x34]
    ldr r3, [ip, #0xc]
    ldr r2, [lr, #0x58]
    str r3, [r2, #0x44]
L_02206810:
    add r2, r4, r1, lsl #0x2
    ldr r3, [r2, #0x58]
    subs r1, r1, #0x1
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    bpl L_022067d8
    ldrsh r0, [r4, #0xba]
    mov r1, #0xa
    bl func_020befec
    b L_02206850
L_0220683c:
    add r1, r4, r0, lsl #0x2
    ldr r2, [r1, #0x58]
    ldrh r1, [r2, #0x42]
    bic r1, r1, #0x4
    strh r1, [r2, #0x42]
L_02206850:
    subs r0, r0, #0x1
    bpl L_0220683c
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
    add r0, sp, #0x40
    bl func_02005058
    add r0, sp, #0x30
    bl func_02005058
    add r0, sp, #0x20
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
    add r0, sp, #0x0
    bl func_02005058
    add r0, sp, #0x130
    bl func_02005058
    add r0, sp, #0x120
    bl func_02005058
    add r0, sp, #0x110
    bl func_02005058
    add r0, sp, #0x100
    bl func_02005058
    add r0, sp, #0xf0
    bl func_02005058
    add r0, sp, #0xe0
    bl func_02005058
    add r0, sp, #0xd0
    bl func_02005058
    add r0, sp, #0xc0
    bl func_02005058
    add r0, sp, #0xb0
    bl func_02005058
    add r0, sp, #0xa0
    bl func_02005058
    add r0, sp, #0x1d0
    bl func_02005058
    add r0, sp, #0x1c0
    bl func_02005058
    add r0, sp, #0x1b0
    bl func_02005058
    add r0, sp, #0x1a0
    bl func_02005058
    add r0, sp, #0x190
    bl func_02005058
    add r0, sp, #0x180
    bl func_02005058
    add r0, sp, #0x170
    bl func_02005058
    add r0, sp, #0x160
    bl func_02005058
    add r0, sp, #0x150
    bl func_02005058
    add r0, sp, #0x140
    bl func_02005058
    add r0, sp, #0x270
    bl func_02005058
    add r0, sp, #0x260
    bl func_02005058
    add r0, sp, #0x250
    bl func_02005058
    add r0, sp, #0x240
    bl func_02005058
    add r0, sp, #0x230
    bl func_02005058
    add r0, sp, #0x220
    bl func_02005058
    add r0, sp, #0x210
    bl func_02005058
    add r0, sp, #0x200
    bl func_02005058
    add r0, sp, #0x1f0
    bl func_02005058
    add r0, sp, #0x1e0
    bl func_02005058
    add r0, sp, #0x310
    bl func_02005058
    add r0, sp, #0x300
    bl func_02005058
    add r0, sp, #0x2f0
    bl func_02005058
    add r0, sp, #0x2e0
    bl func_02005058
    add r0, sp, #0x2d0
    bl func_02005058
    add r0, sp, #0x2c0
    bl func_02005058
    add r0, sp, #0x2b0
    bl func_02005058
    add r0, sp, #0x2a0
    bl func_02005058
    add r0, sp, #0x290
    bl func_02005058
    add r0, sp, #0x280
    bl func_02005058
    add r0, sp, #0x3b0
    bl func_02005058
    add r0, sp, #0x3a0
    bl func_02005058
    add r0, sp, #0x390
    bl func_02005058
    add r0, sp, #0x380
    bl func_02005058
    add r0, sp, #0x370
    bl func_02005058
    add r0, sp, #0x360
    bl func_02005058
    add r0, sp, #0x350
    bl func_02005058
    add r0, sp, #0x340
    bl func_02005058
    add r0, sp, #0x330
    bl func_02005058
    add r0, sp, #0x320
    bl func_02005058
    add r0, sp, #0x450
    bl func_02005058
    add r0, sp, #0x440
    bl func_02005058
    add r0, sp, #0x430
    bl func_02005058
    add r0, sp, #0x420
    bl func_02005058
    add r0, sp, #0x410
    bl func_02005058
    add r0, sp, #0x400
    bl func_02005058
    add r0, sp, #0x3f0
    bl func_02005058
    add r0, sp, #0x3e0
    bl func_02005058
    add r0, sp, #0x3d0
    bl func_02005058
    add r0, sp, #0x3c0
    bl func_02005058
    add r0, sp, #0x4f0
    bl func_02005058
    add r0, sp, #0x4e0
    bl func_02005058
    add r0, sp, #0x4d0
    bl func_02005058
    add r0, sp, #0x4c0
    bl func_02005058
    add r0, sp, #0x4b0
    bl func_02005058
    add r0, sp, #0x4a0
    bl func_02005058
    add r0, sp, #0x490
    bl func_02005058
    add r0, sp, #0x480
    bl func_02005058
    add r0, sp, #0x470
    bl func_02005058
    add r0, sp, #0x460
    bl func_02005058
    add sp, sp, #0x500
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov039_0220608c, .-func_ov039_0220608c

