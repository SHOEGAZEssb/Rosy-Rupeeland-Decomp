    .text
/* Exact fallback; see overlay040_motion_vectors_init.c for portable C. */
    .extern __register_global_object
    .extern data_ov040_02203810
    .extern data_ov040_02207dc0
    .extern data_ov040_02207dec
    .extern data_ov040_02207df8
    .extern func_020adc40
    .extern func_020adc90
    .extern func_020be8c0
    .extern func_020beae4
    .extern func_020beb18
    .extern func_020beb6c
    .extern func_020befec
    .extern func_ov040_021fd724
    .extern func_ov040_021fd740
    .extern func_ov040_021fe18c
    .extern func_ov040_022005d4
    .global func_ov040_022005f8
func_ov040_022005f8: ; 0x022005f8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r5, [r4, #0xb8]
    ldr r6, [r4, #0xbc]
    smull r1, r11, r5, r5
    ldr r0, .L_022009c8
    smull r10, r9, r6, r6
    ldr r8, [r0, #0x1c]
    ldr r7, [r0, #0x20]
    ldr r3, [r0, #0x14]
    ldr r2, [r0, #0x18]
    adds r1, r1, #0x800
    adc r0, r11, #0x0
    mov r11, r1, lsr #0xc
    adds r10, r10, #0x800
    adc r1, r9, #0x0
    mov r9, r10, lsr #0xc
    orr r11, r11, r0, lsl #0x14
    orr r9, r9, r1, lsl #0x14
    add r0, r11, r9
    str r8, [sp, #0x8]
    str r7, [sp, #0xc]
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    bl func_020adc40
    mov r7, r0
    mov r0, r5
    mov r1, r7
    bl func_020adc90
    mov r5, r0
    mov r0, r6
    mov r1, r7
    bl func_020adc90
    mov r5, r5, lsl #0x3
    ldr r1, .L_022009cc
    mov r3, r0, lsl #0x3
    str r5, [r4, #0x238]
    ldr r0, [r1, #0x10]
    str r3, [r4, #0x23c]
    mov r2, #0xa000
    str r2, [r4, #0x240]
    add r0, r0, #0x1
    str r5, [r4, #0x228]
    str r0, [r1, #0x10]
    str r3, [r4, #0x22c]
    mov r1, #0x6
    str r2, [r4, #0x230]
    bl func_020befec
    mov r1, #0x3
    bl func_020befec
    mov r6, r1, lsl #0x3
    add r0, r6, #0x20
    mov r7, r0, lsl #0xc
    cmp r0, #0x0
    mov r0, r7
    ble .L_022006f0
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b .L_022006fc
.L_022006f0:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
.L_022006fc:
    bl func_020beae4
    mov r3, #0x8000
    mov r5, #0xa8000
    add r2, r4, #0x1e4
    str r0, [sp, #0x20]
    add r1, sp, #0x20
    add r0, r2, #0x400
    str r5, [sp, #0x24]
    str r3, [sp, #0x28]
    str r3, [sp, #0x2c]
    bl func_ov040_021fe18c
    add r0, r6, #0x20
    cmp r0, #0x0
    mov r0, r7
    ble .L_0220074c
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b .L_02200758
.L_0220074c:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
.L_02200758:
    bl func_020beae4
    mov r3, #0x8000
    mov r5, #0xa8000
    add r2, r4, #0x1f4
    str r0, [sp, #0x10]
    add r1, sp, #0x10
    add r0, r2, #0x400
    str r5, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    bl func_ov040_021fe18c
    ldr r0, .L_022009cc
    ldr r0, [r0, #0x8]
    tst r0, #0x1
    bne .L_022007bc
    ldr r0, .L_022009d0
    bl func_ov040_021fd724
    ldr r0, .L_022009d0
    ldr r1, .L_022009d4
    ldr r2, .L_022009d8
    bl __register_global_object
    ldr r0, .L_022009cc
    ldr r1, [r0, #0x8]
    orr r1, r1, #0x1
    str r1, [r0, #0x8]
.L_022007bc:
    ldr r0, .L_022009cc
    mov r1, #0x2
    ldr r5, [r4, #0xb8]
    ldr r3, [r0, #0x3c]
    ldr r2, [r4, #0x898]
    sub r3, r5, r3
    ldr r6, [r4, #0xbc]
    ldr r5, [r0, #0x40]
    sub r2, r2, r3, asr #0x4
    str r2, [r4, #0x898]
    ldr r2, [r4, #0x89c]
    sub r5, r6, r5
    sub r2, r2, r5, asr #0x4
    str r2, [r4, #0x89c]
    ldr r2, [r4, #0x8a4]
    sub r9, r1, #0x1
    sub r1, r2, r3, asr #0x4
    str r1, [r4, #0x8a4]
    ldr r1, [r4, #0x8a8]
    mov r11, #0x0
    sub r1, r1, r5, asr #0x4
    str r1, [r4, #0x8a8]
    ldr r1, [r4, #0xb8]
    ldr r5, .L_022009dc
    str r1, [r0, #0x3c]
    ldr r1, [r4, #0xbc]
    add r8, sp, #0x8
    str r1, [r0, #0x40]
    add r0, r4, #0x64
    add r1, r4, #0x94
    add r7, r0, #0x800
    add r6, r1, #0x800
.L_0220083c:
    mov r0, #0xc
    mul r1, r9, r0
    add r0, r4, r1
    ldr r10, [r0, #0x898]
    mov r2, #0x0
    umull lr, ip, r10, r5
    mla ip, r10, r2, ip
    mov r3, r10, asr #0x1f
    mla ip, r3, r5, ip
    adds r3, lr, #0x800
    adc r2, ip, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r0, #0x898]
    ldr ip, [r0, #0x89c]
    mov r2, #0x0
    umull r10, lr, ip, r5
    mla lr, ip, r2, lr
    mov r3, ip, asr #0x1f
    mla lr, r3, r5, lr
    adds r3, r10, #0x800
    adc r2, lr, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r0, #0x89c]
    ldr r2, [r0, #0x868]
    ldr r3, [r8, r9, lsl #0x2]
    cmp r2, #0x0
    ldr r2, [r0, #0x898]
    subgt r2, r2, #0xa4
    addle r2, r2, #0xa4
    str r2, [r0, #0x898]
    ldr r2, [r0, #0x86c]
    cmp r2, #0x0
    ldr r2, [r0, #0x89c]
    subgt r2, r2, #0xa4
    addle r2, r2, #0xa4
    str r2, [r0, #0x89c]
    ldr r2, [r0, #0x868]
    cmp r2, r3
    strgt r3, [r0, #0x868]
    strgt r11, [r0, #0x898]
    ldr r2, [r0, #0x868]
    rsb r3, r3, #0x0
    cmp r2, r3
    strlt r3, [r0, #0x868]
    movlt r2, #0x0
    strlt r2, [r0, #0x898]
    add r2, sp, #0x0
    ldr r3, [r2, r9, lsl #0x2]
    ldr r2, [r0, #0x86c]
    cmp r2, r3
    strgt r3, [r0, #0x86c]
    movgt r2, #0x0
    strgt r2, [r0, #0x89c]
    ldr r2, [r0, #0x86c]
    rsb r3, r3, #0x0
    cmp r2, r3
    strlt r3, [r0, #0x86c]
    movlt r2, #0x0
    strlt r2, [r0, #0x89c]
    add r0, r7, r1
    add r1, r6, r1
    bl func_ov040_022005d4
    subs r9, r9, #0x1
    bpl .L_0220083c
    ldr r1, [r4, #0x868]
    ldr r0, .L_022009e0
    sub r1, r1, #0x5000
    str r1, [r4, #0x41c]
    ldr r2, [r4, #0x874]
    mov r1, #0x0
    add r2, r2, #0x16000
    str r2, [r4, #0x428]
    ldr r3, [r4, #0x86c]
    ldr r2, .L_022009e4
    umull r6, r5, r3, r0
    mla r5, r3, r1, r5
    mov r3, r3, asr #0x1f
    adds r6, r6, #0x800
    mla r5, r3, r0, r5
    adc r3, r5, #0x0
    mov r5, r6, lsr #0xc
    orr r5, r5, r3, lsl #0x14
    add r3, r5, r2
    str r3, [r4, #0x418]
    ldr r3, [r4, #0x878]
    umull r6, r5, r3, r0
    adds r6, r6, #0x800
    mla r5, r3, r1, r5
    mov r1, r3, asr #0x1f
    mla r5, r1, r0, r5
    adc r0, r5, #0x0
    mov r1, r6, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r1, r2
    str r0, [r4, #0x424]
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022009c8: .word data_ov040_02203810
.L_022009cc: .word data_ov040_02207dc0
.L_022009d0: .word data_ov040_02207df8
.L_022009d4: .word func_ov040_021fd740
.L_022009d8: .word data_ov040_02207dec
.L_022009dc: .word 0xfd7
.L_022009e0: .word 0x19a
.L_022009e4: .word 0xfffffccd
    .size func_ov040_022005f8, . - func_ov040_022005f8
