    .text

    .extern func_020adc40
    .extern func_020adc90
    .extern func_ov042_021fea08

    .global func_ov042_021fe8e4
func_ov042_021fe8e4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r2, #0x3e8
    mul r2, r1, r2
    mov r1, #0x30
    mov r10, r0
    mov r0, r2, lsl #0x10
    sub r5, r1, #0x1
    mov r4, r0, lsr #0x10
.L_021fe904:
    add r1, r10, r5, lsl #0x2
    add r0, r1, #0x1000
    ldr r0, [r0, #0x4c8]
    cmp r0, #0x3
    bne .L_021fe9d8
    add r0, r10, r5, lsl #0x1
    add r0, r0, #0x1400
    strh r4, [r0, #0x68]
    ldr r3, [r1, #0xf28]
    mov r0, #0xc
    ldr r2, [r3, #0x30]
    mla r1, r5, r0, r10
    ldr r0, [r3, #0x34]
    rsb r7, r2, #0x80000
    rsb r8, r0, #0x88000
    smull r3, r2, r7, r7
    mov r0, #0x800
    adds r3, r3, r0
    mov r0, #0x0
    adc r2, r2, r0
    mov r0, r3, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    add r2, r1, #0x22c
    add r9, r2, #0x1000
    smull r3, r2, r8, r8
    add r1, r1, #0x1000
    ldr r1, [r1, #0x22c]
    adds r3, r3, #0x800
    rsb r6, r1, #0x4
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    movs r11, r0
    bne .L_021fe9a4
    mov r0, r10
    mov r1, r5
    bl func_ov042_021fea08
    b .L_021fe9d8
.L_021fe9a4:
    mov r0, r7
    mov r1, r11
    bl func_020adc90
    mul r0, r6, r0
    str r0, [r9, #0x0]
    mov r1, r11
    mov r0, r8
    bl func_020adc90
    mov r1, #0xc
    mla r1, r5, r1, r10
    mul r2, r6, r0
    add r0, r1, #0x1000
    str r2, [r0, #0x230]
.L_021fe9d8:
    subs r5, r5, #0x1
    bpl .L_021fe904
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov042_021fe8e4, . - func_ov042_021fe8e4
