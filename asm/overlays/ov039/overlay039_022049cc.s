.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern func_020befec
    .extern func_02005030
    .extern func_020adc40
    .extern func_02005058
    .extern func_ov039_0220491c
    .extern func_ov039_02204974
    .extern genrand_int32
    .extern func_020bf1f8
    .extern func_0201e0ec
    .extern func_ov039_021fce40
    .extern func_ov039_02204168
    .extern func_0209b58c
    .extern data_020c9670
    .extern data_021052fc
    .global func_ov039_022049cc
func_ov039_022049cc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x108
    mov r6, r0
    ldr r4, [r6, #0x0]
    mov r0, #0x9000
    ldr r4, [r4, #0x18]
    rsb r0, r0, #0x0
    str r0, [sp, #0x54]
    add r0, r4, #0x1c00
    ldrh r0, [r0, #0xb0]
    mov r5, r1
    str r3, [sp, #0x8]
    str r0, [sp, #0x4c]
    cmp r0, #0x0
    ldr r0, [sp, #0x54]
    str r2, [sp, #0x4]
    sub r0, r0, #0x7000
    str r0, [sp, #0x50]
    ldr r0, [sp, #0x4c]
    mov r7, #0x9
    sub r1, r0, #0x4
    mov r0, #0x1000
    mov r8, #0x4
    str r0, [sp, #0x30]
    beq L_02204c2c
    ldr r0, [sp, #0x4c]
    cmp r0, #0x5
    bgt L_02204c2c
    mov r7, #0x3
    rsb r0, r7, #0x4d0
    str r0, [sp, #0x30]
    mov r0, #0xa000
    str r0, [sp, #0x54]
    mov r0, #0x12000
    cmp r1, #0x0
    str r0, [sp, #0x50]
    mov r8, #0x1
    bne L_02204c58
    mov r0, #0xd
    sub r9, r0, #0x1
    ldr r0, L_02205648
    mov r4, #0x0
    rsb r10, r0, #0xe90
L_02204a78:
    add r0, r6, r9, lsl #0x2
    ldr r0, [r0, #0x310]
    mov r1, #0x3
    str r0, [sp, #0x28]
    bl func_020befec
    cmp r1, #0x0
    bne L_02204af4
    add r2, r6, r9, lsl #0x2
    ldr r0, L_02205648
    ldr r1, [r2, #0x344]
    str r0, [sp, #0x30]
    add r0, r1, #0x52
    str r0, [r2, #0x344]
    cmp r0, #0x1000
    ble L_02204c00
    mov r0, #0x1000
    str r0, [r2, #0x344]
    ldr r0, [r2, #0x310]
    mov r1, #0x3
    add r0, r0, #0x1
    str r0, [r2, #0x310]
    bl func_020befec
    mov r1, #0xd
    mla r1, r0, r1, r9
    ldr r0, [r6, #0x0]
    ldr r0, [r0, #0x18]
    add r0, r0, r1, lsl #0x2
    add r1, r0, #0x1000
    mov r0, #0x1
    str r0, [r1, #0xb3c]
    b L_02204c00
L_02204af4:
    cmp r1, #0x1
    bne L_02204bc8
    ldr r0, [sp, #0x28]
    mov r1, #0x3
    bl func_020befec
    mov r1, #0xd
    mla r2, r0, r1, r9
    ldr r1, [r6, #0x0]
    add r0, sp, #0xf8
    ldr r1, [r1, #0x18]
    add r1, r1, #0x19c
    add r1, r1, #0x1400
    add r1, r1, r2, lsl #0x4
    bl func_02005030
    ldr r2, [sp, #0x104]
    ldr r0, [r5, #0x8]
    ldr r1, [sp, #0xfc]
    sub r0, r2, r0
    smull r3, r2, r0, r0
    ldr r0, [r5, #0x4]
    sub r0, r1, r0
    smull ip, r1, r0, r0
    mov r0, #0x800
    adds ip, ip, r0
    mov r0, #0x0
    adc r1, r1, r0
    mov r0, ip, lsr #0xc
    adds r3, r3, #0x800
    orr r0, r0, r1, lsl #0x14
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    cmp r0, #0x1e000
    bge L_02204bbc
    add r2, r6, r9, lsl #0x2
    ldr r0, [r2, #0x310]
    mov r1, #0x3
    add r0, r0, #0x1
    str r0, [r2, #0x310]
    bl func_020befec
    mov r1, #0xd
    mla r1, r0, r1, r9
    ldr r0, [r6, #0x0]
    ldr r0, [r0, #0x18]
    add r0, r0, r1, lsl #0x2
    add r1, r0, #0x1000
    mov r0, #0x0
    str r0, [r1, #0xb3c]
L_02204bbc:
    add r0, sp, #0xf8
    bl func_02005058
    b L_02204c00
L_02204bc8:
    cmp r1, #0x2
    bne L_02204c00
    add r1, r6, r9, lsl #0x2
    ldr r0, [r1, #0x344]
    subs r0, r0, r10
    str r0, [r1, #0x344]
    bpl L_02204c00
    mov r0, #0x0
    str r0, [r1, #0x344]
    ldr r0, [r1, #0x310]
    cmp r0, #0x7
    addlt r0, r0, #0x1
    strlt r0, [r1, #0x310]
    addge r4, r4, #0x1
L_02204c00:
    subs r9, r9, #0x1
    bpl L_02204a78
    cmp r4, #0xd
    bne L_02204c58
    ldr r0, [r6, #0x0]
    ldr r0, [r0, #0x18]
    add r0, r0, #0x1c00
    ldrh r1, [r0, #0xb0]
    add r1, r1, #0x1
    strh r1, [r0, #0xb0]
    b L_02204c58
L_02204c2c:
    ldr r0, [r6, #0x3a0]
    cmp r0, #0x1
    mov r0, r6
    bne L_02204c44
    bl func_ov039_0220491c
    b L_02204c48
L_02204c44:
    bl func_ov039_02204974
L_02204c48:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    movgt r0, #0x0
    strgt r0, [r6, #0x398]
L_02204c58:
    ldr r0, [sp, #0x4c]
    cmp r0, #0x0
    mov r0, #0x18
    str r0, [sp, #0x48]
    mov r0, #0x20
    str r0, [sp, #0x44]
    beq L_02204c8c
    ldr r0, [sp, #0x4c]
    cmp r0, #0x5
    movle r0, #0x14
    strle r0, [sp, #0x48]
    movle r0, #0x1c
    strle r0, [sp, #0x44]
L_02204c8c:
    ldr r0, [sp, #0x4]
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    mov r0, r0, lsl #0x1
    str r0, [sp, #0x58]
    mov r0, r1, lsl #0x1
    str r0, [sp, #0x5c]
    mov r0, #0xd
    sub r4, r0, #0x1
    ldr r1, L_0220564c
    ldr r0, [sp, #0x58]
    ldrsh r0, [r1, r0]
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x5c]
    ldrsh r0, [r1, r0]
    str r0, [sp, #0x20]
    rsb r0, r8, #0x18
    str r0, [sp, #0x3c]
    rsb r0, r8, #0x20
    str r0, [sp, #0x38]
    ldr r0, [sp, #0x18]
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x20]
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x30]
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x128]
    str r0, [sp, #0x2c]
    mov r0, #0x1000
    rsb r0, r0, #0x0
    str r0, [sp, #0xa0]
    add r0, r6, #0x148
    str r0, [sp, #0x98]
    add r0, r6, #0x154
    str r0, [sp, #0x9c]
    add r0, r7, #0x18
    str r0, [sp, #0x7c]
    add r0, r7, #0x20
    str r0, [sp, #0x80]
    ldr r0, [sp, #0xa0]
    rsb r0, r0, #0x3b0
    str r0, [sp, #0xd0]
L_02204d44:
    ldr r0, [sp, #0xd0]
    ldr r7, [sp, #0x80]
    mul r0, r4, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    ldr r0, L_0220564c
    mov r1, r2, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [sp, #0x48]
    ldr r8, [sp, #0x3c]
    str r0, [sp, #0x14]
    ldr r0, L_0220564c
    ldr lr, [sp, #0x20]
    add r0, r0, r2, lsl #0x1
    ldrsh r0, [r0, #0x2]
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x14]
    mul r9, r1, r0
    ldr r1, [sp, #0x44]
    ldr r0, [sp, #0x10]
    mul ip, r1, r0
    mov r0, ip, asr #0x1f
    str r0, [sp, #0x60]
    mov r0, r9, asr #0x1f
    str r0, [sp, #0x64]
    mov r0, #0x24
    mla r3, r4, r0, r6
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x7c]
    str r0, [sp, #0x74]
    ldr r0, [sp, #0x14]
    mul r2, r1, r0
    ldr r0, [sp, #0x10]
    mul r1, r7, r0
    mov r0, r1, asr #0x1f
    str r0, [sp, #0x84]
    mov r0, r2, asr #0x1f
    str r0, [sp, #0x88]
    ldr r7, [sp, #0x38]
    ldr r0, [sp, #0x10]
    mul r0, r7, r0
    mov r7, r0, asr #0x1f
    str r7, [sp, #0x8c]
    ldr r7, [sp, #0x14]
    mul r7, r8, r7
    str r7, [sp, #0x90]
    mov r7, r7, asr #0x1f
    str r7, [sp, #0x94]
    ldr r7, [sp, #0x20]
    umull r10, r8, r7, r9
    adds r7, r10, #0x800
    str r8, [sp, #0x68]
    mov r8, r7, lsr #0xc
    ldr r10, [sp, #0x64]
    ldr r7, [sp, #0x68]
    mla r7, lr, r10, r7
    ldr r10, [sp, #0x24]
    mla lr, r10, r9, r7
    adc r7, lr, #0x0
    ldr r10, [sp, #0x18]
    str lr, [sp, #0x68]
    orr r8, r8, r7, lsl #0x14
    umull r7, lr, r10, ip
    adds r7, r7, #0x800
    str lr, [sp, #0x70]
    mov r7, r7, lsr #0xc
    str r7, [sp, #0x6c]
    mov lr, r10
    ldr r10, [sp, #0x60]
    ldr r7, [sp, #0x70]
    mla r7, lr, r10, r7
    ldr r10, [sp, #0x1c]
    mla lr, r10, ip, r7
    ldr r7, [sp, #0x6c]
    adc r10, lr, #0x0
    orr r7, r7, r10, lsl #0x14
    str r7, [sp, #0x6c]
    sub r8, r8, r7
    ldr r7, [sp, #0x74]
    ldr r10, [sp, #0x18]
    add r7, r7, r8
    str r7, [r3, #0x140]
    ldr r7, [r5, #0x8]
    str lr, [sp, #0x70]
    str r7, [sp, #0x78]
    umull r8, r7, r10, r9
    mov lr, r10
    ldr r10, [sp, #0x64]
    mla r7, lr, r10, r7
    ldr r10, [sp, #0x1c]
    mla r7, r10, r9, r7
    adds r9, r8, #0x800
    ldr r10, [sp, #0x20]
    adc r7, r7, #0x0
    mov r9, r9, lsr #0xc
    orr r9, r9, r7, lsl #0x14
    umull r8, r7, r10, ip
    mov lr, r10
    ldr r10, [sp, #0x60]
    mla r7, lr, r10, r7
    ldr r10, [sp, #0x24]
    mla r7, r10, ip, r7
    adds r10, r8, #0x800
    adc r7, r7, #0x0
    mov r8, r10, lsr #0xc
    orr r8, r8, r7, lsl #0x14
    add r8, r9, r8
    ldr r7, [sp, #0x78]
    mov r9, lr
    add r7, r7, r8
    umull r10, r8, r9, r2
    adds r9, r10, #0x800
    mov r10, r9, lsr #0xc
    mov ip, lr
    ldr r9, [sp, #0x88]
    str r7, [r3, #0x144]
    mla r8, ip, r9, r8
    ldr r9, [sp, #0x24]
    ldr lr, [sp, #0x18]
    mla r8, r9, r2, r8
    adc r8, r8, #0x0
    ldr r9, [sp, #0x18]
    orr r10, r10, r8, lsl #0x14
    umull ip, r8, r9, r1
    adds r9, ip, #0x800
    ldr ip, [sp, #0x84]
    mov r9, r9, lsr #0xc
    mla r8, lr, ip, r8
    ldr ip, [sp, #0x1c]
    ldr r7, [r5, #0x4]
    mla r8, ip, r1, r8
    adc r8, r8, #0x0
    orr r9, r9, r8, lsl #0x14
    sub r8, r10, r9
    add r7, r7, r8
    mov r10, lr
    umull r9, r8, r10, r2
    adds r9, r9, #0x800
    str r7, [r3, #0x14c]
    ldr r10, [sp, #0x88]
    mov ip, lr
    mla r8, ip, r10, r8
    ldr r10, [sp, #0x1c]
    mov r9, r9, lsr #0xc
    mla r8, r10, r2, r8
    ldr r10, [sp, #0x20]
    adc r2, r8, #0x0
    orr r9, r9, r2, lsl #0x14
    umull r8, r2, r10, r1
    mov ip, r10
    ldr r10, [sp, #0x84]
    adds r8, r8, #0x800
    mla r2, ip, r10, r2
    ldr r10, [sp, #0x24]
    ldr r7, [r5, #0x8]
    mla r2, r10, r1, r2
    adc r1, r2, #0x0
    mov r2, r8, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, r9, r2
    add r2, r7, r1
    ldr r1, [sp, #0x54]
    mov r9, ip
    add r1, r1, r2
    str r1, [r3, #0x150]
    ldr r1, [sp, #0x90]
    mov r2, ip
    umull r7, r1, r2, r1
    adds r2, r7, #0x800
    mov r7, r2, lsr #0xc
    ldr r2, [sp, #0x94]
    ldr r8, [r5, #0x4]
    mla r1, r9, r2, r1
    mov r9, r10
    ldr r2, [sp, #0x90]
    mov r10, lr
    mla r1, r9, r2, r1
    adc r1, r1, #0x0
    mov r2, lr
    orr r7, r7, r1, lsl #0x14
    umull r9, r1, r2, r0
    adds r2, r9, #0x800
    ldr r9, [sp, #0x8c]
    mov r2, r2, lsr #0xc
    mla r1, r10, r9, r1
    ldr r9, [sp, #0x1c]
    mla r1, r9, r0, r1
    adc r1, r1, #0x0
    orr r2, r2, r1, lsl #0x14
    sub r1, r7, r2
    add r1, r8, r1
    str r1, [r3, #0x158]
    mov r1, #0x18
    mla r7, r4, r1, r6
    ldr r1, [sp, #0x90]
    mov r8, lr
    umull r2, r1, r8, r1
    ldr r8, [sp, #0x94]
    ldr r9, [r5, #0x8]
    mla r1, r10, r8, r1
    ldr r10, [sp, #0x1c]
    ldr r8, [sp, #0x90]
    mla r1, r10, r8, r1
    adds r8, r2, #0x800
    adc r1, r1, #0x0
    mov r8, r8, lsr #0xc
    mov r10, ip
    orr r8, r8, r1, lsl #0x14
    umull r2, r1, r10, r0
    ldr r10, [sp, #0x8c]
    mla r1, ip, r10, r1
    ldr r10, [sp, #0x24]
    mla r1, r10, r0, r1
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, #0x0
    adc r0, r1, r0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r8, r1
    add r1, r9, r0
    ldr r0, [sp, #0x50]
    add r0, r0, r1
    str r0, [r3, #0x15c]
    ldrh r1, [r7, #0x10]
    ldr r0, [r3, #0x14c]
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, L_0220564c
    ldrsh r8, [r1, r2]
    mov r1, #0x6000
    umull r10, r9, r8, r1
    mov r1, #0x0
    mla r9, r8, r1, r9
    mov r2, r8, asr #0x1f
    mov r1, #0x6000
    mla r9, r2, r1, r9
    adds r2, r10, #0x800
    adc r1, r9, #0x0
    mov r8, r2, lsr #0xc
    orr r8, r8, r1, lsl #0x14
    ldr r1, [sp, #0x30]
    mov r2, r8, asr #0x1f
    umull r10, r9, r8, r1
    ldr r1, [sp, #0x34]
    mla r9, r8, r1, r9
    ldr r1, [sp, #0x30]
    mla r9, r2, r1, r9
    adds r2, r10, #0x800
    adc r1, r9, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    str r0, [r3, #0x14c]
    ldrh r1, [r7, #0x12]
    ldr r0, [r3, #0x150]
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, L_0220564c
    ldrsh r8, [r1, r2]
    mov r1, #0x3000
    umull r10, r9, r8, r1
    mov r1, #0x0
    mla r9, r8, r1, r9
    mov r2, r8, asr #0x1f
    mov r1, #0x3000
    mla r9, r2, r1, r9
    adds r2, r10, #0x800
    adc r1, r9, #0x0
    mov r8, r2, lsr #0xc
    orr r8, r8, r1, lsl #0x14
    ldr r1, [sp, #0x30]
    mov r2, r8, asr #0x1f
    umull r10, r9, r8, r1
    ldr r1, [sp, #0x34]
    mla r9, r8, r1, r9
    ldr r1, [sp, #0x30]
    mla r9, r2, r1, r9
    adds r2, r10, #0x800
    adc r1, r9, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    str r0, [r3, #0x150]
    ldrh r1, [r7, #0x18]
    ldr r0, [r3, #0x158]
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, L_0220564c
    ldrsh r2, [r1, r2]
    mov r1, r2, asr #0x1f
    mov r8, r1, lsl #0xe
    mov r1, #0x800
    orr r8, r8, r2, lsr #0x12
    adds r2, r1, r2, lsl #0xe
    adc r1, r8, #0x0
    mov r8, r2, lsr #0xc
    orr r8, r8, r1, lsl #0x14
    ldr r1, [sp, #0x30]
    mov r2, r8, asr #0x1f
    umull r10, r9, r8, r1
    ldr r1, [sp, #0x34]
    mla r9, r8, r1, r9
    ldr r1, [sp, #0x30]
    mla r9, r2, r1, r9
    adds r2, r10, #0x800
    adc r1, r9, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    str r0, [r3, #0x158]
    ldrh r1, [r7, #0x1a]
    ldr r0, [r3, #0x15c]
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, L_0220564c
    ldrsh r8, [r1, r2]
    mov r1, #0x5000
    umull r10, r9, r8, r1
    mov r1, #0x0
    mla r9, r8, r1, r9
    mov r2, r8, asr #0x1f
    mov r1, #0x5000
    mla r9, r2, r1, r9
    adds r2, r10, #0x800
    adc r1, r9, #0x0
    mov r8, r2, lsr #0xc
    orr r8, r8, r1, lsl #0x14
    ldr r1, [sp, #0x30]
    mov r2, r8, asr #0x1f
    umull r10, r9, r8, r1
    ldr r1, [sp, #0x34]
    mla r9, r8, r1, r9
    ldr r1, [sp, #0x30]
    mla r9, r2, r1, r9
    adds r2, r10, #0x800
    adc r1, r9, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    str r0, [r3, #0x15c]
    bl genrand_int32
    ldr r1, [sp, #0xa0]
    and r0, r0, r1, lsr #0x14
    add r0, r0, #0x98
    ldr r1, [sp, #0x2c]
    add r0, r0, #0x800
    mul r0, r1, r0
    mov r1, #0xa
    bl func_020bf1f8
    ldrh r1, [r7, #0x10]
    add r0, r1, r0
    strh r0, [r7, #0x10]
    bl genrand_int32
    ldr r1, [sp, #0xa0]
    and r0, r0, r1, lsr #0x14
    ldr r1, [sp, #0x2c]
    add r0, r0, #0x960
    mul r0, r1, r0
    mov r1, #0xa
    bl func_020bf1f8
    ldrh r1, [r7, #0x18]
    add r0, r1, r0
    strh r0, [r7, #0x18]
    bl genrand_int32
    ldr r1, [sp, #0xa0]
    and r0, r0, r1, lsr #0x14
    add r0, r0, #0x68
    ldr r1, [sp, #0x2c]
    add r0, r0, #0x1000
    mul r0, r1, r0
    mov r1, #0xa
    bl func_020bf1f8
    ldrh r1, [r7, #0x12]
    add r0, r1, r0
    strh r0, [r7, #0x12]
    bl genrand_int32
    ldr r1, [sp, #0xa0]
    and r0, r0, r1, lsr #0x14
    add r0, r0, #0x130
    ldr r1, [sp, #0x2c]
    add r0, r0, #0x1000
    mul r0, r1, r0
    mov r1, #0xa
    bl func_020bf1f8
    ldrh r1, [r7, #0x1a]
    add r0, r1, r0
    strh r0, [r7, #0x1a]
    ldr r0, L_02205650
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    str r0, [sp, #0x40]
    add r0, sp, #0xec
    bl func_ov039_021fce40
    add r0, sp, #0xe0
    bl func_ov039_021fce40
    add r0, sp, #0xd4
    bl func_ov039_021fce40
    ldr r0, [sp, #0x4c]
    cmp r0, #0x0
    ldr r0, [r6, #0x398]
    str r0, [sp, #0xc]
    beq L_022054a0
    add r0, r6, r4, lsl #0x2
    ldr r1, [r0, #0x344]
    mov r0, #0x24
    mul r8, r4, r0
    add r0, r1, r1, lsr #0x1f
    ldr r1, [sp, #0x98]
    mov r7, r0, asr #0x1
    add r0, sp, #0xe0
    add r1, r1, r8
    bl func_ov039_02204168
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x310]
    mov r1, #0x3
    bl func_020befec
    mov r1, #0xd
    mla r1, r0, r1, r4
    ldr r2, [r6, #0x0]
    ldr r0, [r2, #0x18]
    add r2, r6, r4, lsl #0x2
    add r0, r0, r1, lsl #0x4
    add r0, r0, #0x1000
    ldr r0, [r0, #0x5a0]
    mov r1, #0x3
    str r0, [sp, #0xd8]
    ldr r0, [r2, #0x310]
    bl func_020befec
    mov r1, #0xd
    mla r1, r0, r1, r4
    ldr r2, [r6, #0x0]
    ldr r0, [sp, #0x40]
    ldr r2, [r2, #0x18]
    mov r3, r7
    add r1, r2, r1, lsl #0x4
    add r1, r1, #0x1000
    ldr r2, [r1, #0x5a8]
    add r1, sp, #0xe0
    str r2, [sp, #0xdc]
    add r2, sp, #0xec
    str r2, [sp, #0x0]
    add r2, sp, #0xd4
    bl func_0209b58c
    ldr r0, [sp, #0x9c]
    add r7, r6, r8
    add r1, r0, r8
    ldr r0, [sp, #0xf0]
    add r2, r6, r4, lsl #0x2
    str r0, [r7, #0x14c]
    ldr r3, [sp, #0xf4]
    add r0, sp, #0xe0
    str r3, [r7, #0x150]
    ldr r8, [r2, #0x344]
    bl func_ov039_02204168
    add r1, sp, #0xec
    str r1, [sp, #0x0]
    ldr r0, [sp, #0x40]
    mov r3, r8
    add r1, sp, #0xe0
    add r2, sp, #0xd4
    bl func_0209b58c
    ldr r0, [sp, #0xf0]
    str r0, [r7, #0x158]
    ldr r0, [sp, #0xf4]
    str r0, [r7, #0x15c]
    b L_02205638
L_022054a0:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    ldrgt r0, [sp, #0xa0]
    strgt r0, [sp, #0xc]
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    add r9, r0, r0, lsl #0x4
    mov r0, #0xd
    mul r0, r1, r0
    str r0, [sp, #0xa8]
    mov r0, #0x24
    mla r7, r4, r0, r6
    ldr r1, L_0220564c
    ldr r0, [sp, #0x58]
    ldr r8, [sp, #0xa8]
    ldrsh r10, [r1, r0]
    ldr r0, [sp, #0x5c]
    ldr r2, [r7, #0x14c]
    ldrsh r0, [r1, r0]
    str r2, [sp, #0xe4]
    ldr r2, [r7, #0x150]
    str r0, [sp, #0xa4]
    ldr ip, [sp, #0xa4]
    str r2, [sp, #0xe8]
    smull r8, lr, ip, r8
    adds r8, r8, #0x800
    adc ip, lr, #0x0
    mov r8, r8, lsr #0xc
    str ip, [sp, #0xb0]
    orr r8, r8, ip, lsl #0x14
    ldr ip, [sp, #0xa8]
    str lr, [sp, #0xb4]
    smull lr, ip, r10, ip
    ldr r0, [r5, #0x4]
    str ip, [sp, #0xc4]
    str lr, [sp, #0xc0]
    smull lr, ip, r10, r9
    str r0, [sp, #0xac]
    ldr r10, [sp, #0xa4]
    str ip, [sp, #0xbc]
    smull ip, r9, r10, r9
    mov r10, lr
    str ip, [sp, #0xc8]
    adds ip, r10, #0x800
    ldr r10, [sp, #0xbc]
    str r9, [sp, #0xcc]
    adc r9, r10, #0x0
    mov r10, ip, lsr #0xc
    orr r10, r10, r9, lsl #0x14
    sub r9, r8, r10
    ldr r8, [sp, #0xac]
    ldr r0, [sp, #0x40]
    add r8, r8, r9
    ldr r9, [sp, #0xc0]
    str r8, [sp, #0xd8]
    adds r10, r9, #0x800
    ldr r9, [sp, #0xc4]
    mov r8, r10, lsr #0xc
    adc r9, r9, #0x0
    ldr r10, [sp, #0xc8]
    orr r8, r8, r9, lsl #0x14
    adds ip, r10, #0x800
    ldr r10, [sp, #0xcc]
    ldr r3, [sp, #0xc]
    adc r9, r10, #0x0
    mov r10, ip, lsr #0xc
    orr r10, r10, r9, lsl #0x14
    ldr r9, [r5, #0x8]
    add r8, r8, r10
    add r8, r9, r8
    sub r8, r8, #0x5000
    str r8, [sp, #0xdc]
    add r8, sp, #0xec
    add r1, sp, #0xe0
    add r2, sp, #0xd4
    str r8, [sp, #0x0]
    str lr, [sp, #0xb8]
    bl func_0209b58c
    ldr r2, [sp, #0xf0]
    ldr r0, [sp, #0x40]
    str r2, [r7, #0x14c]
    ldr r8, [sp, #0xf4]
    ldr r3, [sp, #0xc]
    str r8, [r7, #0x150]
    ldr r8, [r7, #0x158]
    add r1, sp, #0xe0
    str r8, [sp, #0xe4]
    ldr r8, [r7, #0x15c]
    add r2, sp, #0xd4
    str r8, [sp, #0xe8]
    ldr r8, [r5, #0x4]
    str r8, [sp, #0xd8]
    ldr r8, [r5, #0x8]
    sub r8, r8, #0x7000
    str r8, [sp, #0xdc]
    add r8, sp, #0xec
    str r8, [sp, #0x0]
    bl func_0209b58c
    ldr r0, [sp, #0xf0]
    str r0, [r7, #0x158]
    ldr r0, [sp, #0xf4]
    str r0, [r7, #0x15c]
L_02205638:
    subs r4, r4, #0x1
    bpl L_02204d44
    add sp, sp, #0x108
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_02205648: .word 0xccd
L_0220564c: .word data_020c9670
L_02205650: .word data_021052fc
    .size func_ov039_022049cc, .-func_ov039_022049cc

