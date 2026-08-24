.text
.extern func_0209a2ac
.extern func_0209b494
.extern func_020befec
.extern func_020b0808
.extern func_ov042_021ffd30
.extern func_ov042_021ffd44
.extern func_ov042_021ffd00
.extern func_ov042_021ffd78
.extern data_ov042_0220ac68
.extern gFx32CosSinTable
    .global func_ov042_021ff31c
func_ov042_021ff31c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x280
    mov r7, r1
    mov r1, #0x0
    mov r2, #0x1
    mov r5, r0
    bl func_0209a2ac
    mov r0, #0x30
    sub r6, r0, #0x1
    mov r4, #0x1
.L_021ff344:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0xf28]
    mov r1, r7
    mov r2, r4
    bl func_0209a2ac
    subs r6, r6, #0x1
    bpl .L_021ff344
    ldr r3, .L_021ffcec
    add r2, sp, #0xc4
    mov r1, #0x6
.L_021ff36c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_021ff36c
    mov ip, #0x0
    add r11, sp, #0x218
    mov r10, #0x10000
    add r9, sp, #0x220
    str ip, [sp, #0x210]
    str ip, [sp, #0x214]
    str r10, [r11, #0x0]
    str r10, [r11, #0x4]
    stmia r9, {r10, ip}
    add r8, sp, #0x228
    mov r7, #0x20000
    stmia r8, {r7, r10}
    add r6, sp, #0x230
    stmia r6, {r7, ip}
    add r4, sp, #0x238
    mov r3, #0x30000
    stmia r4, {r3, r10}
    add r2, sp, #0x240
    stmia r2, {r3, ip}
    add r1, sp, #0x248
    mov r0, #0x40000
    stmia r1, {r0, r10}
    add lr, sp, #0x250
    stmia lr, {r0, ip}
    add r11, sp, #0x258
    mov r8, #0x50000
    stmia r11, {r8, r10}
    add r9, sp, #0x260
    add r1, sp, #0x278
    str r8, [r9, #0x0]
    mov r8, #0x70000
    str ip, [r9, #0x4]
    str r8, [r1, #0x0]
    str r10, [r1, #0x4]
    mov r9, #0x8000
    add r8, sp, #0x1b8
    add lr, sp, #0x1c0
    str ip, [sp, #0x1b0]
    str ip, [sp, #0x1b4]
    str r9, [r8, #0x0]
    str r9, [r8, #0x4]
    stmia lr, {r9, ip}
    add r11, sp, #0x1c8
    add lr, sp, #0x138
    str r10, [r11, #0x0]
    str r9, [r11, #0x4]
    add r8, sp, #0x1d0
    stmia r8, {r10, ip}
    add r6, sp, #0x268
    mov r2, #0x60000
    stmia r6, {r2, r10}
    add r6, sp, #0x1e8
    add r4, sp, #0x270
    stmia r6, {r7, r9}
    stmia r4, {r2, ip}
    add r4, sp, #0x1f0
    stmia r4, {r7, ip}
    add r1, sp, #0x208
    stmia r1, {r3, r9}
    add r8, sp, #0x1d8
    add r11, sp, #0x140
    str ip, [sp, #0x130]
    str ip, [sp, #0x134]
    str r7, [lr, #0x0]
    str r7, [lr, #0x4]
    stmia r11, {r7, ip}
    add r1, sp, #0x148
    stmia r1, {r0, r7}
    add r6, sp, #0x150
    add r11, sp, #0x1e0
    mov r1, #0x18000
    str r0, [r6, #0x0]
    str ip, [r6, #0x4]
    str r9, [r8, #0x4]
    str r1, [r8, #0x0]
    str ip, [r11, #0x4]
    str r1, [r11, #0x0]
    add r8, sp, #0x1f8
    mov r0, #0x28000
    stmia r8, {r0, r9}
    add r11, sp, #0x200
    str r0, [r11, #0x0]
    str ip, [r11, #0x4]
    add r11, sp, #0x158
    stmia r11, {r2, r7}
    add r4, sp, #0x160
    stmia r4, {r2, ip}
    add r6, sp, #0x168
    mov r0, #0x80000
    stmia r6, {r0, r7}
    add r8, sp, #0x170
    stmia r8, {r0, ip}
    add r11, sp, #0xd8
    add r8, sp, #0xe0
    str ip, [sp, #0xd0]
    str ip, [sp, #0xd4]
    str r1, [r11, #0x0]
    str r1, [r11, #0x4]
    stmia r8, {r1, ip}
    add r6, sp, #0xe8
    add r4, sp, #0xf0
    add r0, sp, #0x110
    add r8, sp, #0x178
    str r3, [r6, #0x0]
    add r2, sp, #0x100
    add lr, sp, #0x108
    str r3, [r4, #0x0]
    mov r3, #0xa0000
    stmia r8, {r3, r7}
    str r1, [r6, #0x4]
    add r6, sp, #0x180
    str ip, [r4, #0x4]
    str r3, [r6, #0x0]
    str ip, [r6, #0x4]
    add r4, sp, #0x188
    mov r3, #0xc0000
    stmia r4, {r3, r7}
    add r8, sp, #0x190
    str r3, [r8, #0x0]
    str ip, [r8, #0x4]
    add r6, sp, #0x198
    mov r3, #0xe0000
    stmia r6, {r3, r7}
    add r4, sp, #0x1a0
    add r8, sp, #0x1a8
    add r6, sp, #0xf8
    str r3, [r4, #0x0]
    mov r3, #0xff000
    str ip, [r4, #0x4]
    mov r4, #0x48000
    str r3, [r8, #0x0]
    str r7, [r8, #0x4]
    str r4, [r6, #0x0]
    str r1, [r6, #0x4]
    mov r8, #0xc0000
    str r9, [r0, #0x0]
    str r1, [r0, #0x4]
    add r0, sp, #0x118
    str r9, [lr, #0x0]
    str r10, [r0, #0x0]
    str r7, [r0, #0x4]
    ldrh r0, [sp, #0xcc]
    str ip, [r2, #0x0]
    str r1, [r2, #0x4]
    str r7, [lr, #0x4]
    str r0, [sp, #0x8]
    add r3, sp, #0x120
    add r4, sp, #0xac
    mvn r0, #0x0
    str r0, [sp, #0xc]
    add r0, r0, #0x8000
    rsb r8, r8, #0x0
    str r0, [sp, #0x14]
    mov r0, r8, asr #0x10
    str r0, [sp, #0x1c]
    mov r0, r8, asr #0x11
    str r0, [sp, #0x20]
    ldr r0, [sp, #0xc]
    add r6, sp, #0x128
    sub r0, r0, #0xf
    str r0, [sp, #0x28]
    mov r0, r8, asr #0xf
    str r0, [sp, #0x24]
    ldr r0, [sp, #0xc]
    str r10, [r3, #0x0]
    str r1, [r3, #0x4]
    stmia r6, {r1, r7}
    sub r0, r0, #0x3
    mov r2, #0x64
    ldr r9, .L_021ffcf0
    ldr r11, .L_021ffcf4
    str ip, [sp, #0xa4]
    str ip, [sp, #0xa8]
    str r7, [r4, #0x0]
    str r7, [r4, #0x4]
    sub r4, r2, #0x1
    str r0, [sp, #0x18]
    add r6, sp, #0xc4
.L_021ff644:
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0xb3c]
    cmp r1, #0x6
    bne .L_021ff790
    ldr r0, [r5, #0x48]
    ldr r1, [sp, #0xc]
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    bl func_0209b494
    mov r0, #0x0
    str r0, [r9, #0x0]
    mov r0, #0xc
    mla r7, r4, r0, r5
    ldr r1, [r7, #0x504]
    ldr r2, [r7, #0x54]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    add r1, r11, r1, lsl #0x2
    ldrsh r1, [r1, #0x2]
    mov r3, r2, asr #0xc
    ldr r0, [r7, #0x500]
    add r1, r1, #0x1000
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    mul r1, r0, r1
    ldr r2, [r7, #0x50]
    mov r10, r1, asr #0xc
    mov r0, r2, asr #0xc
    str r0, [r9, #0x2c]
    str r3, [r9, #0x2c]
    mov r0, #0x0
    str r0, [r9, #0x2c]
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xac]
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    mov r0, r1, lsl #0x1
    add r1, r11, r1, lsl #0x1
    ldrsh r0, [r11, r0]
    ldrsh r1, [r1, #0x2]
    bl func_020b0808
    mov r0, #0x0
    rsb r1, r10, #0x0
    str r0, [r9, #0x2c]
    str r1, [r9, #0x2c]
    str r0, [r9, #0x2c]
    ldr r0, [r7, #0x504]
    add r1, r5, r4, lsl #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r2, [r11, r0]
    add r0, r1, #0xa00
    ldrh r0, [r0, #0x74]
    add r2, r2, #0x1000
    add r1, r1, #0xc00
    rsb r3, r0, #0x1e
    mov r0, #0x82
    mul r0, r3, r0
    str r0, [r9, #0x28]
    str r2, [r9, #0x28]
    mov r0, #0x1000
    str r0, [r9, #0x28]
    mov r0, #0x2
    str r0, [r9, #0xbc]
    ldrh r0, [r1, #0xcc]
    str r0, [r9, #0x3c]
    str r8, [r9, #0x48]
    mov r0, #0xad
    str r0, [r9, #0x48]
    ldr r0, .L_021ffcf8
    str r0, [r9, #0x50]
    ldr r0, .L_021ffcfc
    str r0, [r9, #0x50]
    mov r0, #0x0
    str r0, [r9, #0x50]
    str r0, [r9, #0xc0]
    mov r0, #0x1
    str r0, [r9, #0x4]
    b .L_021ffcdc
.L_021ff790:
    cmp r1, #0x4
    bne .L_021ff998
    ldr r0, [r5, #0x48]
    mov r1, #0x29
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    bl func_0209b494
    add r1, r5, r4, lsl #0x1
    add r0, r1, #0xc00
    ldrsh r10, [r0, #0xcc]
    add r0, r1, #0xa00
    ldrh r7, [r0, #0x74]
    mov r0, r10, lsl #0x1
    add r1, r0, #0x1
    rsb r0, r7, #0x1a
    bl func_020befec
    str r0, [sp, #0x10]
    rsb r0, r0, #0x0
    str r0, [sp, #0x94]
    str r0, [sp, #0x98]
    add r0, sp, #0xb4
    add r1, sp, #0x94
    bl func_ov042_021ffd30
    ldr r0, [sp, #0x10]
    add r1, sp, #0x8c
    str r0, [sp, #0x8c]
    str r0, [sp, #0x90]
    add r0, sp, #0xbc
    bl func_ov042_021ffd30
    mov r0, r7, lsr #0x1
    mov r1, #0x3
    bl func_020befec
    add r0, r10, r10, lsl #0x1
    add r0, r1, r0
    mov r7, r0, lsl #0x1
    mov r0, #0x0
    str r0, [r9, #0x0]
    add r0, sp, #0xd0
    add r10, r0, r7, lsl #0x3
    mov r0, #0xc
    mla r0, r4, r0, r5
    ldr r1, [r0, #0x54]
    ldr r0, [r0, #0x50]
    mov r1, r1, asr #0xc
    mov r0, r0, asr #0xc
    str r0, [r9, #0x2c]
    str r1, [r9, #0x2c]
    mov r0, #0x0
    str r0, [r9, #0x2c]
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xac]
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    mov r0, r1, lsl #0x1
    add r1, r11, r1, lsl #0x1
    ldrsh r0, [r11, r0]
    ldrsh r1, [r1, #0x2]
    bl func_020b0808
    mov r0, #0x1
    str r0, [r9, #0xbc]
    ldr r0, [sp, #0x14]
    str r0, [r9, #0x3c]
    add r0, sp, #0xd0
    ldr r0, [r0, r7, lsl #0x3]
    ldr r1, [r10, #0x4]
    bl func_ov042_021ffd44
    mov r3, r4, lsr #0x1f
    rsb r2, r3, r4, lsl #0x1d
    ldr r0, [sp, #0xb4]
    ldr r1, [sp, #0xb8]
    add r2, r3, r2, ror #0x1d
    rsb r2, r2, #0xb2
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov042_021ffd00
    ldr r0, [r10, #0x8]
    ldr r1, [r10, #0x4]
    bl func_ov042_021ffd44
    ldr r1, [sp, #0xb8]
    ldr r0, [sp, #0xbc]
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r9, #0x50]
    ldr r0, [r10, #0x8]
    ldr r1, [r10, #0xc]
    bl func_ov042_021ffd44
    ldr r1, [sp, #0xc0]
    ldr r0, [sp, #0xbc]
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r9, #0x50]
    ldr r0, [r10, #0x0]
    ldr r1, [r10, #0xc]
    bl func_ov042_021ffd44
    ldr r1, [sp, #0xc0]
    ldr r0, [sp, #0xb4]
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r9, #0x50]
    mov r0, #0x0
    str r0, [r9, #0xc0]
    mov r0, #0x1
    str r0, [r9, #0x4]
    b .L_021ffcdc
.L_021ff998:
    cmp r1, #0x0
    blt .L_021ffcdc
    mov r1, #0xc
    mla r3, r4, r1, r5
    ldr r1, [r3, #0x50]
    mov r2, r4, lsr #0x1f
    mov r1, r1, asr #0xc
    str r1, [sp, #0x9c]
    ldr r3, [r3, #0x54]
    rsb r1, r2, r4, lsl #0x1e
    add r2, r2, r1, ror #0x1e
    mov r1, r3, asr #0xc
    str r1, [sp, #0xa0]
    ldr r0, [r0, #0xb3c]
    mov r1, r2, lsl #0x1
    ldrh r7, [r6, r1]
    cmp r0, #0x0
    add r10, sp, #0x210
    bne .L_021ffa30
    ldr r0, [r5, #0x48]
    add r1, r2, #0x1b
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    bl func_0209b494
    ldr r0, [sp, #0x18]
    add r1, sp, #0x84
    str r0, [sp, #0x84]
    str r0, [sp, #0x88]
    add r0, sp, #0xb4
    bl func_ov042_021ffd30
    mov r0, #0x4
    str r0, [sp, #0x7c]
    str r0, [sp, #0x80]
    add r0, sp, #0xbc
    add r1, sp, #0x7c
    bl func_ov042_021ffd30
    ldr r7, [sp, #0x8]
    b .L_021ffcb8
.L_021ffa30:
    cmp r0, #0x1
    bne .L_021ffab4
    ldr r0, [r5, #0x48]
    mov r1, #0x25
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    bl func_0209b494
    ldr r0, [sp, #0x1c]
    add r1, sp, #0x74
    str r0, [sp, #0x74]
    str r0, [sp, #0x78]
    add r0, sp, #0xb4
    bl func_ov042_021ffd30
    mov r0, #0xc
    str r0, [sp, #0x6c]
    str r0, [sp, #0x70]
    add r0, sp, #0xbc
    add r1, sp, #0x6c
    bl func_ov042_021ffd30
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xc00
    ldrsh r0, [r0, #0xcc]
    mov r1, #0x6
    cmp r0, #0x0
    movge r0, r0, lsl #0x1
    ldrgeh r7, [r6, r0]
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x74]
    bl func_020befec
    add r1, sp, #0x210
    add r10, r1, r0, lsl #0x4
    b .L_021ffcb8
.L_021ffab4:
    cmp r0, #0x2
    bne .L_021ffb4c
    ldr r0, [r5, #0x48]
    mov r1, #0x23
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    bl func_0209b494
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x74]
    mov r1, #0x3
    rsb r0, r0, #0x14
    bl func_020befec
    mov r7, r0
    rsb r0, r7, #0x0
    str r0, [sp, #0x64]
    str r0, [sp, #0x68]
    add r0, sp, #0xb4
    add r1, sp, #0x64
    bl func_ov042_021ffd30
    add r0, sp, #0xbc
    add r1, sp, #0x5c
    str r7, [sp, #0x5c]
    str r7, [sp, #0x60]
    bl func_ov042_021ffd30
    add r1, r5, r4, lsl #0x1
    add r0, r1, #0xc00
    ldrsh r0, [r0, #0xcc]
    add r10, sp, #0x1b0
    cmp r0, #0x0
    movge r0, r0, lsl #0x1
    ldrgeh r7, [r6, r0]
    addlt r0, r1, #0xa00
    ldrlth r0, [r0, #0x74]
    movlt r0, r0, lsl #0x1f
    addlt r0, r6, r0, lsr #0x1e
    ldrlth r7, [r0, #0x8]
    b .L_021ffcb8
.L_021ffb4c:
    cmp r0, #0x3
    bne .L_021ffbe4
    ldr r0, [r5, #0x48]
    mov r1, #0x24
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    bl func_0209b494
    ldr r0, [sp, #0x20]
    add r1, sp, #0x54
    str r0, [sp, #0x54]
    str r0, [sp, #0x58]
    add r0, sp, #0xb4
    bl func_ov042_021ffd30
    mov r0, #0x6
    str r0, [sp, #0x4c]
    str r0, [sp, #0x50]
    add r0, sp, #0xbc
    add r1, sp, #0x4c
    bl func_ov042_021ffd30
    add r1, r5, r4, lsl #0x1
    add r0, r1, #0xc00
    ldrsh r0, [r0, #0xcc]
    cmp r0, #0x0
    movge r0, r0, lsl #0x1
    ldrgeh r7, [r6, r0]
    addlt r0, r1, #0xa00
    ldrlth r0, [r0, #0x74]
    mov r1, #0x6
    movlt r0, r0, lsl #0x1f
    addlt r0, r6, r0, lsr #0x1e
    ldrlth r7, [r0, #0x8]
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x74]
    bl func_020befec
    add r1, sp, #0x1b0
    add r10, r1, r0, lsl #0x4
    b .L_021ffcb8
.L_021ffbe4:
    cmp r0, #0x5
    bne .L_021ffc3c
    ldr r0, [r5, #0x48]
    mov r1, #0x28
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    bl func_0209b494
    ldr r0, [sp, #0x24]
    add r1, sp, #0x44
    str r0, [sp, #0x44]
    str r0, [sp, #0x48]
    add r0, sp, #0xb4
    bl func_ov042_021ffd30
    mov r0, #0x18
    str r0, [sp, #0x3c]
    str r0, [sp, #0x40]
    add r0, sp, #0xbc
    add r1, sp, #0x3c
    bl func_ov042_021ffd30
    add r10, sp, #0xa4
    ldr r7, [sp, #0x14]
    b .L_021ffcb8
.L_021ffc3c:
    cmp r0, #0x7
    bne .L_021ffcb8
    ldr r0, [r5, #0x48]
    mov r1, #0x2a
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    bl func_0209b494
    ldr r0, [sp, #0x28]
    add r1, sp, #0x34
    str r0, [sp, #0x34]
    str r0, [sp, #0x38]
    add r0, sp, #0xb4
    bl func_ov042_021ffd30
    mov r0, #0x10
    str r0, [sp, #0x2c]
    str r0, [sp, #0x30]
    add r0, sp, #0xbc
    add r1, sp, #0x2c
    bl func_ov042_021ffd30
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xc00
    ldrsh r0, [r0, #0xcc]
    cmp r0, #0x0
    movge r0, r0, lsl #0x1
    ldrgeh r7, [r6, r0]
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x74]
    mov r1, r0, lsr #0x2
    add r0, sp, #0x130
    add r10, r0, r1, lsl #0x4
.L_021ffcb8:
    str r10, [sp, #0x0]
    add r2, r5, r4, lsl #0x1
    str r7, [sp, #0x4]
    add r2, r2, #0x900
    ldrh r2, [r2, #0xac]
    mov r0, r5
    add r1, sp, #0x9c
    add r3, sp, #0xb4
    bl func_ov042_021ffd78
.L_021ffcdc:
    subs r4, r4, #0x1
    bpl .L_021ff644
    add sp, sp, #0x280
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021ffcec: .word data_ov042_0220ac68
.L_021ffcf0: .word 0x4000444
.L_021ffcf4: .word gFx32CosSinTable
.L_021ffcf8: .word 0xfffdfffd
.L_021ffcfc: .word 0xfffd0003
.size func_ov042_021ff31c, . - func_ov042_021ff31c

