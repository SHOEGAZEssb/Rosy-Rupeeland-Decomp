.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern data_ov070_022129ac
.extern data_ov070_022129bc
.extern data_ov070_02212a08
.extern data_ov070_02212a28
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_0209a2ac
.extern Graphics3dPresentation_BeginFrame
.extern func_0209b7ec
.extern func_0209b880
.extern func_020adc40
.extern func_020adc90
.extern func_ov070_02210218
.extern func_ov070_0221189c

.global func_ov070_02211dcc
func_ov070_02211dcc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c8
    mov r4, r1
    mov r1, #0x0
    mov r2, #0x1
    mov r10, r0
    bl func_0209a2ac
    add r0, sp, #0x158
    mov r1, r4
    bl VecFx32Object_InitCopy
    ldr r0, [r10, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x1ec]
    mov r3, r1
    cmp r0, #0x0
    moveq r2, #0xc0000
    rsbeq r2, r2, #0x0
    movne r2, #0x0
    add r0, sp, #0x148
    bl VecFx32Object_InitComponents
    ldr r1, [r10, #0x48]
    ldr r0, [r1, #0x1f4]
    cmp r0, #0x1
    bne .L_02211e88
    ldr r0, [r1, #0x1ec]
    mov r1, #0x0
    cmp r0, #0x0
    bne .L_02211e64
    add r0, sp, #0x3c
    mov r3, r1
    sub r2, r1, #0xc0000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x158
    add r1, sp, #0x3c
    bl VecFx32Object_Assign
    add r0, sp, #0x3c
    bl VecFx32Object_Destroy
    b .L_02211e88
.L_02211e64:
    add r0, sp, #0x2c
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, sp, #0x158
    add r1, sp, #0x2c
    bl VecFx32Object_Assign
    add r0, sp, #0x2c
    bl VecFx32Object_Destroy
.L_02211e88:
    ldr r0, [r10, #0x6c]
    add r1, sp, #0x158
    mov r2, #0x1
    bl func_0209a2ac
    mov r0, #0x5
    sub r7, r0, #0x1
    add r6, sp, #0x148
    mov r5, #0x1
.L_02211ea8:
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x74]
    mov r1, r6
    mov r2, r5
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl .L_02211ea8
    mov r0, #0x2
    sub r7, r0, #0x1
    add r6, sp, #0x148
    mov r5, #0x1
.L_02211ed4:
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0xc8]
    mov r1, r6
    mov r2, r5
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl .L_02211ed4
    mov r0, #0x10
    sub r7, r0, #0x1
    add r6, sp, #0x158
    mov r5, #0x1
.L_02211f00:
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x88]
    mov r1, r6
    mov r2, r5
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl .L_02211f00
    ldr r0, [r10, #0x12c]
    mov r1, r4
    add r0, r0, #0x1
    str r0, [r10, #0x12c]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x18]
    bl Graphics3dPresentation_BeginFrame
    ldr r4, .L_022126a8
    ldr r6, .L_022126ac
    ldrh r7, [r4, #0x4]
    add r5, sp, #0x128
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    ldrh r1, [r4, #0x2]
    strh r7, [sp, #0x2a]
    ldr r0, .L_022126b0
    strh r1, [sp, #0x28]
    add ip, sp, #0x118
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    ldr r1, [r4, #0x8]
    ldr r0, [r4, #0xc]
    mov r11, #0x0
    str r0, [sp, #0x24]
    mov r8, #0x30000
    add lr, sp, #0x100
    mov r9, #0x10000
    str r11, [sp, #0xf8]
    str r11, [sp, #0xfc]
    stmia lr, {r9, r11}
    add r0, sp, #0x108
    str r11, [r0, #0x0]
    str r9, [r0, #0x4]
    add r0, sp, #0x110
    mov r7, #0x40000
    str r9, [r0, #0x0]
    str r9, [r0, #0x4]
    str r8, [sp, #0x1c8]
    str r11, [sp, #0x1cc]
    add r0, sp, #0x1d0
    stmia r0, {r7, r11}
    add r0, sp, #0x1d8
    stmia r0, {r8, r9}
    add r0, sp, #0x1e0
    stmia r0, {r7, r9}
    add r0, sp, #0x1e8
    stmia r0, {r7, r11}
    add r5, sp, #0x1f8
    stmia r5, {r7, r9}
    mov r6, #0x50000
    add r0, sp, #0x1f0
    stmia r0, {r6, r11}
    add r0, sp, #0x200
    stmia r0, {r6, r9}
    str r1, [sp, #0x20]
    add ip, sp, #0x208
    stmia ip, {r6, r11}
    add r4, sp, #0x218
    mov r3, #0x14000
    str r6, [r4, #0x0]
    str r3, [r4, #0x4]
    add r7, sp, #0x210
    mov r5, #0x66000
    stmia r7, {r5, r11}
    add r2, sp, #0x220
    add r1, sp, #0x228
    mov r4, #0x68000
    str r5, [r2, #0x0]
    str r3, [r2, #0x4]
    stmia r1, {r4, r11}
    add r6, sp, #0x238
    str r4, [r6, #0x0]
    str r3, [r6, #0x4]
    add r0, sp, #0x230
    mov r2, #0x7e000
    stmia r0, {r2, r11}
    add r7, sp, #0x240
    add ip, sp, #0x248
    add lr, sp, #0x288
    add r1, sp, #0x250
    add r4, sp, #0x258
    mov r0, #0x2c000
    add r6, sp, #0x268
    str r2, [r7, #0x0]
    str r3, [r7, #0x4]
    mov r7, #0x7f000
    add r2, sp, #0x260
    str r5, [ip, #0x0]
    str r3, [ip, #0x4]
    add ip, sp, #0x270
    str r3, [r1, #0x4]
    add r3, sp, #0x278
    str r7, [r1, #0x0]
    add r1, sp, #0x280
    str r5, [r4, #0x0]
    str r0, [r4, #0x4]
    mov r4, #0x44000
    str r7, [r2, #0x0]
    str r0, [r2, #0x4]
    str r5, [r6, #0x0]
    str r0, [r6, #0x4]
    str r7, [ip, #0x0]
    str r0, [ip, #0x4]
    str r5, [r3, #0x0]
    str r4, [r3, #0x4]
    str r7, [r1, #0x0]
    str r4, [r1, #0x4]
    str r11, [lr, #0x0]
    str r8, [lr, #0x4]
    mov r2, #0x12000
    add ip, sp, #0xc0
    add r5, sp, #0xe0
    add r3, sp, #0x290
    add r1, sp, #0x298
    add r7, sp, #0x2a8
    add r6, sp, #0x2b0
    str r2, [sp, #0xdc]
    str r2, [r5, #0x4]
    str r2, [sp, #0xbc]
    str r2, [ip, #0x4]
    add r2, sp, #0xe8
    str r0, [ip, #0x0]
    mov ip, #0x2000
    str ip, [sp, #0xd8]
    str ip, [r2, #0x0]
    add ip, sp, #0xf0
    str r8, [r2, #0x4]
    mov r2, #0x16000
    str r2, [r5, #0x0]
    str r2, [ip, #0x0]
    str r8, [ip, #0x4]
    mov ip, #0x4f000
    mov r2, #0x1f000
    str r8, [r3, #0x4]
    str r2, [r3, #0x0]
    str r11, [r1, #0x0]
    str ip, [r1, #0x4]
    mov r1, #0x20000
    str r8, [r7, #0x4]
    str r8, [r6, #0x4]
    add r8, sp, #0x2a0
    str r2, [r8, #0x0]
    add r2, sp, #0x2c0
    str ip, [r8, #0x4]
    mov r8, #0x3f000
    str r1, [r7, #0x0]
    mov r7, #0x18000
    str r8, [r6, #0x0]
    str r8, [r2, #0x0]
    str ip, [r2, #0x4]
    add r3, sp, #0x2b8
    stmia r3, {r1, ip}
    add r6, sp, #0xc8
    mov r8, #0x1a000
    str r7, [sp, #0xb8]
    add r4, sp, #0xa0
    stmia r6, {r7, r8}
    add r5, sp, #0xd0
    stmia r5, {r0, r8}
    str r11, [sp, #0x98]
    str r11, [sp, #0x9c]
    stmia r4, {r9, r11}
    add lr, sp, #0xa8
    add r4, sp, #0xb0
    add r3, sp, #0x80
    str r9, [sp, #0x78]
    str r11, [sp, #0x7c]
    stmia r3, {r1, r11}
    add r2, sp, #0x88
    str r11, [lr, #0x0]
    str r9, [lr, #0x4]
    add r0, sp, #0x90
    str r9, [r4, #0x0]
    str r9, [r4, #0x4]
    str r9, [r2, #0x0]
    str r9, [r2, #0x4]
    stmia r0, {r1, r9}
    ldr r0, [r10, #0x6c]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    ldrne r0, [r10, #0x118]
    cmpne r0, #0x0
    beq .L_02212690
    add r0, sp, #0x168
    bl func_ov070_02210218
    add r0, sp, #0x174
    bl func_ov070_02210218
    add r0, sp, #0x180
    bl func_ov070_02210218
    add r0, sp, #0x18c
    bl func_ov070_02210218
    add r0, sp, #0x198
    bl func_ov070_02210218
    add r0, sp, #0x1a4
    bl func_ov070_02210218
    add r0, sp, #0x1b0
    bl func_ov070_02210218
    add r0, sp, #0x1bc
    bl func_ov070_02210218
    add r0, sp, #0x168
    add r1, r10, #0xd0
    bl func_ov070_0221189c
    add r0, sp, #0x174
    add r1, r10, #0xdc
    bl func_ov070_0221189c
    ldr r1, [sp, #0x178]
    ldr r0, [sp, #0x16c]
    ldr r3, [sp, #0x17c]
    sub r4, r1, r0
    smull r1, r0, r4, r4
    ldr r2, [sp, #0x170]
    adds r1, r1, #0x800
    sub r5, r3, r2
    adc r0, r0, #0x0
    mov r2, r1, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    smull r1, r0, r5, r5
    adds r1, r1, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    bl func_020adc40
    str r0, [sp, #0xc]
    ldr r1, [sp, #0xc]
    mov r0, r4
    bl func_020adc90
    mov r7, r0
    ldr r1, [sp, #0xc]
    mov r0, r5
    bl func_020adc90
    mov r9, r0
    add r0, sp, #0x168
    add r1, r10, #0xd0
    bl func_ov070_0221189c
    mov r6, r7, asr #0x1f
    mov r1, r6, lsl #0xf
    mov r0, #0x800
    adds r2, r0, r7, lsl #0xf
    orr r1, r1, r7, lsr #0x11
    adc r0, r1, #0x0
    mov r5, r2, lsr #0xc
    orr r5, r5, r0, lsl #0x14
    ldr r0, [r10, #0xd4]
    mov r8, r9, asr #0x1f
    add r0, r0, r5
    str r0, [sp, #0x16c]
    ldr r0, [sp, #0xc]
    mov r2, r8, lsl #0xf
    sub ip, r0, #0x8000
    mov lr, ip, asr #0x1f
    umull r1, r0, r7, ip
    mla r0, r7, lr, r0
    mov r3, #0x800
    orr r2, r2, r9, lsr #0x11
    adds r3, r3, r9, lsl #0xf
    mov r4, r11
    adc r2, r2, r4
    mov r4, r3, lsr #0xc
    orr r4, r4, r2, lsl #0x14
    ldr r2, [r10, #0xd8]
    adds r1, r1, #0x800
    add r2, r2, r4
    str r2, [sp, #0x170]
    mov r2, r11
    mla r0, r6, ip, r0
    umull r11, r3, r9, ip
    mla r3, r9, lr, r3
    adc r0, r0, r2
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r2, [r10, #0xd4]
    mla r3, r8, ip, r3
    add r1, r2, r1
    adds r2, r11, #0x800
    str r1, [sp, #0x178]
    ldr r1, [r10, #0xd8]
    adc r3, r3, #0x0
    str r1, [sp, #0x1c]
    mov r11, r2, lsr #0xc
    ldr r2, [sp, #0x1c]
    orr r11, r11, r3, lsl #0x14
    add r2, r2, r11
    add r0, sp, #0x1b0
    add r1, r10, #0xd0
    str r2, [sp, #0x17c]
    bl func_ov070_0221189c
    mvn r2, #0x0
    mov ip, #0x2
    ldr r1, [r10, #0xd4]
    mov r11, r2, lsl #0xf
    str ip, [sp, #0x18]
    umull lr, ip, r7, r11
    mla ip, r7, r2, ip
    add r1, r1, r5
    str r1, [sp, #0x1c0]
    ldr r0, [sp, #0x178]
    ldr r3, [r10, #0xd8]
    add r1, r0, r5
    adds lr, lr, #0x800
    mla ip, r6, r11, ip
    str r1, [sp, #0x190]
    add r1, r3, r4
    ldr r3, [sp, #0x17c]
    str r1, [sp, #0x1c4]
    mov r1, #0x800
    add r4, r3, r4
    str r4, [sp, #0x194]
    mov r4, r6, lsl #0xd
    orr r4, r4, r7, lsr #0x13
    str r4, [sp, #0x10]
    mov r4, r8, lsl #0xd
    orr r4, r4, r9, lsr #0x13
    str r4, [sp, #0x14]
    mov lr, lr, lsr #0xc
    adc r11, ip, #0x0
    orr lr, lr, r11, lsl #0x14
    add r11, r0, lr
    sub r1, r1, #0x8800
    str r11, [sp, #0x184]
    umull ip, r11, r9, r1
    mla r11, r9, r2, r11
    adds r2, ip, #0x800
    mla r11, r8, r1, r11
    adc r1, r11, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, r3, r2
    str r1, [sp, #0x188]
    mov r1, #0x800
    adds r2, r1, r7, lsl #0xd
    ldr r1, [sp, #0x10]
    mov r2, r2, lsr #0xc
    adc r1, r1, #0x0
    orr r2, r2, r1, lsl #0x14
    str r0, [sp, #0x19c]
    add r0, r0, r2
    str r0, [sp, #0x1a8]
    mov r0, #0x800
    adds r1, r0, r9, lsl #0xd
    ldr r0, [sp, #0x14]
    mov r1, r1, lsr #0xc
    adc r0, r0, #0x0
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    ldr r5, .L_022126b4
    str r3, [sp, #0x1a0]
    add r4, sp, #0x4c
    str r0, [sp, #0x1ac]
.L_02212498:
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldr r0, [sp, #0x18]
    subs r0, r0, #0x1
    str r0, [sp, #0x18]
    bne .L_02212498
    ldr r0, [sp, #0xc]
    mov r11, r0, asr #0xc
    mov r3, r11, asr #0x2
    ldmia r5, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    add r0, r11, r3, lsr #0x1d
    add r1, sp, #0x4c
    mov r0, r0, asr #0x3
    ldr r4, [r1, r0, lsl #0x2]
    add r0, sp, #0x118
    ldr r3, [r0, r4, lsl #0x2]
    ldr r1, [sp, #0x19c]
    mov r2, r3, asr #0x1f
    umull r11, r5, r7, r3
    mla r5, r7, r2, r5
    mla r5, r6, r3, r5
    adds r6, r11, #0x800
    adc r5, r5, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r5, lsl #0x14
    add r1, r1, r6
    umull r6, r5, r9, r3
    mla r5, r9, r2, r5
    mla r5, r8, r3, r5
    adds r3, r6, #0x800
    str r1, [sp, #0x19c]
    ldr r0, [sp, #0x1a0]
    adc r2, r5, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r0, r0, r3
    str r0, [sp, #0x1a0]
    ldr r0, [r10, #0x48]
    mov r1, #0x1b
    ldr r0, [r0, #0x18]
    bl func_0209b7ec
    ldr r0, [r10, #0x12c]
    mov r1, #0x2
    mov r0, r0, asr #0x3
    tst r0, #0x1
    add r2, sp, #0x128
    beq .L_0221258c
    ldrh r0, [sp, #0x28]
    str r1, [sp, #0x0]
    add r3, sp, #0x1c8
    str r0, [sp, #0x4]
    sub r0, r1, #0x16
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x48]
    add r1, sp, #0x198
    ldr r0, [r0, #0x18]
    add r2, r2, r4, lsl #0x3
    add r3, r3, r4, lsl #0x6
    bl func_0209b880
    b .L_022125c4
.L_0221258c:
    ldrh r0, [sp, #0x28]
    str r1, [sp, #0x0]
    add r5, sp, #0x1c8
    str r0, [sp, #0x4]
    sub r0, r1, #0x16
    str r0, [sp, #0x8]
    mov r0, r4, lsl #0x3
    add r3, r0, #0x4
    ldr r1, [r10, #0x48]
    add r2, r2, r4, lsl #0x3
    ldr r0, [r1, #0x18]
    add r1, sp, #0x198
    add r3, r5, r3, lsl #0x3
    bl func_0209b880
.L_022125c4:
    ldr r0, [r10, #0x12c]
    mov r1, #0x2
    mov r0, r0, asr #0x2
    tst r0, #0x1
    add r2, sp, #0x128
    beq .L_02212608
    ldrh r0, [sp, #0x28]
    str r1, [sp, #0x0]
    add r3, sp, #0x98
    str r0, [sp, #0x4]
    sub r0, r1, #0x19
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x48]
    add r1, sp, #0x180
    ldr r0, [r0, #0x18]
    bl func_0209b880
    b .L_02212630
.L_02212608:
    ldrh r0, [sp, #0x28]
    str r1, [sp, #0x0]
    add r3, sp, #0x78
    str r0, [sp, #0x4]
    sub r0, r1, #0x19
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x48]
    add r1, sp, #0x180
    ldr r0, [r0, #0x18]
    bl func_0209b880
.L_02212630:
    ldrh r0, [sp, #0x28]
    mov r1, #0x2
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    sub r0, r1, #0x18
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x48]
    add r1, sp, #0x168
    ldr r0, [r0, #0x18]
    add r2, sp, #0x20
    add r3, sp, #0xd8
    bl func_0209b880
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldrh r1, [sp, #0x28]
    sub r0, r0, #0x17
    add r2, sp, #0x20
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x48]
    add r1, sp, #0x1b0
    ldr r0, [r0, #0x18]
    add r3, sp, #0xb8
    bl func_0209b880
.L_02212690:
    add r0, sp, #0x148
    bl VecFx32Object_Destroy
    add r0, sp, #0x158
    bl VecFx32Object_Destroy
    add sp, sp, #0x2c8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022126a8: .word data_ov070_022129ac
.L_022126ac: .word data_ov070_02212a08
.L_022126b0: .word data_ov070_022129bc
.L_022126b4: .word data_ov070_02212a28
.size func_ov070_02211dcc, . - func_ov070_02211dcc
