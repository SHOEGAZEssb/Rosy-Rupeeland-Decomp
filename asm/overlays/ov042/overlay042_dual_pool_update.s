.text
.extern genrand_int32
.extern func_020bf1f8
.extern func_020befec
.extern func_ov042_021ff2f8
.extern func_ov042_021fe9e4
.extern func_ov042_021fea08
.extern data_020c9670
    .global func_ov042_021feabc
func_ov042_021feabc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r7, r0
    mov r8, #0x110000
    add r0, r7, #0xfc
    mov r1, #0x64
    rsb r8, r8, #0x0
    add r4, r0, #0x400
    add r0, r8, #0x5c000
    sub r6, r1, #0x1
    add r5, r7, #0x4c
    str r0, [sp, #0x10]
.L_021feaec:
    add r0, r7, r6, lsl #0x2
    ldr r0, [r0, #0xb3c]
    cmp r0, #0x0
    bne .L_021feb50
    mov r0, #0xc
    mul r9, r6, r0
    add r0, r5, r9
    add r1, r4, r9
    bl func_ov042_021ff2f8
    add r2, r7, r9
    ldr r1, [r2, #0x50]
    ldr r0, [sp, #0x10]
    cmp r1, r0
    blt .L_021feb40
    cmp r1, #0xb4000
    bgt .L_021feb40
    ldr r0, [r2, #0x54]
    cmp r0, r8
    blt .L_021feb40
    cmp r0, #0x104000
    ble .L_021fee48
.L_021feb40:
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fe9e4
    b .L_021fee48
.L_021feb50:
    cmp r0, #0x1
    bne .L_021fec18
    mov r0, #0xc
    mul r1, r6, r0
    add r2, r7, r1
    ldr r11, [r2, #0x500]
    mov r9, #0x148
    umull ip, r9, r11, r9
    adds r10, ip, #0x800
    mov ip, #0x0
    mla r9, r11, ip, r9
    mov r3, r11, asr #0x1f
    mov ip, #0x148
    mla r9, r3, ip, r9
    adc r3, r9, #0x0
    mov r10, r10, lsr #0xc
    orr r10, r10, r3, lsl #0x14
    sub r3, r11, r10
    str r3, [r2, #0x500]
    ldr r11, [r2, #0x504]
    mov r9, ip
    umull ip, r9, r11, r9
    adds r10, ip, #0x800
    mov ip, #0x0
    mla r9, r11, ip, r9
    mov r3, r11, asr #0x1f
    mov ip, #0x148
    mla r9, r3, ip, r9
    add r0, r5, r1
    mov r10, r10, lsr #0xc
    adc r3, r9, #0x0
    orr r10, r10, r3, lsl #0x14
    sub r3, r11, r10
    add r3, r3, #0x1f
    add r3, r3, #0x100
    add r1, r4, r1
    str r3, [r2, #0x504]
    bl func_ov042_021ff2f8
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x74]
    add r1, r1, #0x1
    strh r1, [r0, #0x74]
    ldrh r0, [r0, #0x74]
    cmp r0, #0x24
    blo .L_021fee48
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fe9e4
    b .L_021fee48
.L_021fec18:
    cmp r0, #0x7
    bne .L_021fece0
    mov r0, #0xc
    mul r1, r6, r0
    add r2, r7, r1
    ldr r11, [r2, #0x500]
    mov r9, #0x148
    umull ip, r9, r11, r9
    adds r10, ip, #0x800
    mov ip, #0x0
    mla r9, r11, ip, r9
    mov r3, r11, asr #0x1f
    mov ip, #0x148
    mla r9, r3, ip, r9
    adc r3, r9, #0x0
    mov r10, r10, lsr #0xc
    orr r10, r10, r3, lsl #0x14
    sub r3, r11, r10
    str r3, [r2, #0x500]
    ldr r11, [r2, #0x504]
    mov r9, ip
    umull ip, r9, r11, r9
    adds r10, ip, #0x800
    mov ip, #0x0
    mla r9, r11, ip, r9
    mov r3, r11, asr #0x1f
    mov ip, #0x148
    mla r9, r3, ip, r9
    add r0, r5, r1
    mov r10, r10, lsr #0xc
    adc r3, r9, #0x0
    orr r10, r10, r3, lsl #0x14
    sub r3, r11, r10
    add r3, r3, #0x1f
    add r3, r3, #0x100
    add r1, r4, r1
    str r3, [r2, #0x504]
    bl func_ov042_021ff2f8
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x74]
    add r1, r1, #0x1
    strh r1, [r0, #0x74]
    ldrh r0, [r0, #0x74]
    cmp r0, #0x20
    blo .L_021fee48
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fe9e4
    b .L_021fee48
.L_021fece0:
    cmp r0, #0x2
    bne .L_021fed2c
    mov r0, #0xc
    mul r1, r6, r0
    add r0, r5, r1
    add r1, r4, r1
    bl func_ov042_021ff2f8
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x74]
    add r1, r1, #0x1
    strh r1, [r0, #0x74]
    ldrh r0, [r0, #0x74]
    cmp r0, #0x14
    bne .L_021fee48
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fe9e4
    b .L_021fee48
.L_021fed2c:
    cmp r0, #0x3
    bne .L_021fed78
    mov r0, #0xc
    mul r1, r6, r0
    add r0, r5, r1
    add r1, r4, r1
    bl func_ov042_021ff2f8
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x74]
    add r1, r1, #0x1
    strh r1, [r0, #0x74]
    ldrh r0, [r0, #0x74]
    cmp r0, #0x24
    blo .L_021fee48
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fe9e4
    b .L_021fee48
.L_021fed78:
    cmp r0, #0x4
    bne .L_021fedc4
    mov r0, #0xc
    mul r1, r6, r0
    add r0, r5, r1
    add r1, r4, r1
    bl func_ov042_021ff2f8
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x74]
    add r1, r1, #0x1
    strh r1, [r0, #0x74]
    ldrh r0, [r0, #0x74]
    cmp r0, #0x18
    blo .L_021fee48
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fe9e4
    b .L_021fee48
.L_021fedc4:
    cmp r0, #0x5
    bne .L_021fedfc
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x74]
    add r1, r1, #0x1
    strh r1, [r0, #0x74]
    ldrh r0, [r0, #0x74]
    cmp r0, #0x2
    blo .L_021fee48
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fe9e4
    b .L_021fee48
.L_021fedfc:
    cmp r0, #0x6
    bne .L_021fee48
    mov r0, #0xc
    mla r2, r6, r0, r7
    ldr r0, [r2, #0x504]
    add r1, r7, r6, lsl #0x1
    add r0, r0, #0x44
    add r0, r0, #0x400
    str r0, [r2, #0x504]
    add r0, r1, #0xa00
    ldrh r1, [r0, #0x74]
    sub r1, r1, #0x1
    strh r1, [r0, #0x74]
    ldrh r0, [r0, #0x74]
    cmp r0, #0x4
    bhi .L_021fee48
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fe9e4
.L_021fee48:
    subs r6, r6, #0x1
    bpl .L_021feaec
    mov r0, #0x30
    sub r6, r0, #0x1
    ldr r0, .L_021ff2e4
    ldr r4, .L_021ff2e8
    sub r0, r0, #0x690
    str r0, [sp, #0x4]
    ldr r0, .L_021ff2e4
    add r0, r0, #0x134
    str r0, [sp, #0x0]
    ldr r0, .L_021ff2e4
    rsb r11, r0, #0x690
    ldr r0, .L_021ff2ec
    rsb r0, r0, #0x0
    str r0, [sp, #0xc]
    ldr r0, .L_021ff2ec
    add r0, r0, #0x23
    str r0, [sp, #0x8]
.L_021fee94:
    add r3, r7, r6, lsl #0x2
    add r0, r3, #0x1000
    ldr r0, [r0, #0x4c8]
    cmp r0, #0x0
    bne .L_021feed8
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0x1400
    ldrh r1, [r0, #0x68]
    add r1, r1, #0x1
    strh r1, [r0, #0x68]
    ldrh r0, [r0, #0x68]
    cmp r0, #0x8
    bls .L_021ff2d4
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fea08
    b .L_021ff2d4
.L_021feed8:
    cmp r0, #0x1
    bne .L_021fef20
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0x1400
    ldrh r1, [r0, #0x68]
    add r1, r1, #0x1
    strh r1, [r0, #0x68]
    ldr r2, [r3, #0xf28]
    ldr r1, [r2, #0x34]
    sub r1, r1, #0x1800
    str r1, [r2, #0x34]
    ldrh r0, [r0, #0x68]
    cmp r0, #0x14
    bls .L_021ff2d4
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fea08
    b .L_021ff2d4
.L_021fef20:
    cmp r0, #0x2
    bne .L_021fef54
    ldr r0, [r3, #0xf28]
    ldr r0, [r0, #0xc]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_021ff2d4
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fea08
    b .L_021ff2d4
.L_021fef54:
    cmp r0, #0x3
    bne .L_021ff2d4
    add r1, r7, r6, lsl #0x1
    add r0, r1, #0x68
    add r5, r0, #0x1400
    add r0, r1, #0x1400
    ldrh r1, [r0, #0x68]
    add r1, r1, #0x1
    strh r1, [r0, #0x68]
    ldrh r2, [r0, #0x68]
    cmp r2, #0x32
    bhs .L_021fefd0
    mov r0, #0x12
    mul r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
    cmp r8, #0x100
    bls .L_021fefb4
    mov r8, #0x100
    bl genrand_int32
    mov r1, #0x1e
    bl func_020bf1f8
    add r0, r1, #0x32
    strh r0, [r5, #0x0]
.L_021fefb4:
    mov r0, r8, lsl #0x10
    mov r0, r0, asr #0x10
    add r1, r7, r6, lsl #0x2
    ldr r1, [r1, #0xf28]
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    b .L_021ff27c
.L_021fefd0:
    cmp r2, #0x3e8
    bhs .L_021ff034
    mov r0, #0x640
    mul r0, r2, r0
    ldr r8, .L_021ff2f0
    mov r0, r0, lsl #0x10
    mul r8, r2, r8
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    mov r2, r8, lsl #0x10
    ldr r1, [r3, #0xf28]
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    ldrsh r0, [r4, r0]
    ldr r8, [r1, #0x30]
    add r2, r4, r2, lsl #0x2
    add r0, r8, r0
    str r0, [r1, #0x30]
    ldr r3, [r3, #0xf28]
    ldrsh r0, [r2, #0x2]
    ldr r1, [r3, #0x34]
    add r0, r1, r0
    str r0, [r3, #0x34]
    b .L_021ff27c
.L_021ff034:
    cmp r2, r11
    bhs .L_021ff0d8
    ldr r0, .L_021ff2e4
    sub r1, r2, #0x3e8
    mul r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x4000
    movhi r0, #0x4000
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r2, [r4, r0]
    mov r0, #0xc
    mla r1, r6, r0, r7
    add r1, r1, #0x1000
    ldr ip, [r1, #0x22c]
    rsb r0, r2, #0x1000
    smull r3, r2, ip, r0
    adds r3, r3, #0x800
    add r10, r7, r6, lsl #0x2
    ldr r9, [r10, #0xf28]
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    ldr r8, [r9, #0x30]
    orr r3, r3, r2, lsl #0x14
    sub r2, r8, r3
    str r2, [r9, #0x30]
    ldr r3, [r1, #0x230]
    ldr r2, [r10, #0xf28]
    smull r9, r8, r3, r0
    mov r0, #0x800
    adds r3, r9, r0
    mov ip, #0x0
    mov r0, ip
    ldr r1, [r2, #0x34]
    adc r0, r8, r0
    mov r3, r3, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    sub r0, r1, r3
    str r0, [r2, #0x34]
    b .L_021ff27c
.L_021ff0d8:
    ldr r0, .L_021ff2ec
    cmp r2, r0
    bhs .L_021ff190
    ldr r0, [sp, #0x4]
    add r10, r7, r6, lsl #0x2
    add r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, [sp, #0x0]
    ldr r9, [r10, #0xf28]
    mul r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x4000
    movhi r0, #0x4000
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r2, [r4, r0]
    mov r0, #0xc
    mla r1, r6, r0, r7
    ldr r0, .L_021ff2f4
    add r1, r1, #0x1000
    ldr ip, [r1, #0x22c]
    sub r0, r0, r2
    smull r3, r2, ip, r0
    adds r3, r3, #0x800
    ldr r8, [r9, #0x30]
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r2, r8, r3
    str r2, [r9, #0x30]
    ldr r3, [r1, #0x230]
    ldr r2, [r10, #0xf28]
    smull r9, r8, r3, r0
    mov r0, #0x800
    adds r3, r9, r0
    mov ip, #0x0
    mov r0, ip
    ldr r1, [r2, #0x34]
    adc r0, r8, r0
    mov r3, r3, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    add r0, r1, r3
    str r0, [r2, #0x34]
    b .L_021ff27c
.L_021ff190:
    ldr r0, [sp, #0x8]
    cmp r2, r0
    bhs .L_021ff27c
    ldr r0, [sp, #0xc]
    add r8, r7, r6, lsl #0x2
    add r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x1d4
    mul r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x4000
    movhi r0, #0x4000
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r2, [r4, r0]
    mov r0, #0x180
    mul r0, r1, r0
    mov r1, #0xc
    mla r1, r6, r1, r7
    add r1, r1, #0x1000
    ldr lr, [r8, #0xf28]
    ldr r10, [r1, #0x22c]
    rsb r9, r2, #0x1800
    smull r3, r2, r10, r9
    adds r10, r3, #0x800
    ldr ip, [lr, #0x30]
    adc r2, r2, #0x0
    mov r3, r10, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    sub r2, ip, r3
    str r2, [lr, #0x30]
    ldr r3, [r1, #0x230]
    ldr r2, [r8, #0xf28]
    smull r9, r8, r3, r9
    adds r9, r9, #0x800
    adc r3, r8, #0x0
    mov r8, r9, lsr #0xc
    ldr r1, [r2, #0x34]
    orr r8, r8, r3, lsl #0x14
    sub r1, r1, r8
    str r1, [r2, #0x34]
    mov r1, #0x23
    bl func_020befec
    rsb r0, r0, #0x180
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    add r1, r7, r6, lsl #0x2
    cmp r0, #0x18
    mov r0, r0, lsl #0x10
    ldr r1, [r1, #0xf28]
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    bhs .L_021ff27c
    mov r0, r7
    mov r1, r6
    bl func_ov042_021fea08
.L_021ff27c:
    ldrh r1, [r5, #0x0]
    cmp r1, #0x3e8
    blo .L_021ff2d4
    ldr r0, .L_021ff2ec
    cmp r1, r0
    bhs .L_021ff2d4
    sub r0, r1, #0x3e8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x9
    mov r1, #0x32
    bl func_020befec
    add r0, r0, #0x100
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x180
    movhi r0, #0x180
    add r1, r7, r6, lsl #0x2
    mov r0, r0, lsl #0x10
    ldr r1, [r1, #0xf28]
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
.L_021ff2d4:
    subs r6, r6, #0x1
    bpl .L_021fee94
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021ff2e4: .word 0x28f
.L_021ff2e8: .word data_020c9670
.L_021ff2ec: .word 0x41a
.L_021ff2f0: .word 0x8fc
.L_021ff2f4: .word 0x14cd
.size func_ov042_021feabc, . - func_ov042_021feabc

