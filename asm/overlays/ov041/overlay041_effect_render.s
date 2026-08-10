.text

/* Exact fallback for func_ov041_02203434; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_render.c. */
.extern data_020c9670
.extern VecFx32Object_Init
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_0209a2ac
.extern func_0209b7a0
.extern func_0209c7e8
.extern func_0209c87c
.extern func_0209c9d4
.extern func_0209ca90
.extern func_020befec
.extern func_ov008_021fbe0c
.extern func_ov041_0220333c
.extern genrand_int32

    .global func_ov041_02203434
func_ov041_02203434: ; 0x02203434
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x354
    str r1, [sp, #0x4]
    mov r1, #0x0
    mov r2, #0x1
    mov r8, r0
    bl func_0209a2ac
    ldr r1, [sp, #0x4]
    add r0, sp, #0x234
    bl VecFx32Object_InitCopy
    ldr r0, [r8, #0x920]
    cmp r0, #0x4
    cmpne r0, #0x6
    cmpne r0, #0xb
    cmpne r0, #0x8
    cmpne r0, #0x9
    cmpne r0, #0xe
    bne .L_0220349c
    ldr r0, [r8, #0x48]
    ldr r0, [r0, #0x1ec]
    cmp r0, #0x0
    moveq r0, #0xc0000
    rsbeq r0, r0, #0x0
    streq r0, [sp, #0x23c]
    movne r0, #0x0
    strne r0, [sp, #0x23c]
.L_0220349c:
    ldr r0, [r8, #0x920]
    cmp r0, #0xe
    bne .L_022034b4
    ldr r0, [r8, #0x91c]
    cmp r0, #0xa
    bge .L_022034c0
.L_022034b4:
    ldr r0, [r8, #0x93c]
    add r0, r0, #0x1
    str r0, [r8, #0x93c]
.L_022034c0:
    ldr r0, [r8, #0x920]
    cmp r0, #0x0
    bne .L_02203508
    mov r0, #0x7
    sub r3, r0, #0x1
.L_022034d4:
    add r2, r8, r3, lsl #0x2
    ldr r1, [r2, #0x4c]
    subs r3, r3, #0x1
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r2, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    bpl .L_022034d4
    b .L_02204be4
.L_02203508:
    ldr r0, [r8, #0x918]
    cmp r0, #0x0
    ble .L_0220355c
    bl genrand_int32
    ldr r1, .L_022044a8
    ldr r3, [sp, #0x238]
    and r2, r0, r1
    rsb r0, r1, #0x800
    add r0, r2, r0
    add r0, r0, r0, lsl #0x1
    add r0, r3, r0
    str r0, [sp, #0x238]
    bl genrand_int32
    ldr r1, .L_022044a8
    ldr r3, [sp, #0x23c]
    and r2, r0, r1
    rsb r0, r1, #0x800
    add r0, r2, r0
    add r0, r0, r0, lsl #0x1
    add r0, r3, r0
    str r0, [sp, #0x23c]
.L_0220355c:
    ldr r0, [r8, #0x48]
    add r1, sp, #0x234
    ldr r0, [r0, #0x18]
    bl func_0209b7a0
    ldr r0, [r8, #0x48]
    add r1, sp, #0x234
    ldr r0, [r0, #0x18]
    add r0, r0, #0x84
    bl VecFx32Object_Assign
    ldr r0, [r8, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x18]
    bl func_0209c7e8
    mov r10, #0x40000
    mov r9, #0x20000
    add r2, sp, #0x2b4
    mov r6, #0x0
    str r10, [sp, #0x2a4]
    str r9, [sp, #0x2a8]
    stmia r2, {r6, r9}
    add r0, sp, #0x304
    add r1, sp, #0x2d4
    add r2, sp, #0x2c4
    mov lr, #0xc0000
    add r4, sp, #0x2e4
    add r3, sp, #0x2f4
    str r9, [r0, #0x0]
    str r9, [r0, #0x4]
    mov r0, #0xa0000
    str r0, [r2, #0x0]
    str r6, [r2, #0x4]
    mov r2, #0x80000
    str r10, [r1, #0x4]
    str lr, [r1, #0x0]
    mov r1, #0x60000
    add r0, sp, #0x2ac
    mov r7, #0x5f000
    mov ip, #0x47000
    str r10, [r4, #0x4]
    str r2, [r4, #0x0]
    str r9, [r3, #0x4]
    str r1, [r3, #0x0]
    str r7, [r0, #0x0]
    str ip, [r0, #0x4]
    add r0, sp, #0x2bc
    mov r5, #0x1f000
    stmia r0, {r5, r7}
    add r3, sp, #0x2cc
    mov r0, #0xb7000
    mov r4, #0x2f000
    str r0, [r3, #0x0]
    str r4, [r3, #0x4]
    add r0, sp, #0x2dc
    mov r3, #0xff000
    str r3, [r0, #0x0]
    mov r3, #0x7f000
    str r3, [r0, #0x4]
    add r11, sp, #0x2ec
    mov r0, #0xbf000
    stmia r11, {r0, r3}
    add r0, sp, #0x2fc
    stmia r0, {r3, ip}
    add r11, sp, #0x30c
    mov r0, #0x3f000
    str r7, [r11, #0x4]
    str r0, [r11, #0x0]
    add r11, sp, #0x314
    mov ip, #0xb8000
    str ip, [r11, #0x0]
    str r6, [r11, #0x4]
    add r11, sp, #0x31c
    mov ip, #0xcf000
    str ip, [r11, #0x0]
    str r4, [r11, #0x4]
    add r11, sp, #0x324
    add r4, sp, #0x32c
    str lr, [r11, #0x0]
    str r10, [r11, #0x4]
    mov r11, #0xff000
    str r11, [r4, #0x0]
    str r3, [r4, #0x4]
    add ip, sp, #0x334
    stmia ip, {r2, r10}
    add r4, sp, #0x34c
    add r11, sp, #0x33c
    mov ip, #0xbf000
    str ip, [r11, #0x0]
    add ip, sp, #0x20c
    str r3, [r11, #0x4]
    add r11, sp, #0x214
    str r6, [sp, #0x204]
    str r6, [sp, #0x208]
    str r2, [r4, #0x0]
    str r2, [r4, #0x4]
    add r4, sp, #0x21c
    str r5, [ip, #0x0]
    str r5, [ip, #0x4]
    str r9, [r11, #0x0]
    str r6, [r11, #0x4]
    stmia r4, {r0, r5}
    add r11, sp, #0x22c
    add ip, sp, #0x224
    str r7, [r11, #0x0]
    str r5, [r11, #0x4]
    add r11, sp, #0x344
    str r1, [sp, #0x244]
    str r6, [sp, #0x248]
    add r4, sp, #0x24c
    stmia r4, {r3, r5}
    add r7, sp, #0x254
    stmia r7, {r2, r6}
    add r7, sp, #0x26c
    add r4, sp, #0x274
    add lr, sp, #0x28c
    str r10, [ip, #0x0]
    str r10, [r11, #0x0]
    mov r10, #0x48000
    str r10, [r11, #0x4]
    add r11, sp, #0x25c
    mov r10, #0x9f000
    str r6, [ip, #0x4]
    add ip, sp, #0x264
    str r10, [r11, #0x0]
    str r5, [r11, #0x4]
    add r11, sp, #0x27c
    str r5, [r7, #0x0]
    add r5, sp, #0x284
    str r3, [r7, #0x4]
    str r3, [r11, #0x4]
    add r3, sp, #0x294
    str r0, [r11, #0x0]
    add r11, sp, #0x29c
    str r6, [ip, #0x0]
    str r1, [ip, #0x4]
    mov r7, r6
    str r1, [r4, #0x4]
    str r9, [r4, #0x0]
    str r2, [r5, #0x0]
    str r0, [r5, #0x4]
    str r10, [lr, #0x0]
    str r9, [lr, #0x4]
    str r2, [r3, #0x0]
    str r0, [r3, #0x4]
    str r10, [r11, #0x0]
    str r9, [r11, #0x4]
.L_022037a0:
    cmp r7, #0x0
    bne .L_02204438
    add r2, r8, r7, lsl #0x2
    ldr r0, [r2, #0x790]
    cmp r0, #0x1000
    bge .L_02204a78
    ldr r0, [r2, #0x624]
    cmp r0, #0x1000
    bne .L_02203810
    add r0, r8, r6, lsl #0x2
    ldr r5, [r0, #0x4c]
    mov r1, #0xc
    ldrh r4, [r5, #0x42]
    mla r3, r7, r1, r8
    bic r1, r4, #0x4
    strh r1, [r5, #0x42]
    ldr r1, [r0, #0x4c]
    ldr r2, [r2, #0x4b8]
    ldr r1, [r1, #0xc]
    sub r2, r2, #0x8000
    strh r2, [r1, #0x30]
    ldr r2, [r3, #0x6c]
    ldr r1, [r0, #0x4c]
    str r2, [r1, #0x30]
    ldr r1, [r3, #0x70]
    ldr r0, [r0, #0x4c]
    str r1, [r0, #0x34]
    b .L_02204a60
.L_02203810:
    cmp r0, #0x0
    bne .L_02204344
    add r0, sp, #0x1a4
    bl VecFx32Object_Init
    add r0, sp, #0x1b4
    bl VecFx32Object_Init
    add r0, sp, #0x1c4
    bl VecFx32Object_Init
    add r0, sp, #0x1d4
    bl VecFx32Object_Init
    add r0, sp, #0x194
    bl VecFx32Object_Init
    ldr r0, [r8, #0x4b8]
    ldr r1, .L_022044ac
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r2, r0, lsl #0x1
    add r0, r1, r0, lsl #0x1
    ldrsh r5, [r1, r2]
    ldrsh r0, [r0, #0x2]
    ldr r1, [r8, #0x93c]
    mov r2, #0xa
    rsb r4, r0, #0x0
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r0, r0, asr #0x2
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    add r1, r1, r0, ror #0x1f
    mul r0, r1, r2
    add r1, r8, r7, lsl #0x2
    str r0, [sp, #0x1c]
    ldr r1, [r1, #0x790]
    mov r0, r8
    bl func_ov041_0220333c
    str r0, [sp, #0x8]
    mov r2, #0x0
    str r2, [sp, #0x198]
    str r2, [sp, #0x19c]
    ldr r0, [r8, #0x938]
    cmp r0, #0x0
    bne .L_02204088
    sub r0, r2, #0x5
    mov r1, r0
    mul r3, r5, r0
    mov r9, #0x23
    mul r10, r4, r1
    mul r1, r5, r9
    mul r0, r4, r9
    mov r9, r4, lsl #0x4
    rsb r11, r9, #0x0
    sub r9, r11, r3
    rsb ip, r3, r4, lsl #0x4
    sub r3, r11, r1
    rsb r1, r1, r4, lsl #0x4
    str r1, [sp, #0x38]
    mov r1, r9, asr #0x1f
    str r1, [sp, #0x28]
    mov r1, r5, lsl #0x4
    rsb r1, r1, #0x0
    add lr, r1, r10
    add r1, r1, r0
    add r0, r0, r5, lsl #0x4
    str r0, [sp, #0x40]
    mov r0, lr, asr #0x1f
    str r0, [sp, #0x2c]
    mov r0, ip, asr #0x1f
    str r3, [sp, #0x48]
    add r11, r10, r5, lsl #0x4
    str r0, [sp, #0x30]
    mov r0, r11, asr #0x1f
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x38]
    mov r3, #0x1800
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0x40]
    str r1, [sp, #0xd8]
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x48]
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x4c]
    mov r0, r1
    umull r1, r10, r9, r3
    str r1, [sp, #0x24]
    mla r10, r9, r2, r10
    ldr r1, [sp, #0x28]
    mov r0, r0, asr #0x1f
    mla r10, r1, r3, r10
    ldr r1, [sp, #0x24]
    str r0, [sp, #0x50]
    adds r1, r1, #0x800
    str r1, [sp, #0x20]
    adc r9, r10, r2
    mov r1, r1, lsr #0xc
    orr r1, r1, r9, lsl #0x14
    str r1, [sp, #0x1a8]
    umull r9, r1, lr, r3
    adds r9, r9, #0x800
    mla r1, lr, r2, r1
    ldr r10, [sp, #0x2c]
    mov r9, r9, lsr #0xc
    mla r1, r10, r3, r1
    adc r1, r1, r2
    orr r9, r9, r1, lsl #0x14
    str r9, [sp, #0x1ac]
    umull r10, r9, ip, r3
    mla r9, ip, r2, r9
    ldr r1, [sp, #0x30]
    adds r10, r10, #0x800
    mla r9, r1, r3, r9
    adc r1, r9, r2
    mov r9, r10, lsr #0xc
    orr r9, r9, r1, lsl #0x14
    str r9, [sp, #0x1b8]
    umull r10, r9, r11, r3
    mov r0, #0x4
    mla r9, r11, r2, r9
    ldr r1, [sp, #0x34]
    adds r10, r10, #0x800
    mla r9, r1, r3, r9
    adc r1, r9, r2
    mov r9, r10, lsr #0xc
    orr r9, r9, r1, lsl #0x14
    ldr r1, [sp, #0x38]
    str r9, [sp, #0x1bc]
    umull r10, r9, r1, r3
    mla r9, r1, r2, r9
    ldr r1, [sp, #0x3c]
    adds r10, r10, #0x800
    mla r9, r1, r3, r9
    adc r1, r9, r2
    mov r9, r10, lsr #0xc
    orr r9, r9, r1, lsl #0x14
    ldr r1, [sp, #0x40]
    str r9, [sp, #0x1c8]
    umull r10, r9, r1, r3
    mla r9, r1, r2, r9
    ldr r1, [sp, #0x44]
    adds r10, r10, #0x800
    mla r9, r1, r3, r9
    adc r1, r9, r2
    mov r9, r10, lsr #0xc
    orr r9, r9, r1, lsl #0x14
    ldr r1, [sp, #0x48]
    str r9, [sp, #0x1cc]
    umull r10, r9, r1, r3
    mla r9, r1, r2, r9
    ldr r1, [sp, #0x4c]
    adds r10, r10, #0x800
    mla r9, r1, r3, r9
    adc r1, r9, r2
    mov r9, r10, lsr #0xc
    orr r9, r9, r1, lsl #0x14
    ldr r1, [sp, #0xd8]
    str r9, [sp, #0x1d8]
    umull r10, r9, r1, r3
    mla r9, r1, r2, r9
    ldr r1, [sp, #0x50]
    sub r0, r0, #0x1
    mla r9, r1, r3, r9
    adds r3, r10, #0x800
    adc r1, r9, r2
    mov r3, r3, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    str r3, [sp, #0x1dc]
    add r3, sp, #0x1a4
    add r1, sp, #0x1e4
.L_02203ab4:
    add r11, r3, r0, lsl #0x4
    ldr ip, [r8, #0x6c]
    ldr r10, [r11, #0x4]
    add r9, r1, r0, lsl #0x3
    add r10, ip, r10
    add r10, r2, r10
    mov r10, r10, asr #0xc
    str r10, [r1, r0, lsl #0x3]
    ldr r10, [r11, #0x8]
    ldr r11, [r8, #0x70]
    subs r0, r0, #0x1
    add r10, r11, r10
    add r10, r2, r10
    mov r10, r10, asr #0xc
    str r10, [r9, #0x4]
    bpl .L_02203ab4
    mvn r0, #0x4
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x48]
    ldr r2, [sp, #0x1c]
    add r9, sp, #0x2a4
    ldr r0, [r0, #0x18]
    ldr r3, [sp, #0x8]
    add r2, r9, r2, lsl #0x3
    bl func_0209c87c
    mvn r1, #0xc
    mul r0, r4, r1
    mul r2, r5, r1
    str r0, [sp, #0xc]
    rsb r0, r2, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x198]
    ldr r0, [sp, #0xc]
    ldr r4, .L_022044ac
    str r0, [sp, #0x19c]
    ldr r5, [r8, #0x4b8]
    ldr r0, [r8, #0x940]
    mov r3, #0x800
    sub r0, r5, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r5, r0, lsl #0x1
    add r0, r4, r5, lsl #0x1
    mov r5, r5, lsl #0x1
    ldrsh r5, [r4, r5]
    ldrsh r4, [r0, #0x2]
    sub r0, r1, #0x23
    mul r9, r5, r0
    rsb r4, r4, #0x0
    add r0, r1, #0x2
    mul r1, r4, r0
    sub r0, r3, #0x830
    mul r3, r4, r0
    sub r0, r1, r5, lsl #0x4
    sub r11, r1, r9
    str r0, [sp, #0xdc]
    mov r0, r11, asr #0x1f
    mov r2, #0x0
    str r0, [sp, #0x5c]
    sub r0, r2, #0xb
    mul r0, r5, r0
    add r10, r0, r3
    add r0, r0, r4, lsl #0x4
    str r0, [sp, #0x7c]
    mov r0, r10, asr #0x1f
    str r0, [sp, #0x60]
    mov r0, #0x15
    mul ip, r4, r0
    smulbb r0, r5, r0
    add r3, r0, r3
    add r0, r0, r4, lsl #0x4
    sub r9, ip, r9
    str r0, [sp, #0x70]
    mov r0, r9, asr #0x1f
    str r0, [sp, #0x64]
    mov r0, r3, asr #0x1f
    sub lr, ip, r5, lsl #0x4
    str r0, [sp, #0x68]
    mov r0, lr, asr #0x1f
    str r0, [sp, #0x6c]
    ldr r0, [sp, #0x70]
    mov r1, #0x1800
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x74]
    ldr r0, [sp, #0xdc]
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x78]
    ldr r0, [sp, #0x7c]
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x80]
    umull r0, ip, r11, r1
    str r0, [sp, #0x58]
    mla ip, r11, r2, ip
    ldr r0, [sp, #0x5c]
    mla ip, r0, r1, ip
    ldr r0, [sp, #0x58]
    adds r0, r0, #0x800
    str r0, [sp, #0x54]
    adc r11, ip, #0x0
    mov r0, r0, lsr #0xc
    orr r0, r0, r11, lsl #0x14
    str r0, [sp, #0x1a8]
    umull r11, r0, r10, r1
    mla r0, r10, r2, r0
    ldr r10, [sp, #0x60]
    mla r0, r10, r1, r0
    adds r10, r11, #0x800
    adc r0, r0, #0x0
    mov r10, r10, lsr #0xc
    orr r10, r10, r0, lsl #0x14
    str r10, [sp, #0x1ac]
    umull r11, r10, r9, r1
    mla r10, r9, r2, r10
    ldr r0, [sp, #0x64]
    adds r9, r11, #0x800
    mla r10, r0, r1, r10
    adc r0, r10, #0x0
    mov r9, r9, lsr #0xc
    orr r9, r9, r0, lsl #0x14
    str r9, [sp, #0x1b8]
    umull r10, r9, r3, r1
    mla r9, r3, r2, r9
    ldr r0, [sp, #0x68]
    adds r3, r10, #0x800
    mla r9, r0, r1, r9
    adc r0, r9, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    str r3, [sp, #0x1bc]
    umull r9, r3, lr, r1
    mla r3, lr, r2, r3
    ldr r0, [sp, #0x6c]
    adds r9, r9, #0x800
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r3, r9, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    ldr r0, [sp, #0x70]
    str r3, [sp, #0x1c8]
    umull r9, r3, r0, r1
    mla r3, r0, r2, r3
    ldr r0, [sp, #0x74]
    adds r9, r9, #0x800
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r3, r9, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    ldr r0, [sp, #0xdc]
    str r3, [sp, #0x1cc]
    umull r9, r3, r0, r1
    mla r3, r0, r2, r3
    ldr r0, [sp, #0x78]
    adds r9, r9, #0x800
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r3, r9, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    ldr r0, [sp, #0x7c]
    str r3, [sp, #0x1d8]
    umull r9, r3, r0, r1
    mla r3, r0, r2, r3
    ldr r0, [sp, #0x80]
    mla r3, r0, r1, r3
    adds r1, r9, #0x800
    adc r0, r3, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [sp, #0x1dc]
    mov r0, #0x4
    sub r2, r0, #0x1
    add r0, sp, #0x1a4
    add r1, sp, #0x1e4
.L_02203d68:
    add r10, r0, r2, lsl #0x4
    ldr r11, [r8, #0x6c]
    ldr r3, [r10, #0x4]
    add r9, r1, r2, lsl #0x3
    add r11, r11, r3
    ldr r3, [sp, #0x10]
    add r3, r3, r11
    mov r3, r3, asr #0xc
    str r3, [r1, r2, lsl #0x3]
    ldr r3, [r10, #0x8]
    ldr r10, [r8, #0x70]
    subs r2, r2, #0x1
    add r10, r10, r3
    ldr r3, [sp, #0xc]
    add r3, r3, r10
    mov r3, r3, asr #0xc
    str r3, [r9, #0x4]
    bpl .L_02203d68
    mvn r0, #0x3
    str r0, [sp, #0x0]
    ldr r0, [sp, #0x1c]
    ldr r3, [r8, #0x48]
    add r2, r0, #0x2
    add r9, sp, #0x2a4
    ldr r0, [r3, #0x18]
    ldr r3, [sp, #0x8]
    add r2, r9, r2, lsl #0x3
    bl func_0209c87c
    ldr r0, [sp, #0x198]
    mvn r1, #0x2
    sub r2, r4, r5
    mla r0, r2, r1, r0
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x19c]
    add r2, r5, r4
    mla r0, r2, r1, r0
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x18]
    ldr r2, .L_022044ac
    str r0, [sp, #0x198]
    ldr r0, [sp, #0x14]
    mov ip, #0x0
    str r0, [sp, #0x19c]
    ldr r3, [r8, #0x4b8]
    ldr r0, [r8, #0x940]
    mov r11, #0x1800
    add r0, r3, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    mov r4, r3, lsl #0x1
    add r0, r2, r3, lsl #0x1
    ldrsh r3, [r0, #0x2]
    ldrsh r5, [r2, r4]
    sub r0, r1, #0x27
    sub r2, ip, #0x17
    mul r10, r5, r0
    rsb r9, r3, #0x0
    sub r0, r1, #0x14
    mul r4, r9, r0
    sub r3, r4, r10
    mov r1, r3, asr #0x1f
    str r1, [sp, #0x84]
    sub r1, ip, #0x2a
    rsb r0, r10, r9, lsl #0x3
    mul r2, r5, r2
    mul r10, r9, r1
    add r1, r2, r10
    add r10, r10, r5, lsl #0x3
    str r10, [sp, #0x90]
    mov r10, r1, asr #0x1f
    str r10, [sp, #0x88]
    mov r10, r0, asr #0x1f
    str r10, [sp, #0x8c]
    ldr r10, [sp, #0x90]
    mov r10, r10, asr #0x1f
    str r10, [sp, #0x94]
    mov r10, #0x6
    smulbb lr, r5, r10
    mul r10, r9, r10
    add r2, r2, r10
    add r5, r10, r5, lsl #0x3
    str r2, [sp, #0xa0]
    mov r2, r5, asr #0x1f
    sub r4, r4, lr
    str r2, [sp, #0x98]
    mov r2, r4, asr #0x1f
    str r2, [sp, #0x9c]
    ldr r2, [sp, #0xa0]
    rsb r9, lr, r9, lsl #0x3
    mov r2, r2, asr #0x1f
    str r2, [sp, #0xa4]
    umull r10, r2, r3, r11
    mla r2, r3, ip, r2
    ldr r3, [sp, #0x84]
    mov lr, r9, asr #0x1f
    mla r2, r3, r11, r2
    adds r3, r10, #0x800
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [sp, #0x1a8]
    umull r3, r2, r1, r11
    mla r2, r1, ip, r2
    ldr r1, [sp, #0x88]
    adds r3, r3, #0x800
    mla r2, r1, r11, r2
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [sp, #0x1ac]
    umull r2, r1, r0, r11
    mla r1, r0, ip, r1
    ldr r0, [sp, #0x8c]
    adds r2, r2, #0x800
    mla r1, r0, r11, r1
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r2, [sp, #0x90]
    str r1, [sp, #0x1b8]
    umull r1, r0, r2, r11
    mla r0, r2, ip, r0
    ldr r2, [sp, #0x94]
    adds r1, r1, #0x800
    mla r0, r2, r11, r0
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [sp, #0x1bc]
    umull r1, r0, r9, r11
    mla r0, r9, ip, r0
    adds r1, r1, #0x800
    mla r0, lr, r11, r0
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [sp, #0x1c8]
    umull r2, r1, r5, r11
    mla r1, r5, ip, r1
    ldr r0, [sp, #0x98]
    adds r2, r2, #0x800
    mla r1, r0, r11, r1
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [sp, #0x1cc]
    umull r2, r1, r4, r11
    mla r1, r4, ip, r1
    ldr r0, [sp, #0x9c]
    adds r2, r2, #0x800
    mla r1, r0, r11, r1
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r0, [sp, #0xa0]
    str r1, [sp, #0x1d8]
    umull r2, r1, r0, r11
    mla r1, r0, ip, r1
    ldr r0, [sp, #0xa4]
    adds r2, r2, #0x800
    mla r1, r0, r11, r1
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [sp, #0x1dc]
    mov r0, #0x4
    sub r2, r0, #0x1
    add r0, sp, #0x1a4
    add r1, sp, #0x1e4
.L_02204014:
    add r9, r0, r2, lsl #0x4
    ldr r5, [r8, #0x6c]
    ldr r3, [r9, #0x4]
    add r4, r1, r2, lsl #0x3
    add r5, r5, r3
    ldr r3, [sp, #0x18]
    add r3, r3, r5
    mov r3, r3, asr #0xc
    str r3, [r1, r2, lsl #0x3]
    ldr r5, [r8, #0x70]
    ldr r3, [r9, #0x8]
    subs r2, r2, #0x1
    add r5, r5, r3
    ldr r3, [sp, #0x14]
    add r3, r3, r5
    mov r3, r3, asr #0xc
    str r3, [r4, #0x4]
    bpl .L_02204014
    mvn r0, #0x2
    str r0, [sp, #0x0]
    ldr r0, [sp, #0x1c]
    ldr r3, [r8, #0x48]
    add r2, r0, #0x4
    add r4, sp, #0x2a4
    ldr r0, [r3, #0x18]
    ldr r3, [sp, #0x8]
    add r2, r4, r2, lsl #0x3
    bl func_0209c87c
    b .L_02204318
.L_02204088:
    ldr r0, [r8, #0x4b8]
    mov r4, #0x30
    add r0, r0, #0x4000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    ldr r0, .L_022044ac
    mov r1, r3, lsl #0x1
    ldrsh r11, [r0, r1]
    add r0, r0, r3, lsl #0x1
    ldrsh r0, [r0, #0x2]
    sub r1, r4, #0x4c
    mov r10, #0x1c
    rsb ip, r0, #0x0
    mov r0, ip, lsl #0x4
    mov r9, r1
    mov r5, r11, lsl #0x4
    rsb r3, r0, #0x0
    rsb r0, r5, #0x0
    mul r5, r11, r1
    mul r1, ip, r9
    smulbb r9, r11, r10
    mul r10, ip, r10
    str r10, [sp, #0xb4]
    mul r10, ip, r4
    smulbb ip, r11, r4
    sub r11, r3, r9
    sub r3, r3, r5
    sub r4, r10, r5
    str r3, [sp, #0xe0]
    mov r3, r11, asr #0x1f
    str r3, [sp, #0xb0]
    ldr r5, [sp, #0xb4]
    sub r9, r10, r9
    add r10, r0, r5
    add r0, r0, r1
    str r0, [sp, #0xd0]
    mov r0, r10, asr #0x1f
    str r0, [sp, #0xb8]
    mov r0, r9, asr #0x1f
    mov r3, #0x1800
    add r5, ip, r5
    add lr, ip, r1
    umull r1, ip, r11, r3
    str r1, [sp, #0xac]
    str r0, [sp, #0xbc]
    mov r0, r5, asr #0x1f
    str r0, [sp, #0xc0]
    mla ip, r11, r2, ip
    ldr r1, [sp, #0xb0]
    mov r0, r4, asr #0x1f
    mla ip, r1, r3, ip
    ldr r1, [sp, #0xac]
    str r0, [sp, #0xc4]
    adds r1, r1, #0x800
    str r1, [sp, #0xa8]
    adc r11, ip, r2
    mov r1, r1, lsr #0xc
    orr r1, r1, r11, lsl #0x14
    str r1, [sp, #0x1a8]
    umull r11, r1, r10, r3
    mla r1, r10, r2, r1
    ldr r10, [sp, #0xb8]
    mov r0, lr, asr #0x1f
    mla r1, r10, r3, r1
    adds r10, r11, #0x800
    str r0, [sp, #0xc8]
    ldr r0, [sp, #0xe0]
    adc r1, r1, r2
    mov r10, r10, lsr #0xc
    orr r10, r10, r1, lsl #0x14
    str r10, [sp, #0x1ac]
    umull r11, r10, r9, r3
    mla r10, r9, r2, r10
    ldr r1, [sp, #0xbc]
    adds r9, r11, #0x800
    mla r10, r1, r3, r10
    mov r0, r0, asr #0x1f
    str r0, [sp, #0xcc]
    ldr r0, [sp, #0xd0]
    adc r1, r10, r2
    mov r9, r9, lsr #0xc
    orr r9, r9, r1, lsl #0x14
    str r9, [sp, #0x1b8]
    umull r10, r9, r5, r3
    mla r9, r5, r2, r9
    ldr r1, [sp, #0xc0]
    adds r5, r10, #0x800
    mla r9, r1, r3, r9
    mov r0, r0, asr #0x1f
    str r0, [sp, #0xd4]
    mov r0, #0x4
    adc r1, r9, r2
    mov r5, r5, lsr #0xc
    orr r5, r5, r1, lsl #0x14
    str r5, [sp, #0x1bc]
    umull r9, r5, r4, r3
    mla r5, r4, r2, r5
    ldr r1, [sp, #0xc4]
    adds r4, r9, #0x800
    mla r5, r1, r3, r5
    adc r1, r5, r2
    mov r4, r4, lsr #0xc
    orr r4, r4, r1, lsl #0x14
    str r4, [sp, #0x1c8]
    umull r5, r4, lr, r3
    mla r4, lr, r2, r4
    ldr r1, [sp, #0xc8]
    adds r5, r5, #0x800
    mla r4, r1, r3, r4
    adc r1, r4, r2
    mov r4, r5, lsr #0xc
    orr r4, r4, r1, lsl #0x14
    ldr r1, [sp, #0xe0]
    str r4, [sp, #0x1cc]
    umull r5, r4, r1, r3
    mla r4, r1, r2, r4
    ldr r1, [sp, #0xcc]
    adds r5, r5, #0x800
    mla r4, r1, r3, r4
    adc r1, r4, r2
    mov r4, r5, lsr #0xc
    orr r4, r4, r1, lsl #0x14
    ldr r1, [sp, #0xd0]
    str r4, [sp, #0x1d8]
    umull r5, r4, r1, r3
    mla r4, r1, r2, r4
    ldr r1, [sp, #0xd4]
    sub r0, r0, #0x1
    mla r4, r1, r3, r4
    adds r3, r5, #0x800
    adc r1, r4, r2
    mov r3, r3, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    str r3, [sp, #0x1dc]
    add r3, sp, #0x1a4
    add r1, sp, #0x1e4
.L_022042b0:
    add r10, r3, r0, lsl #0x4
    ldr r9, [r8, #0x6c]
    ldr r5, [r10, #0x4]
    add r4, r1, r0, lsl #0x3
    add r5, r9, r5
    add r5, r2, r5
    mov r5, r5, asr #0xc
    str r5, [r1, r0, lsl #0x3]
    ldr r9, [r8, #0x70]
    ldr r5, [r10, #0x8]
    subs r0, r0, #0x1
    add r5, r9, r5
    add r5, r2, r5
    mov r5, r5, asr #0xc
    str r5, [r4, #0x4]
    bpl .L_022042b0
    mvn r0, #0x3
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x48]
    ldr r3, [sp, #0x8]
    ldr r0, [r0, #0x18]
    add r2, sp, #0x344
    bl func_0209c87c
    ldr r0, [r8, #0x938]
    sub r0, r0, #0x1
    str r0, [r8, #0x938]
.L_02204318:
    add r0, sp, #0x194
    bl VecFx32Object_Destroy
    add r0, sp, #0x1d4
    bl VecFx32Object_Destroy
    add r0, sp, #0x1c4
    bl VecFx32Object_Destroy
    add r0, sp, #0x1b4
    bl VecFx32Object_Destroy
    add r0, sp, #0x1a4
    bl VecFx32Object_Destroy
    b .L_02204420
.L_02204344:
    rsb r1, r0, #0x1000
    mov r0, #0x1c
    mul r0, r1, r0
    mov r1, r0, asr #0xc
    ldr r0, [r8, #0x6c]
    add r1, r1, #0x8
    rsb r0, r1, r0, asr #0xc
    str r0, [sp, #0x1e4]
    ldr r3, [r8, #0x70]
    mov r0, r8
    rsb r3, r1, r3, asr #0xc
    str r3, [sp, #0x1e8]
    ldr r3, [r8, #0x6c]
    add r3, r1, r3, asr #0xc
    str r3, [sp, #0x1ec]
    ldr r3, [r8, #0x70]
    rsb r3, r1, r3, asr #0xc
    str r3, [sp, #0x1f0]
    ldr r3, [r8, #0x6c]
    add r3, r1, r3, asr #0xc
    str r3, [sp, #0x1f4]
    ldr r3, [r8, #0x70]
    add r3, r1, r3, asr #0xc
    str r3, [sp, #0x1f8]
    ldr r3, [r8, #0x6c]
    rsb r3, r1, r3, asr #0xc
    str r3, [sp, #0x1fc]
    ldr r3, [r8, #0x70]
    add r1, r1, r3, asr #0xc
    str r1, [sp, #0x200]
    ldr r1, [r2, #0x624]
    bl func_ov041_0220333c
    ldr r1, [r8, #0x928]
    mov r3, r0
    cmp r1, #0x0
    add r1, sp, #0x1e4
    ble .L_02204408
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0x624]
    add r2, sp, #0x2e4
    add r0, r7, r0, asr #0x2
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x48]
    ldr r0, [r0, #0x18]
    bl func_0209c87c
    b .L_02204420
.L_02204408:
    mvn r0, #0x2
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x48]
    add r2, sp, #0x2d4
    ldr r0, [r0, #0x18]
    bl func_0209c87c
.L_02204420:
    add r0, r8, r6, lsl #0x2
    ldr r1, [r0, #0x4c]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_02204a60
.L_02204438:
    cmp r7, #0x4e
    bne .L_0220483c
    add r5, r8, r7, lsl #0x2
    ldr r0, [r5, #0x790]
    cmp r0, #0x1000
    bge .L_02204a78
    ldr r0, [r5, #0x624]
    cmp r0, #0x1000
    bne .L_022044b0
    add r0, r8, r6, lsl #0x2
    ldr r4, [r0, #0x4c]
    mov r1, #0xc
    ldrh r2, [r4, #0x42]
    mla r3, r7, r1, r8
    bic r1, r2, #0x4
    strh r1, [r4, #0x42]
    ldr r1, [r0, #0x4c]
    ldr r2, [r5, #0x4b8]
    ldr r1, [r1, #0xc]
    sub r2, r2, #0x8000
    strh r2, [r1, #0x30]
    ldr r2, [r3, #0x6c]
    ldr r1, [r0, #0x4c]
    str r2, [r1, #0x30]
    ldr r1, [r3, #0x70]
    ldr r0, [r0, #0x4c]
    str r1, [r0, #0x34]
    b .L_02204a60
.L_022044a8: .word 0xfff
.L_022044ac: .word data_020c9670
.L_022044b0:
    cmp r0, #0x0
    bne .L_02204658
    add r0, sp, #0x154
    bl VecFx32Object_Init
    add r0, sp, #0x164
    bl VecFx32Object_Init
    add r0, sp, #0x174
    bl VecFx32Object_Init
    add r0, sp, #0x184
    bl VecFx32Object_Init
    add r0, sp, #0x144
    bl VecFx32Object_Init
    mov r1, r5
    ldr r0, [r1, #0x4b8]
    ldr r3, .L_022044ac
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r4, r0, lsl #0x1
    ldr r2, [r8, #0x93c]
    add r0, r3, r0, lsl #0x1
    ldrsh r9, [r3, r4]
    ldrsh r3, [r0, #0x2]
    mov r0, r2, asr #0x1
    add r0, r2, r0, lsr #0x1e
    mov r0, r0, asr #0x2
    mov r2, r0, lsr #0x1f
    rsb r0, r2, r0, lsl #0x1f
    add r0, r2, r0, ror #0x1f
    mov r4, r0, lsl #0x1
    ldr r1, [r1, #0x790]
    mov r0, r8
    rsb r5, r3, #0x0
    bl func_ov041_0220333c
    mov ip, #0x0
    mov r3, r0
    sub r11, r5, r9
    sub r0, ip, #0x18
    mul r0, r11, r0
    str r0, [sp, #0x158]
    add r2, r9, r5
    sub r0, ip, #0x18
    mul r0, r2, r0
    str r0, [sp, #0x15c]
    sub r0, ip, #0x18
    mul r10, r9, r0
    mov r0, #0x18
    smulbb r1, r9, r0
    mul r9, r11, r0
    str r9, [sp, #0x178]
    mul r9, r2, r0
    mul r2, r5, r0
    sub r0, r0, #0x30
    str r9, [sp, #0x17c]
    mul r9, r5, r0
    add r0, r10, r2
    sub r5, r2, r10
    str r0, [sp, #0x18c]
    sub r0, r9, r1
    add r2, r1, r9
    str r0, [sp, #0x188]
    mov r0, #0x4
    sub r10, r0, #0x1
    mov r0, #0xc
    mla r11, r7, r0, r8
    str ip, [sp, #0x148]
    str ip, [sp, #0x14c]
    str r5, [sp, #0x168]
    str r2, [sp, #0x16c]
    add lr, sp, #0x154
    add r1, sp, #0x1e4
.L_022045d0:
    add r5, lr, r10, lsl #0x4
    ldr r9, [r11, #0x6c]
    ldr r2, [r5, #0x4]
    add r0, r1, r10, lsl #0x3
    add r2, r9, r2
    add r2, ip, r2
    mov r2, r2, asr #0xc
    str r2, [r1, r10, lsl #0x3]
    ldr r2, [r11, #0x70]
    ldr r5, [r5, #0x8]
    subs r10, r10, #0x1
    add r2, r2, r5
    add r2, ip, r2
    mov r2, r2, asr #0xc
    str r2, [r0, #0x4]
    bpl .L_022045d0
    mvn r0, #0x63
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x48]
    add r2, sp, #0x244
    ldr r0, [r0, #0x18]
    add r2, r2, r4, lsl #0x3
    bl func_0209c87c
    add r0, sp, #0x144
    bl VecFx32Object_Destroy
    add r0, sp, #0x184
    bl VecFx32Object_Destroy
    add r0, sp, #0x174
    bl VecFx32Object_Destroy
    add r0, sp, #0x164
    bl VecFx32Object_Destroy
    add r0, sp, #0x154
    bl VecFx32Object_Destroy
    b .L_02204824
.L_02204658:
    add r0, sp, #0x104
    bl VecFx32Object_Init
    add r0, sp, #0x114
    bl VecFx32Object_Init
    add r0, sp, #0x124
    bl VecFx32Object_Init
    add r0, sp, #0x134
    bl VecFx32Object_Init
    mov r1, r5
    ldr r4, [r8, #0x93c]
    ldr r0, [r1, #0x624]
    mov r3, r4, asr #0x1
    add r3, r4, r3, lsr #0x1e
    mov r3, r3, asr #0x2
    ldr r1, [r1, #0x4b8]
    mov r4, r3, lsr #0x1f
    rsb r3, r4, r3, lsl #0x1f
    mov r1, r1, lsl #0x10
    add r3, r4, r3, ror #0x1f
    rsb r4, r0, #0x1000
    mov r0, #0x14
    mul r0, r4, r0
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    mov r0, r0, asr #0xc
    ldr r9, .L_022044ac
    mov r10, r1, lsl #0x1
    add r1, r9, r1, lsl #0x1
    ldrsh r2, [r1, #0x2]
    ldrsh r1, [r9, r10]
    add r0, r0, #0x4
    rsb r2, r2, #0x0
    mov r10, #0x4
    mov r4, r3, lsl #0x1
    mov r5, #0xc
    rsb r9, r0, #0x0
    sub r11, r2, r1
    sub r3, r10, #0x1
    mul r10, r9, r11
    str r10, [sp, #0x108]
    mul r10, r0, r11
    add r11, r1, r2
    str r10, [sp, #0x128]
    mul r10, r9, r11
    str r10, [sp, #0x10c]
    mul r10, r0, r11
    str r10, [sp, #0x12c]
    mul r11, r1, r9
    mul r10, r2, r0
    mul ip, r1, r0
    mul r9, r2, r9
    sub r1, r10, r11
    add r0, r11, r10
    str r1, [sp, #0x118]
    add r2, ip, r9
    sub r1, r9, ip
    str r0, [sp, #0x13c]
    mla r5, r7, r5, r8
    str r2, [sp, #0x11c]
    str r1, [sp, #0x138]
    add r0, sp, #0x104
    add r10, sp, #0x1e4
.L_02204754:
    ldr r9, [r5, #0x6c]
    add r2, r0, r3, lsl #0x4
    ldmib r2, {r1, r2}
    add r1, r9, r1
    mov r1, r1, asr #0xc
    str r1, [r10, r3, lsl #0x3]
    ldr r9, [r5, #0x70]
    add r1, r10, r3, lsl #0x3
    add r2, r9, r2
    mov r2, r2, asr #0xc
    str r2, [r1, #0x4]
    subs r3, r3, #0x1
    bpl .L_02204754
    add r0, r8, r7, lsl #0x2
    ldr r1, [r0, #0x624]
    mov r0, r8
    bl func_ov041_0220333c
    add r1, r8, r7, lsl #0x2
    ldr r2, [r1, #0x624]
    ldr r1, [r1, #0x620]
    mov r3, r0
    add r0, r7, r2, asr #0x2
    cmp r2, r1
    add r5, sp, #0x244
    rsb r0, r0, #0x0
    add r1, sp, #0x1e4
    bge .L_022047e4
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x48]
    add r2, r4, #0x4
    ldr r0, [r0, #0x18]
    add r2, r5, r2, lsl #0x3
    bl func_0209c87c
    b .L_02204804
.L_022047e4:
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x48]
    add r2, r4, #0x8
    ldr r0, [r0, #0x18]
    add r2, r5, r2, lsl #0x3
    bl func_0209c87c
.L_02204804:
    add r0, sp, #0x134
    bl VecFx32Object_Destroy
    add r0, sp, #0x124
    bl VecFx32Object_Destroy
    add r0, sp, #0x114
    bl VecFx32Object_Destroy
    add r0, sp, #0x104
    bl VecFx32Object_Destroy
.L_02204824:
    add r0, r8, r6, lsl #0x2
    ldr r1, [r0, #0x4c]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_02204a60
.L_0220483c:
    add r1, r8, r7, lsl #0x2
    ldr r0, [r1, #0x790]
    cmp r0, #0x1000
    bge .L_02204a78
    ldr r4, [r1, #0x624]
    cmp r4, #0x1000
    bne .L_02204890
    add r4, r8, r6, lsl #0x2
    ldr r3, [r4, #0x4c]
    mov r0, #0xc
    ldrh r1, [r3, #0x42]
    mla r2, r7, r0, r8
    bic r0, r1, #0x4
    strh r0, [r3, #0x42]
    ldr r1, [r2, #0x6c]
    ldr r0, [r4, #0x4c]
    str r1, [r0, #0x30]
    ldr r1, [r2, #0x70]
    ldr r0, [r4, #0x4c]
    str r1, [r0, #0x34]
    b .L_02204a60
.L_02204890:
    ldr r0, [r8, #0x93c]
    mov r1, #0x7
    add r0, r0, r7
    bl func_020befec
    cmp r1, #0x4
    rsbge r1, r1, #0x7
    cmp r4, #0x0
    rsb r2, r1, #0x18
    mov r0, #0xc
    bne .L_02204978
    mla r1, r7, r0, r8
    ldr r0, [r1, #0x6c]
    add r3, r8, r7, lsl #0x2
    sub r0, r0, r2, lsl #0xc
    mov r0, r0, asr #0xc
    str r0, [sp, #0x1e4]
    ldr r4, [r1, #0x70]
    mov r0, r8
    sub r4, r4, r2, lsl #0xc
    mov r4, r4, asr #0xc
    str r4, [sp, #0x1e8]
    ldr r4, [r1, #0x6c]
    add r4, r4, r2, lsl #0xc
    mov r4, r4, asr #0xc
    str r4, [sp, #0x1ec]
    ldr r4, [r1, #0x70]
    sub r4, r4, r2, lsl #0xc
    mov r4, r4, asr #0xc
    str r4, [sp, #0x1f0]
    ldr r4, [r1, #0x6c]
    add r4, r4, r2, lsl #0xc
    mov r4, r4, asr #0xc
    str r4, [sp, #0x1f4]
    ldr r4, [r1, #0x70]
    add r4, r4, r2, lsl #0xc
    mov r4, r4, asr #0xc
    str r4, [sp, #0x1f8]
    ldr r4, [r1, #0x6c]
    sub r4, r4, r2, lsl #0xc
    mov r4, r4, asr #0xc
    str r4, [sp, #0x1fc]
    ldr r1, [r1, #0x70]
    add r1, r1, r2, lsl #0xc
    mov r1, r1, asr #0xc
    str r1, [sp, #0x200]
    ldr r1, [r3, #0x790]
    bl func_ov041_0220333c
    rsb r1, r7, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [sp, #0x0]
    ldr r1, [r8, #0x48]
    mov r3, r0
    ldr r0, [r1, #0x18]
    add r1, sp, #0x1e4
    add r2, sp, #0x204
    bl func_0209c87c
    b .L_02204a4c
.L_02204978:
    mla r2, r7, r0, r8
    rsb r1, r4, #0x1000
    mov r0, #0x14
    mul r0, r1, r0
    mov r1, r0, asr #0xc
    ldr r0, [r2, #0x6c]
    add r1, r1, #0x4
    rsb r0, r1, r0, asr #0xc
    str r0, [sp, #0x1e4]
    ldr r0, [r2, #0x70]
    add r3, r8, r7, lsl #0x2
    rsb r0, r1, r0, asr #0xc
    str r0, [sp, #0x1e8]
    ldr r4, [r2, #0x6c]
    mov r0, r8
    add r4, r1, r4, asr #0xc
    str r4, [sp, #0x1ec]
    ldr r4, [r2, #0x70]
    rsb r4, r1, r4, asr #0xc
    str r4, [sp, #0x1f0]
    ldr r4, [r2, #0x6c]
    add r4, r1, r4, asr #0xc
    str r4, [sp, #0x1f4]
    ldr r4, [r2, #0x70]
    add r4, r1, r4, asr #0xc
    str r4, [sp, #0x1f8]
    ldr r4, [r2, #0x6c]
    rsb r4, r1, r4, asr #0xc
    str r4, [sp, #0x1fc]
    ldr r2, [r2, #0x70]
    add r1, r1, r2, asr #0xc
    str r1, [sp, #0x200]
    ldr r1, [r3, #0x624]
    bl func_ov041_0220333c
    mov r4, r0
    mov r0, r6
    mov r1, #0x3
    bl func_020befec
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0x624]
    mov r3, r4
    add r0, r7, r0, asr #0x2
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x48]
    mov r4, r1
    add r2, sp, #0x204
    ldr r0, [r0, #0x18]
    add r1, sp, #0x1e4
    add r2, r2, r4, lsl #0x4
    bl func_0209c87c
.L_02204a4c:
    add r0, r8, r6, lsl #0x2
    ldr r1, [r0, #0x4c]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
.L_02204a60:
    add r0, r8, r6, lsl #0x2
    ldr r0, [r0, #0x4c]
    add r1, sp, #0x234
    mov r2, #0x1
    bl func_0209a2ac
    add r6, r6, #0x1
.L_02204a78:
    add r7, r7, #0xd
    cmp r7, #0x5b
    blt .L_022037a0
    ldr r0, [r8, #0x48]
    ldr r0, [r0, #0x18]
    bl func_0209c9d4
    mov r0, #0x7
    ldr r4, .L_022044ac
    sub r6, r0, #0x1
.L_02204a9c:
    add r0, r8, r6, lsl #0x2
    ldr r5, [r0, #0x8fc]
    cmp r5, #0x0
    ble .L_02204bdc
    mov r0, #0xd
    mul r2, r6, r0
    add r0, r8, r2, lsl #0x2
    ldr r1, [r0, #0x4b8]
    mov r0, #0xc
    mla r9, r2, r0, r8
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r10, [r4, r1]
    mov r1, r5, asr #0x1
    add r1, r5, r1, lsr #0x1e
    mov r7, r1, asr #0x2
    rsb r1, r7, #0x0
    add r0, r4, r0, lsl #0x1
    ldrsh r0, [r0, #0x2]
    mul r2, r10, r1
    ldr r3, [r9, #0x6c]
    rsb r0, r0, #0x0
    add r3, r0, r3
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    str r2, [sp, #0xe4]
    ldr r2, [r9, #0x70]
    mul r3, r10, r7
    add r2, r10, r2
    mla r1, r0, r1, r2
    mov r1, r1, asr #0xc
    str r1, [sp, #0xe8]
    ldr r1, [r9, #0x6c]
    rsb r2, r5, #0x0
    add r1, r0, r1
    sub r1, r1, r3
    mov r1, r1, asr #0xc
    str r1, [sp, #0xec]
    mov r1, #0x5a
    ldr r11, [r9, #0x70]
    mul r3, r0, r1
    add r1, r10, r11
    mla r1, r0, r7, r1
    mov r1, r1, asr #0xc
    str r1, [sp, #0xf0]
    ldr r7, [r9, #0x6c]
    mul r1, r10, r2
    add r7, r7, r3
    sub r1, r7, r1
    mov r1, r1, asr #0xc
    str r1, [sp, #0xf4]
    mov r1, #0x5a
    smulbb r7, r10, r1
    mul r11, r10, r5
    ldr r10, [r9, #0x70]
    add r1, sp, #0xe4
    add r10, r10, r7
    mla r2, r0, r2, r10
    mov r2, r2, asr #0xc
    str r2, [sp, #0xf8]
    ldr r10, [r9, #0x6c]
    mov r2, #0x4
    add r3, r10, r3
    sub r3, r3, r11
    mov r3, r3, asr #0xc
    str r3, [sp, #0xfc]
    ldr r9, [r9, #0x70]
    ldr r3, .L_02204c14
    add r7, r9, r7
    mla r5, r0, r5, r7
    mov r0, r5, asr #0xc
    str r0, [sp, #0x100]
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x48]
    ldr r0, [r0, #0x18]
    bl func_0209ca90
.L_02204bdc:
    subs r6, r6, #0x1
    bpl .L_02204a9c
.L_02204be4:
    ldr r0, [r8, #0x48]
    ldr r1, [sp, #0x4]
    ldr r0, [r0, #0x18]
    add r0, r0, #0x84
    bl VecFx32Object_Assign
    ldr r0, [r8, #0x958]
    ldr r1, [sp, #0x4]
    bl func_ov008_021fbe0c
    add r0, sp, #0x234
    bl VecFx32Object_Destroy
    add sp, sp, #0x354
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02204c14: .word 0x7fff
    .size func_ov041_02203434, . - func_ov041_02203434

