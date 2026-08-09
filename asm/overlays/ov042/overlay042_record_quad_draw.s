.text
.extern data_ov042_0220acc0
.extern func_020befec
.extern func_0209b494
.extern func_ov042_02205b38
    .global func_ov042_02205808
func_ov042_02205808:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x138
    mvn r4, #0x17
    sub r11, r4, #0x8
    add r9, sp, #0xa8
    add r7, sp, #0x88
    add r3, sp, #0x98
    mov r5, r0
    add r0, sp, #0xc8
    mov r10, #0x20
    add r2, sp, #0xa0
    add ip, sp, #0x90
    add r8, sp, #0xb0
    add r6, sp, #0xc0
    add r1, sp, #0x70
    str r11, [r9, #0x0]
    str r11, [r9, #0x4]
    mov r9, #0x18
    str r9, [r1, #0x0]
    str r10, [r1, #0x4]
    add r1, sp, #0x78
    sub r9, r10, #0x2c
    str r11, [r0, #0x0]
    str r11, [r0, #0x4]
    add r0, sp, #0xd0
    str r11, [r7, #0x0]
    str r11, [r7, #0x4]
    add r7, sp, #0xb8
    str r11, [r3, #0x0]
    str r11, [r3, #0x4]
    add r3, sp, #0xd8
    str r10, [r2, #0x0]
    str r10, [r2, #0x4]
    add r2, sp, #0xe8
    str r9, [r1, #0x0]
    str r9, [r1, #0x4]
    add r1, sp, #0x80
    mov lr, #0xc
    str r10, [r0, #0x0]
    str r10, [r0, #0x4]
    add r0, sp, #0xe0
    str r4, [sp, #0x68]
    str r11, [sp, #0x6c]
    str r10, [ip, #0x0]
    str r10, [ip, #0x4]
    str r10, [r8, #0x0]
    str r10, [r8, #0x4]
    str lr, [r1, #0x0]
    str lr, [r1, #0x4]
    str r11, [r7, #0x0]
    str r11, [r7, #0x4]
    str r10, [r6, #0x0]
    str r10, [r6, #0x4]
    str r11, [r3, #0x0]
    str r11, [r3, #0x4]
    str r10, [r0, #0x0]
    str r10, [r0, #0x4]
    str r11, [r2, #0x0]
    str r11, [r2, #0x4]
    ldr r8, .L_02205b34
    add r6, sp, #0xf0
    add r7, sp, #0x10
    ldmia r8!, {r0, r1, r2, r3}
    add ip, sp, #0xf8
    str r10, [r6, #0x0]
    str r10, [r6, #0x4]
    mov r6, r7
    stmia r7!, {r0, r1, r2, r3}
    add r0, sp, #0x100
    add r3, sp, #0x118
    add r1, sp, #0x120
    str r9, [r3, #0x0]
    str r11, [ip, #0x0]
    str r11, [ip, #0x4]
    mov ip, #0x0
    add r9, sp, #0x38
    mov r2, #0x22
    add r11, sp, #0x110
    str r2, [r11, #0x4]
    sub r2, r2, #0x2f
    str r2, [r3, #0x4]
    add r3, sp, #0x48
    add r2, sp, #0x58
    str r10, [r0, #0x0]
    str r10, [r0, #0x4]
    mov r0, #0xd
    str lr, [r1, #0x0]
    str r0, [r1, #0x4]
    sub r10, r0, #0x1d
    ldmia r8, {r0, r1}
    stmia r7, {r0, r1}
    mov r1, #0x20000
    add r7, sp, #0x30
    mov r0, #0x24
    str r0, [r11, #0x0]
    add r0, sp, #0x40
    add r8, sp, #0x50
    str ip, [r9, #0x4]
    str r1, [r9, #0x0]
    mov r9, #0x40000
    str ip, [r3, #0x4]
    str r9, [r3, #0x0]
    mov r3, #0x60000
    str r9, [r0, #0x0]
    str r1, [r0, #0x4]
    add r0, sp, #0x60
    mov r9, #0x80000
    str ip, [r2, #0x4]
    str r3, [r2, #0x0]
    str r3, [r8, #0x0]
    str r1, [r8, #0x4]
    add r2, sp, #0x108
    sub r3, lr, #0x30
    sub r8, lr, #0x2e
    str r3, [r2, #0x0]
    str r8, [r2, #0x4]
    str ip, [sp, #0x28]
    str ip, [sp, #0x2c]
    add ip, sp, #0x128
    add r3, sp, #0x130
    mov r2, #0x10
    str r9, [r0, #0x0]
    str r1, [r0, #0x4]
    mov r0, #0x40
    str r10, [ip, #0x0]
    str r10, [ip, #0x4]
    str r2, [r3, #0x0]
    str r2, [r3, #0x4]
    str r1, [r7, #0x0]
    str r1, [r7, #0x4]
    sub r7, r0, #0x1
    mov r4, r4, lsr #0x11
    add r11, sp, #0x28
.L_02205a1c:
    add r10, r5, r7
    ldrsb r0, [r10, #0x4]
    cmp r0, #0x0
    blt .L_02205b24
    cmp r0, #0x64
    beq .L_02205b24
    mov r0, #0xc
    mla r1, r7, r0, r5
    ldr r0, [r1, #0x148]
    mov r0, r0, asr #0xc
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x14c]
    mov r0, r0, asr #0xc
    str r0, [sp, #0xc]
    ldrsb r0, [r10, #0x4]
    cmp r0, #0xc
    beq .L_02205ac8
    add r0, r5, r7, lsl #0x1
    add r0, r0, #0x700
    ldrsh r8, [r0, #0x44]
    mov r1, #0x6
    mov r0, r8
    bl func_020befec
    cmp r1, #0x3
    rsbge r1, r1, #0x6
    rsb r2, r1, #0x1f
    orr r1, r2, r2, lsl #0x5
    orr r1, r1, r2, lsl #0xa
    mov r1, r1, lsl #0x10
    mov r0, r8, asr #0x1
    mov r8, r1, lsr #0x10
    mov r1, #0x6
    bl func_020befec
    ldr r0, [r5, #0x0]
    mov r2, r7, lsr #0x1f
    ldr r9, [r6, r1, lsl #0x2]
    rsb r1, r2, r7, lsl #0x1e
    add r1, r2, r1, ror #0x1e
    ldr r0, [r0, #0x20]
    add r1, r1, #0x1f
    mov r2, #0x0
    bl func_0209b494
    b .L_02205af0
.L_02205ac8:
    mov r1, r7, lsr #0x1f
    rsb r0, r1, r7, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    mov r9, r0, lsl #0x1
    ldr r0, [r5, #0x0]
    mov r1, #0x2e
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    mov r8, r4
    bl func_0209b494
.L_02205af0:
    add r0, r11, r9, lsl #0x3
    stmia sp, {r0, r8}
    ldrsb r3, [r10, #0x4]
    add r2, sp, #0x68
    mov r0, r5
    add r3, r2, r3, lsl #0x4
    add r2, r5, r7, lsl #0x1
    ldrh r2, [r2, #0xc4]
    add r1, sp, #0x8
    rsb r2, r2, #0x0
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov042_02205b38
.L_02205b24:
    subs r7, r7, #0x1
    bpl .L_02205a1c
    add sp, sp, #0x138
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02205b34: .word data_ov042_0220acc0
.size func_ov042_02205808, . - func_ov042_02205808

