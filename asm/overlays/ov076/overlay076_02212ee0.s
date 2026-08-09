.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern Heap_Alloc
.extern data_020c9670
.extern data_021052fc
.extern data_ov076_02214eec
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
.extern func_0201e0ec
.extern func_0201f864
.extern func_020593ac
.extern func_020593dc
.extern func_0205940c
.extern func_0205946c
.extern func_020594a4
.extern func_020a2614
.extern func_020a2960
.extern func_ov076_02212e18
.extern func_ov076_022135d0
.extern func_ov076_022135e0
.extern func_ov076_02213628
.extern gHeapContext
.extern gSoundContext
.extern genrand_int32

.global func_ov076_02212ee0
func_ov076_02212ee0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x40
    mov r10, r0
    ldr r0, [r10, #0x260]
    bic r0, r0, #0x1
    str r0, [r10, #0x260]
    ldr r0, [r10, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x10
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0x0
    bne .L_0221359c
    add r0, r10, #0x200
    ldrh r1, [r0, #0x9e]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0x9e]
    ldrb r4, [r10, #0x29c]
    tst r4, #0x18
    beq .L_02212f9c
    mov r1, #0x0
    add r4, r10, #0x200
    mov r2, r1
    mov r3, r1
    strh r1, [r4, #0xa0]
    sub r5, r1, #0x1
    add r0, r10, #0x38
    strh r5, [r4, #0xa2]
    bl func_ov076_022135d0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r10, #0x88
    bl func_ov076_022135d0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r10, #0x98
    bl func_ov076_022135d0
    ldr r0, .L_022135a4
    mov r1, #0x1c4
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl func_0205940c
    mov r0, #0x0
    b .L_0221359c
.L_02212f9c:
    ldr r0, [r10, #0x278]
    ldrsb r8, [r10, #0x9]
    ldr r2, [r0, #0x4]
    ldrsb r1, [r10, #0x8]
    ldrsb r9, [r10, #0xa]
    ldrsh r3, [r2, #0x2]
    sub r8, r8, #0x4
    ldrsb r7, [r10, #0xb]
    sub r8, r3, r8
    ldrsh r11, [r2, #0x0]
    ldrsh r0, [r2, #0x4]
    sub r1, r1, #0x4
    add r9, r9, #0x4
    sub r1, r11, r1
    sub r0, r0, r9
    ldrsh r2, [r2, #0x6]
    add r3, r7, #0x4
    ldr r6, [r10, #0x1c]
    sub r2, r2, r3
    strh r1, [sp, #0x18]
    ldr r5, [r10, #0x20]
    strh r2, [sp, #0x1e]
    mov r2, r5, asr #0xc
    strh r0, [sp, #0x1c]
    strh r8, [sp, #0x1a]
    tst r4, #0x1
    mov r1, r6, asr #0xc
    mov r5, #0x0
    beq .L_02213024
    ldrsh r0, [sp, #0x1c]
    cmp r1, r0
    bicgt r0, r4, #0x1
    strgtb r0, [r10, #0x29c]
    b .L_02213034
.L_02213024:
    ldrsh r0, [sp, #0x18]
    cmp r1, r0
    orrlt r0, r4, #0x1
    strltb r0, [r10, #0x29c]
.L_02213034:
    ldrb r1, [r10, #0x29c]
    tst r1, #0x2
    beq .L_02213054
    ldrsh r0, [sp, #0x1e]
    cmp r2, r0
    bicgt r0, r1, #0x2
    strgtb r0, [r10, #0x29c]
    b .L_02213064
.L_02213054:
    ldrsh r0, [sp, #0x1a]
    cmp r2, r0
    orrlt r0, r1, #0x2
    strltb r0, [r10, #0x29c]
.L_02213064:
    add r0, r10, #0x200
    ldrsh r1, [r0, #0x52]
    cmp r1, #0x0
    bne .L_022131d4
    ldrsh r2, [r0, #0xa4]
    cmp r2, #0x0
    ble .L_022130c0
    mov r1, #0x0
    sub r4, r2, #0x1
    mov r2, r1
    mov r3, r1
    strh r4, [r0, #0xa4]
    mov r4, #0x3
    add r0, r10, #0x38
    strh r4, [r10, #0xd6]
    bl func_ov076_022135d0
    mov r2, #0x0
    add r0, r10, #0x200
    ldr r1, .L_022135a8
    strh r2, [r0, #0xa0]
    strh r1, [r0, #0xa2]
    sub r6, r2, #0x80
    b .L_022131c4
.L_022130c0:
    ldrsh r1, [r0, #0xa2]
    mov r5, #0x1
    cmp r1, #0x0
    ble .L_022130f0
    sub r1, r1, #0x1
    strh r1, [r0, #0xa2]
    ldrsh r1, [r0, #0xa2]
    cmp r1, #0x0
    moveq r1, #0xb4
    streqh r1, [r0, #0xa0]
    addeq r1, r1, #0x4b0
    streqh r1, [r0, #0xa2]
.L_022130f0:
    add r0, r10, #0x78
    add r1, r10, #0x18
    bl func_020050a4
    ldrb r0, [r10, #0x29c]
    mov r1, #0x8000
    mov r2, #0x6000
    tst r0, #0x1
    ldr r0, [r10, #0x7c]
    rsbeq r1, r1, #0x0
    add r0, r0, r1
    str r0, [r10, #0x7c]
    ldrb r0, [r10, #0x29c]
    ldr r1, [r10, #0x80]
    tst r0, #0x2
    rsbeq r2, r2, #0x0
    add r1, r1, r2
    str r1, [r10, #0x80]
    mov r0, r10
    ldr r2, [r0, #0x0]
    add r1, r10, #0x78
    ldr r2, [r2, #0xd0]
    blx r2
    add r2, r10, #0x200
    ldrsh r0, [r2, #0xa0]
    cmp r0, #0x0
    ble .L_02213174
    sub r3, r0, #0x1
    add r0, r10, #0x38
    mov r1, #0x1800
    strh r3, [r2, #0xa0]
    bl func_ov076_02212e18
    mov r6, #0x100
    b .L_02213194
.L_02213174:
    ldrh r0, [r2, #0x9e]
    cmp r0, #0x78
    mvnlo r6, #0x7f
    blo .L_02213194
    ldr r1, .L_022135ac
    add r0, r10, #0x38
    bl func_ov076_02212e18
    mov r6, #0x80
.L_02213194:
    add r0, sp, #0x20
    add r1, r10, #0x38
    mov r2, #0xc000
    bl func_ov076_022135e0
    add r1, sp, #0x20
    add r0, r10, #0x88
    bl func_020050c8
    add r0, sp, #0x20
    bl func_02005058
    add r0, r10, #0x38
    mov r1, #0x2000
    bl func_ov076_02213628
.L_022131c4:
    ldr r0, [r10, #0x260]
    orr r0, r0, #0x1
    str r0, [r10, #0x260]
    b .L_02213208
.L_022131d4:
    mov r1, #0x0
    mov r4, #0x16
    mov r2, r1
    mov r3, r1
    add r0, r10, #0x38
    strh r4, [r10, #0xd6]
    bl func_ov076_022135d0
    mov r2, #0x0
    add r0, r10, #0x200
    ldr r1, .L_022135a8
    strh r2, [r0, #0xa0]
    strh r1, [r0, #0xa2]
    sub r6, r2, #0x80
.L_02213208:
    ldr r0, [r10, #0x260]
    bic r0, r0, #0x2
    str r0, [r10, #0x260]
    ldrb r0, [r10, #0x29c]
    tst r0, #0x4
    beq .L_02213318
    bic r0, r0, #0x4
    strb r0, [r10, #0x29c]
    ldr r0, [r10, #0x24]
    ldr r1, [r10, #0x20]
    mov r0, r0, asr #0xc
    rsb r0, r0, r1, asr #0xc
    ldr r4, [r10, #0x1c]
    ldr r11, .L_022135b0
    add r7, r0, #0x6
    mov r8, #0x0
.L_02213248:
    ldr r1, .L_022135b4
    ldr r0, .L_022135b8
    sub r2, r8, #0x1
    mla r0, r2, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r9, r0, lsl #0x1
    ldr r0, .L_022135bc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, r9, lsl #0x1
    add r3, r11, r9, lsl #0x1
    ldrsh r9, [r3, #0x2]
    ldrsh r2, [r11, r2]
    mov r3, #0x14
    mov r1, #0x1
    smulbb r2, r2, r3
    add r3, r9, r9, lsl #0x3
    mov r2, r2, asr #0xc
    add r2, r2, r4, asr #0xc
    add r3, r7, r3, asr #0xc
    bl func_020a2614
    add r8, r8, #0x1
    cmp r8, #0x4
    blt .L_02213248
    add r0, r10, #0x200
    ldrsh r0, [r0, #0x52]
    ldr r2, .L_022135a4
    cmp r0, #0x0
    ldreqb r0, [r10, #0x29d]
    ldrnesh r1, [r10, #0xda]
    ldrneb r0, [r10, #0x29d]
    addne r0, r1, r0
    strh r0, [r10, #0xda]
    mov r1, #0x0
    strb r1, [r10, #0x29d]
    str r1, [sp, #0x0]
    ldrsh r3, [r10, #0xda]
    mov r0, #0xc0
    smulbb r0, r3, r0
    sub r0, r0, #0x300
    str r0, [sp, #0x4]
    ldr r0, [r2, #0x0]
    mov r2, #0x5b
    mov r3, #0x7f
    bl func_020593ac
    b .L_022133a8
.L_02213318:
    add r0, r10, #0x200
    ldrsh r1, [r0, #0x52]
    cmp r1, #0x0
    moveq r0, #0x0
    streqh r0, [r10, #0xda]
    beq .L_022133a8
    ldr r1, [r10, #0x298]
    ldrb r1, [r1, #0x2ce]
    cmp r1, #0xc
    bls .L_022133a8
    ldrsh r0, [r0, #0x5a]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r0, r1, r0, ror #0x1d
    bne .L_022133a8
    ldr r0, .L_022135bc
    ldrsh r4, [r10, #0xda]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    cmp r4, #0x4
    movgt r4, #0x4
    bl func_0201e0ec
    ldr r2, .L_022135c0
    add r1, r4, r4, lsl #0x3
    str r2, [sp, #0x0]
    ldr r2, [r10, #0x24]
    ldr r3, [r10, #0x20]
    mov r2, r2, asr #0xc
    rsb r2, r2, r3, asr #0xc
    sub r3, r2, #0x20
    ldr r4, [r10, #0x1c]
    sub r3, r3, r1
    mov r2, r4, asr #0xc
    mov r1, #0x0
    bl func_020a2960
.L_022133a8:
    add r0, r10, #0x200
    ldrsh r1, [r0, #0x5a]
    add r1, r1, #0x1
    strh r1, [r0, #0x5a]
    ldrsh r1, [r0, #0x5a]
    cmp r1, #0xff
    movgt r1, #0x0
    strgth r1, [r0, #0x5a]
    add r0, r10, #0x200
    ldrsh r1, [r0, #0xa4]
    cmp r1, #0x0
    bne .L_022134ac
    ldrh r0, [r0, #0xa6]
    tst r0, #0x7
    bne .L_0221349c
    add r0, sp, #0x30
    add r1, r10, #0x18
    bl func_02005030
    bl genrand_int32
    mov r1, r0, lsr #0x8
    mov r2, r0, lsl #0x1a
    mov r0, r1, lsl #0x1c
    mov r1, r2, lsr #0xe
    mov r0, r0, lsr #0x10
    ldr r2, [sp, #0x34]
    sub r1, r1, #0x20000
    add r2, r2, r1
    str r2, [sp, #0x34]
    ldr r1, [sp, #0x38]
    sub r0, r0, #0x10000
    add r0, r1, r0
    str r0, [sp, #0x38]
    ldr r1, .L_022135c4
    ldr r3, .L_022135c8
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_02213494
    ldr r0, [r10, #0x54]
    ldr r7, [r0, #0x0]
    bl genrand_int32
    ldr r1, .L_022135cc
    mov r8, #0x4
    str r1, [sp, #0x0]
    add r1, r1, #0x1
    str r1, [sp, #0x4]
    and r0, r0, #0x3
    str r0, [sp, #0x8]
    mov r0, r4
    str r8, [sp, #0xc]
    sub r3, r8, #0x5
    str r3, [sp, #0x10]
    mov r4, #0x1
    add r1, sp, #0x30
    mov r2, r7
    rsb r3, r8, #0x1640
    str r4, [sp, #0x14]
    bl func_0201f864
.L_02213494:
    add r0, sp, #0x30
    bl func_02005058
.L_0221349c:
    add r0, r10, #0x200
    ldrh r1, [r0, #0xa6]
    add r1, r1, #0x1
    strh r1, [r0, #0xa6]
.L_022134ac:
    add r0, r10, #0x200
    ldrsh r1, [r0, #0xa8]
    cmp r1, r6
    addlt r1, r1, #0x10
    strlth r1, [r0, #0xa8]
    blt .L_022134cc
    subgt r1, r1, #0x10
    strgth r1, [r0, #0xa8]
.L_022134cc:
    ldr r0, .L_022135a4
    mov r1, #0x1c4
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl func_020594a4
    cmp r5, #0x0
    beq .L_02213550
    add r1, r10, #0x200
    ldrh r2, [r1, #0xaa]
    cmp r2, #0x0
    subne r0, r2, #0x1
    strneh r0, [r1, #0xaa]
    bne .L_0221356c
    cmp r0, #0x0
    bne .L_02213530
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_022135a4
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r10
    mov r1, #0x1c4
    mov r2, #0x8
    bl func_020593dc
.L_02213530:
    add r0, r10, #0x200
    ldr r1, .L_022135a4
    ldrsh r3, [r0, #0xa8]
    ldr r0, [r1, #0x0]
    mov r1, #0x1c4
    mov r2, #0x8
    bl func_0205946c
    b .L_0221356c
.L_02213550:
    cmp r0, #0x0
    beq .L_0221356c
    ldr r0, .L_022135a4
    mov r1, #0x1c4
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl func_0205940c
.L_0221356c:
    add r0, r10, #0x200
    ldrsh r1, [r0, #0xa0]
    cmp r1, #0x0
    movgt r2, #0x300
    bgt .L_02213590
    ldrh r0, [r0, #0x9e]
    cmp r0, #0x78
    movhi r2, #0x200
    movls r2, #0x100
.L_02213590:
    ldr r1, [r10, #0x54]
    mov r0, #0x0
    strh r2, [r1, #0x36]
.L_0221359c:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022135a4: .word gSoundContext
.L_022135a8: .word 0x564
.L_022135ac: .word 0x1333
.L_022135b0: .word data_020c9670
.L_022135b4: .word 0x2710
.L_022135b8: .word 0xfffff254
.L_022135bc: .word data_021052fc
.L_022135c0: .word 0x7fff
.L_022135c4: .word data_ov076_02214eec
.L_022135c8: .word gHeapContext
.L_022135cc: .word 0x163d
.size func_ov076_02212ee0, . - func_ov076_02212ee0
