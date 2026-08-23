.text
.extern func_0209a2ac
.extern Memory_ClearBytes
.extern VecFx32Object_InitComponents
.extern func_020befec
.extern VecFx32Object_Assign
.extern Graphics3dPresentation_DrawRupeeWithEffects
.extern func_0209b494
.extern func_ov042_02204ee4
.extern VecFx32Object_Init
.extern func_020a1794
.extern VecFx32Object_Destroy
.extern func_ov042_02204e74
.extern func_ov042_02205808
.extern func_ov042_02208774
.extern func_ov042_02208fd0
.extern func_ov042_02209968
.extern func_ov042_0220a720
.extern func_0209b668
.extern genrand_int32
.extern func_020bf1f8
.extern func_020adc90
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_StartTransition
.extern data_ov042_0220ad98
.extern data_020c9670
.extern data_ov042_0220b6e0
.extern data_ov042_0220acd8
.extern data_ov042_0220af24
.extern data_ov042_0220b564
.extern gDisplayBrightnessPair
.extern data_ov042_0220ad68

    .global func_ov042_022036c4
func_ov042_022036c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2f8
    mov r10, r0
    ldr r2, [r10, #0x1b8]
    mov r9, r1
    add r3, r2, #0x1
    mov r1, #0x0
    mov r2, #0x1
    str r3, [r10, #0x1b8]
    bl func_0209a2ac
    mov r0, #0x3
    sub r5, r0, #0x1
    mov r4, #0x1
.L_022036f8:
    add r0, r10, r5, lsl #0x2
    ldr r0, [r0, #0x5c]
    mov r1, r9
    mov r2, r4
    bl func_0209a2ac
    subs r5, r5, #0x1
    bpl .L_022036f8
    ldr r0, [r10, #0x1b4]
    cmp r0, #0x0
    bne .L_02203764
    ldr r0, [r10, #0x4c]
    mov r1, r9
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0x54]
    mov r1, r9
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0x50]
    mov r1, r9
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0x58]
    mov r1, r9
    mov r2, #0x2
    bl func_0209a2ac
    b .L_02204110
.L_02203764:
    cmp r0, #0x1
    bne .L_022037a0
    ldr r0, [r10, #0x4c]
    mov r1, r9
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0x54]
    mov r1, r9
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0x50]
    mov r1, r9
    mov r2, #0x0
    bl func_0209a2ac
    b .L_02204110
.L_022037a0:
    cmp r0, #0x2
    bne .L_02204110
    ldr r3, .L_02204738
    add r2, sp, #0x128
    mov r1, #0x1b
.L_022037b4:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_022037b4
    mvn r5, #0x37
    add r11, r5, #0x2e
    mov r3, #0x38
    add r8, r5, #0x12
    add r7, sp, #0x244
    str r5, [sp, #0x238]
    mov r5, #0x36
    add r1, sp, #0x25c
    add r2, sp, #0x250
    str r11, [sp, #0x23c]
    str r8, [sp, #0x240]
    str r5, [r7, #0x4]
    str r5, [r1, #0x4]
    str r8, [r7, #0x8]
    stmia r2, {r3, r11}
    sub r0, r3, #0x40
    sub r6, r3, #0x62
    str r8, [r2, #0x8]
    str r0, [r1, #0x0]
    str r8, [r1, #0x8]
    add r1, sp, #0x268
    str r6, [r1, #0x0]
    stmib r1, {r0, r8}
    add ip, sp, #0x280
    mov r4, #0x2a
    add r5, sp, #0x274
    add r3, sp, #0x28c
    mov r2, #0x28
    str r0, [ip, #0x4]
    add r1, sp, #0x298
    add r0, sp, #0x2a4
    str r2, [r5, #0x4]
    str r2, [r3, #0x4]
    add r2, sp, #0x2b0
    str r4, [ip, #0x0]
    str r8, [ip, #0x8]
    mov ip, #0x18
    str ip, [r2, #0x0]
    add lr, sp, #0x2c8
    sub ip, ip, #0x25
    str ip, [lr, #0x0]
    sub ip, r4, #0x2f
    str ip, [r1, #0x4]
    str ip, [r2, #0x4]
    add ip, sp, #0x2bc
    str r6, [r2, #0x8]
    str r8, [r5, #0x8]
    str r8, [r3, #0x8]
    str r6, [r1, #0x8]
    str r6, [r0, #0x8]
    str r6, [ip, #0x8]
    mov r2, #0x0
    mov r6, #0x3b
    stmia r0, {r2, r6}
    sub r0, r4, #0x30
    str r0, [r3, #0x0]
    sub r0, r4, #0x42
    mov r4, #0x8
    mov r3, #0x6
    str r4, [r7, #0x0]
    str r3, [r5, #0x0]
    str r0, [r1, #0x0]
    stmia ip, {r2, r6}
    str r11, [lr, #0x4]
    str r8, [lr, #0x8]
    mov r4, #0xd
    add ip, sp, #0x2e0
    stmia ip, {r4, r11}
    str r8, [ip, #0x8]
    sub r1, r4, #0x18
    add r0, sp, #0x1e8
    mov r11, #0x41000
    str r11, [r0, #0x0]
    add r7, sp, #0x228
    str r2, [r0, #0x4]
    add r6, sp, #0x2d4
    mov lr, #0xb
    str lr, [r6, #0x0]
    stmib r6, {r3, r8}
    add r5, sp, #0x2ec
    str r3, [r5, #0x4]
    str r8, [r5, #0x8]
    str r1, [r5, #0x0]
    str r1, [sp, #0xe8]
    add r4, sp, #0xf0
    str lr, [r4, #0x0]
    add r3, sp, #0x200
    mov r5, #0x87000
    str r5, [r3, #0x0]
    add r5, sp, #0x1f8
    mov ip, #0x70000
    add r11, sp, #0x220
    mov r0, #0x40000
    add r6, sp, #0x1e0
    mov r1, #0x3f000
    str r1, [r6, #0x0]
    str r0, [r6, #0x4]
    str r0, [r3, #0x4]
    str ip, [r5, #0x0]
    str ip, [r11, #0x0]
    mov ip, #0x88000
    str r0, [r11, #0x4]
    str ip, [r7, #0x0]
    str r2, [r5, #0x4]
    str r2, [r7, #0x4]
    mov r5, #0x1b
    add r11, sp, #0x1f0
    mov ip, #0x6f000
    str ip, [r11, #0x0]
    mov ip, #0x2f000
    str ip, [r11, #0x4]
    add r11, sp, #0x230
    mov ip, #0xa0000
    add r8, sp, #0x208
    mov r1, #0x30000
    str r2, [sp, #0x1d8]
    str r2, [sp, #0x1dc]
    str ip, [r11, #0x0]
    stmia r8, {r0, r1}
    add lr, sp, #0x210
    add r6, sp, #0x218
    mov r3, #0x58000
    mov r7, #0x10000
    str r3, [lr, #0x0]
    str r0, [lr, #0x4]
    str r3, [r6, #0x0]
    str r1, [r6, #0x4]
    str r7, [r11, #0x4]
    str r5, [sp, #0xec]
    sub ip, r5, #0x3d
    add r0, sp, #0xf8
    sub r3, r5, #0x2b
    mov r1, #0x10
    str r5, [r4, #0x4]
    str r3, [r0, #0x0]
    str ip, [r0, #0x4]
    add r11, sp, #0x100
    stmia r11, {r1, ip}
    add lr, sp, #0x108
    sub r8, r1, #0x29
    stmia lr, {r2, r8}
    add r7, sp, #0x110
    stmia r7, {r2, r8}
    add r6, sp, #0x118
    sub r5, r1, #0x30
    sub r4, r1, #0x14
    add r3, sp, #0x120
    str r5, [r6, #0x0]
    str r4, [r6, #0x4]
    mov r2, #0x20
    add r0, sp, #0xd8
    stmia r3, {r2, r4}
    bl Memory_ClearBytes
    add r0, sp, #0xc8
    mov r1, #0xc0
    mov r2, #0xa0
    mov r3, #0x70
    bl VecFx32Object_InitComponents
    ldr r1, [r10, #0xa8]
    ldr r2, [r10, #0xac]
    add r0, sp, #0xb8
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    mov r3, #0xd2
    bl VecFx32Object_InitComponents
    ldr r2, [r10, #0x1d4]
    cmp r2, #0x0
    beq .L_02203ad4
    ldr r0, [r10, #0x1d8]
    ldr r1, .L_0220473c
    mul r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r2, [r1, r0]
    ldr r0, [r10, #0x1dc]
    ldr r1, [r10, #0x1d0]
    smull r3, r0, r2, r0
    adds r2, r3, #0x800
    adc r0, r0, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    mov r0, r2, lsl #0x10
    mov r2, r0, lsr #0x10
    cmp r1, #0x0
    streqh r2, [sp, #0xd8]
    beq .L_02203ad4
    cmp r1, #0x1
    rsbeq r0, r2, #0x0
    streqh r0, [sp, #0xda]
    beq .L_02203ad4
    cmp r1, #0x2
    rsbeq r0, r2, #0x0
    streqh r2, [sp, #0xd8]
    streqh r0, [sp, #0xda]
.L_02203ad4:
    ldr r0, [r10, #0x1bc]
    cmp r0, #0x0
    beq .L_02203b7c
    ldr r1, .L_02204740
    mov r2, #0x640
    add r0, r1, #0xc8
    mov r3, #0x118
    strh r2, [sp, #0xd8]
    strh r1, [sp, #0xda]
    strh r0, [sp, #0xdc]
    strh r3, [sp, #0xde]
    ldr r2, [r10, #0x1bc]
    cmp r2, #0xb4
    ble .L_02203c7c
    sub r0, r2, #0xb4
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    add r0, r3, #0xf
    cmp r2, r0
    rsb r4, r1, #0x87
    ble .L_02203b3c
    ldr r0, .L_02204744
    add r0, r2, r0
    sub r4, r4, r0, lsl #0x1
    cmp r4, #0x1
    movlt r4, #0x1
.L_02203b3c:
    ldr r2, [sp, #0xcc]
    mov r1, #0x87
    mul r0, r2, r4
    bl func_020befec
    ldr r1, [sp, #0xd0]
    str r0, [sp, #0xcc]
    mul r0, r1, r4
    mov r1, #0x87
    bl func_020befec
    ldr r1, [sp, #0xd4]
    str r0, [sp, #0xd0]
    mul r0, r1, r4
    mov r1, #0x87
    bl func_020befec
    str r0, [sp, #0xd4]
    b .L_02203c7c
.L_02203b7c:
    ldr r2, [r10, #0x1cc]
    cmp r2, #0x0
    beq .L_02203c14
    ldr r0, [r10, #0x1e0]
    cmp r0, #0x0
    bne .L_02203bd4
    mvn r0, #0x63
    mul r0, r2, r0
    strh r0, [sp, #0xd8]
    ldr r1, [r10, #0x1cc]
    mov r0, #0x64
    mul r0, r1, r0
    strh r0, [sp, #0xda]
    ldr r1, [r10, #0x1cc]
    mov r0, #0x12c
    mul r2, r1, r0
    strh r2, [sp, #0xdc]
    ldr r1, [r10, #0x1cc]
    sub r0, r0, #0x258
    mul r0, r1, r0
    strh r0, [sp, #0xde]
    b .L_02203c7c
.L_02203bd4:
    mov r0, #0x12c
    mul r1, r2, r0
    strh r1, [sp, #0xd8]
    ldr r1, [r10, #0x1cc]
    sub r0, r0, #0x258
    mul r0, r1, r0
    strh r0, [sp, #0xda]
    ldr r1, [r10, #0x1cc]
    mov r0, #0x190
    mul r2, r1, r0
    strh r2, [sp, #0xdc]
    ldr r1, [r10, #0x1cc]
    sub r0, r0, #0x320
    mul r0, r1, r0
    strh r0, [sp, #0xde]
    b .L_02203c7c
.L_02203c14:
    ldr r0, [r10, #0x1b0]
    cmp r0, #0x0
    beq .L_02203c7c
    cmp r0, #0xb4
    subge r0, r0, #0xb4
    mov r3, #0x200
    movge r0, r0, lsl #0x1
    rsbge r3, r0, #0x200
    ldr r2, [sp, #0xcc]
    ldr r1, [sp, #0xd0]
    ldr r0, [sp, #0xd4]
    mul r4, r1, r3
    mul r5, r2, r3
    mul r3, r0, r3
    mov r0, r5, asr #0x7
    mov r1, r4, asr #0x7
    mov r2, r3, asr #0x7
    add r1, r4, r1, lsr #0x18
    mov r1, r1, asr #0x8
    add r0, r5, r0, lsr #0x18
    add r2, r3, r2, lsr #0x18
    mov r3, r0, asr #0x8
    mov r0, r2, asr #0x8
    str r3, [sp, #0xcc]
    str r1, [sp, #0xd0]
    str r0, [sp, #0xd4]
.L_02203c7c:
    ldr r5, [r10, #0x150]
    ldr r0, [r10, #0x1c4]
    mov r4, r5
    cmp r0, #0x0
    ble .L_02203ca0
    cmp r0, #0x3
    movgt r0, #0x100
    movle r0, #0x0
    orr r4, r4, r0
.L_02203ca0:
    ldr r1, .L_02204748
    add r0, sp, #0xa8
    sub r2, r1, #0x32
    add r3, r1, #0xfa
    bl VecFx32Object_InitComponents
    ldr r0, .L_0220474c
    ldr r2, .L_0220473c
    ldrh r3, [r0, #0x0]
    mov r1, #0x5
    add r3, r3, #0xc8
    strh r3, [r0, #0x0]
    ldrh r0, [r0, #0x0]
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r2, r0]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r2, r0]
    bl func_020befec
    ldr r2, [sp, #0xac]
    add r1, sp, #0xa8
    add r0, r2, r0
    str r0, [sp, #0xac]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x20]
    add r0, r0, #0x70
    bl VecFx32Object_Assign
    mov r3, r4, lsl #0x10
    ldr r1, [r10, #0x1bc]
    ldr r0, .L_02204750
    add r2, sp, #0xc8
    cmp r1, r0
    ldr r0, [r10, #0x48]
    movgt r1, #0x0
    ldr r0, [r0, #0x20]
    movle r1, #0x1000
    str r1, [r0, #0x80]
    ldr r0, [r10, #0x48]
    add r1, sp, #0xb8
    ldr r0, [r0, #0x20]
    mov r3, r3, lsr #0x10
    bl Graphics3dPresentation_DrawRupeeWithEffects
    ldr r2, [sp, #0xcc]
    ldr r1, [sp, #0xd0]
    ldr r0, [sp, #0xd4]
    mov r7, r2, lsl #0xc
    mov r4, r0, lsl #0xc
    mov r6, r1, lsl #0xc
    mov r0, r7, asr #0x6
    add r1, r7, r0, lsr #0x19
    mov r2, r6, asr #0x6
    mov r3, r4, asr #0x6
    add r2, r6, r2, lsr #0x19
    add r3, r4, r3, lsr #0x19
    add r0, sp, #0x98
    mov r1, r1, asr #0x7
    mov r2, r2, asr #0x7
    mov r3, r3, asr #0x7
    bl VecFx32Object_InitComponents
    ldr r0, [r10, #0x48]
    mov r1, #0x26
    ldr r0, [r0, #0x20]
    mov r2, #0x0
    bl func_0209b494
    ldr r6, .L_02204754
    add r4, sp, #0x78
    ldmia r6!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r0, [r10, #0x1c4]
    cmp r0, #0x3
    movgt r0, #0x8
    strgt r0, [sp, #0x94]
    strgt r0, [sp, #0x90]
    ldr r0, [r10, #0x1d4]
    cmp r0, #0x0
    beq .L_02203df8
    tst r0, #0x8
    ldreq r1, [r10, #0x1d0]
    addeq r0, sp, #0x78
    addeq r1, r1, #0x6
    moveq r2, #0xa
    streq r2, [r0, r1, lsl #0x2]
.L_02203df8:
    add r0, sp, #0x138
    ldrh r8, [r0, #0x1e]
    mov r0, #0x8
    sub r7, r0, #0x1
    mov r1, r5, lsl #0x2
    add r0, sp, #0x128
    add r5, sp, #0x238
    add r6, r0, r1, lsl #0x1
    add r4, sp, #0xe8
    add r11, sp, #0x1d8
.L_02203e20:
    add r0, r7, r7, lsr #0x1f
    mov r0, r0, asr #0x1
    add r0, r6, r0, lsl #0x1
    ldrh r2, [r0, #0x6]
    ldr r1, [r10, #0x1bc]
    ldr r0, .L_02204750
    cmp r1, r0
    mov r1, r7, lsl #0x1
    mov r0, #0xc
    mla r0, r1, r0, r5
    str r0, [sp, #0x0]
    add r0, r4, r7, lsl #0x3
    str r0, [sp, #0x4]
    add r0, sp, #0x78
    ldr r3, [r0, r7, lsl #0x2]
    movgt r2, r8
    add r3, r11, r3, lsl #0x3
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    add r2, sp, #0xd8
    ldrh r2, [r2, r1]
    mov r0, r10
    add r1, sp, #0xb8
    add r3, sp, #0x98
    bl func_ov042_02204ee4
    subs r7, r7, #0x1
    bpl .L_02203e20
    ldr r4, [r10, #0x1bc]
    cmp r4, #0x0
    ble .L_022040f0
    ldr r7, .L_02204758
    add r6, sp, #0x160
    mov r5, #0x7
.L_02203ea4:
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_02203ea4
    ldr r2, .L_0220475c
    ldmia r7, {r0, r1}
    stmia r6, {r0, r1}
    cmp r4, r2
    bge .L_02203f44
    mov r1, r4, lsr #0x1f
    rsb r0, r1, r4, lsl #0x1e
    adds r0, r1, r0, ror #0x1e
    bne .L_02203f44
    mov r0, r4, asr #0x1
    add r0, r4, r0, lsr #0x1e
    mov r0, r0, asr #0x2
    mov r1, #0x1e
    bl func_020befec
    add r0, sp, #0x160
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    beq .L_02203f44
    str r0, [r10, #0x25c]
    mov r0, #0x6
    str r0, [r10, #0x244]
    mov r1, #0x1
    add r0, sp, #0x68
    str r1, [r10, #0x260]
    bl VecFx32Object_Init
    ldr r0, [r10, #0x48]
    add r2, sp, #0x68
    add r1, r10, #0xa4
    mov r3, #0x0
    bl func_020a1794
    ldr r1, [sp, #0x6c]
    add r0, sp, #0x68
    str r1, [r10, #0x254]
    ldr r1, [sp, #0x70]
    str r1, [r10, #0x258]
    bl VecFx32Object_Destroy
.L_02203f44:
    ldr r0, [r10, #0x1bc]
    ldr r2, .L_02204750
    mov r1, r0, asr #0x1
    and r1, r1, #0x1
    mul r3, r0, r1
    mov r1, r3, asr #0x5
    add r1, r3, r1, lsr #0x1a
    cmp r0, r2
    sub r4, r0, r1, asr #0x6
    ble .L_02203fb4
    rsb r1, r2, #0x0
    add r3, r0, r1
    cmp r3, #0x14
    ldr r1, .L_02204760
    movgt r3, #0x14
    mul r1, r3, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    ldr r2, .L_0220473c
    mov r1, r1, lsl #0x1
    ldrsh r2, [r2, r1]
    mov r1, #0xdc
    rsb r2, r2, #0x1000
    mul r1, r2, r1
    add r4, r4, r1, asr #0xc
.L_02203fb4:
    ldr r1, .L_0220475c
    cmp r0, r1
    ble .L_02203ffc
    rsb r1, r1, #0x0
    add r3, r0, r1
    cmp r3, #0xa
    ldr r0, .L_02204760
    movgt r3, #0xa
    mul r1, r3, r0
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    ldr r2, .L_0220473c
    mov r1, r1, lsl #0x2
    ldrsh r1, [r2, r1]
    rsb r0, r0, #0x5d0
    smulbb r0, r1, r0
    add r4, r4, r0, asr #0xc
.L_02203ffc:
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov042_02204e74
    ldr r2, .L_02204764
    mov r5, #0x0
    str r5, [r2, #0x0]
    ldr r0, [r10, #0xa8]
    ldr r1, [r10, #0xac]
    mov r0, r0, asr #0xc
    str r0, [r2, #0x2c]
    mov r0, r1, asr #0xc
    str r0, [r2, #0x2c]
    str r5, [r2, #0x2c]
    mov r1, #0x1000
    str r1, [r2, #0x28]
    str r1, [r2, #0x28]
    str r1, [r2, #0x28]
    mov r3, #0x2
    ldr r1, .L_02204768
    str r3, [r2, #0xbc]
    str r1, [r2, #0x3c]
    mov r0, #0x11
    sub r3, r0, #0x1
    str r5, [r2, #0x48]
    mov r1, #0xe9
    str r1, [r2, #0x48]
    ldr r1, .L_0220473c
    mov r0, r5
.L_02204084:
    mov r5, r3, lsl #0x1c
    mov r5, r5, lsr #0x10
    mov r5, r5, asr #0x4
    mov r6, r5, lsl #0x1
    mov r5, r6, lsl #0x1
    ldrsh r5, [r1, r5]
    add r6, r1, r6, lsl #0x1
    ldrsh r6, [r6, #0x2]
    mul r5, r4, r5
    mul r7, r4, r6
    mov r5, r5, lsl #0x4
    mov r6, r5, asr #0x10
    mov r5, r7, lsl #0x4
    mov r6, r6, lsl #0x10
    mov r5, r5, asr #0x10
    mov r6, r6, lsr #0x10
    mov r5, r5, lsl #0x10
    mov r6, r6, lsl #0x10
    orr r5, r6, r5, lsr #0x10
    str r5, [r2, #0x50]
    str r0, [r2, #0x50]
    subs r3, r3, #0x1
    bpl .L_02204084
    ldr r2, .L_0220476c
    mov r1, #0x1
    str r0, [r2, #0x0]
    str r1, [r2, #-0xbc]
.L_022040f0:
    add r0, sp, #0x98
    bl VecFx32Object_Destroy
    add r0, sp, #0xa8
    bl VecFx32Object_Destroy
    add r0, sp, #0xb8
    bl VecFx32Object_Destroy
    add r0, sp, #0xc8
    bl VecFx32Object_Destroy
.L_02204110:
    ldr r0, [r10, #0xa0]
    bl func_ov042_02205808
    ldr r0, [r10, #0x68]
    cmp r0, #0x0
    beq .L_02204184
    mov r0, #0x4
    sub r4, r0, #0x1
.L_0220412c:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x68]
    mov r1, r9
    bl func_ov042_02208774
    subs r4, r4, #0x1
    bpl .L_0220412c
    mov r0, #0x3
    sub r4, r0, #0x1
.L_0220414c:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x78]
    mov r1, r9
    bl func_ov042_02208fd0
    subs r4, r4, #0x1
    bpl .L_0220414c
    mov r0, #0x2
    sub r4, r0, #0x1
.L_0220416c:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x84]
    mov r1, r9
    bl func_ov042_02209968
    subs r4, r4, #0x1
    bpl .L_0220416c
.L_02204184:
    mov r0, #0x5
    sub r4, r0, #0x1
.L_0220418c:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x8c]
    bl func_ov042_0220a720
    subs r4, r4, #0x1
    bpl .L_0220418c
    ldr r0, [r10, #0x23c]
    cmp r0, #0x0
    beq .L_022043c8
    add r2, r0, #0x1
    ldr r0, .L_02204770
    str r2, [r10, #0x23c]
    mul r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, .L_0220473c
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x32
    smulbb r0, r1, r0
    movs r5, r0, asr #0xc
    mov r0, #0x0
    movmi r5, #0x0
    strmi r5, [r10, #0x23c]
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    cmp r5, #0x32
    mov r1, r0
    mov r2, r0
    mov r3, r0
    movgt r5, #0x32
    str r0, [sp, #0xc]
    bl func_ov042_02204e74
    ldr r2, .L_02204764
    mov r7, #0x0
    str r7, [r2, #0x0]
    ldr r1, [r10, #0xac]
    ldr r0, [r10, #0xa8]
    mov r1, r1, asr #0xc
    mov r0, r0, asr #0xc
    str r0, [r2, #0x2c]
    sub r0, r1, #0x3c
    str r0, [r2, #0x2c]
    str r7, [r2, #0x2c]
    mov r0, #0x1000
    str r0, [r2, #0x28]
    str r0, [r2, #0x28]
    str r0, [r2, #0x28]
    mov r1, #0x2
    str r1, [r2, #0xbc]
    ldr r0, .L_02204774
    mov r3, #0xad
    str r0, [r2, #0x3c]
    str r7, [r2, #0x48]
    mov r0, r5
    mov r1, #0x5
    str r3, [r2, #0x48]
    ldr r6, .L_02204778
    bl func_020befec
    ldr r4, .L_0220473c
    ldr r11, .L_0220477c
    mov r8, r0
.L_02204288:
    and r1, r7, #0x1
    mov r0, r5
    add r1, r1, #0x1
    bl func_020befec
    mov r1, r6, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    mov r2, r1, lsl #0x1
    add r1, r4, r1, lsl #0x1
    ldrsh r3, [r1, #0x2]
    ldrsh r2, [r4, r2]
    ldr r1, .L_02204780
    mov ip, r7, lsl #0x1
    mul r2, r8, r2
    mul r3, r8, r3
    ldrh r1, [r1, ip]
    mov r2, r2, lsl #0x4
    mov r3, r3, lsl #0x4
    mov r2, r2, asr #0x10
    mov r3, r3, asr #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    orr r2, r3, r2, lsl #0x10
    add r3, r6, r1
    add ip, r6, r1, lsr #0x1
    mov r1, ip, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r3, r3, lsl #0x10
    mov r1, r1, lsl #0x1
    mov r6, r3, lsr #0x10
    mov r3, r1, lsl #0x1
    str r2, [r11, #0x0]
    ldrsh ip, [r4, r3]
    add r1, r4, r1, lsl #0x1
    ldrsh r1, [r1, #0x2]
    mul ip, r0, ip
    mul r1, r0, r1
    mov r0, r1, lsl #0x4
    mov r1, ip, lsl #0x4
    mov r1, r1, asr #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    add r7, r7, #0x1
    mov r3, r6, asr #0x4
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    mov r1, r3, lsl #0x1
    str r0, [r11, #0x0]
    mov r0, r1, lsl #0x1
    ldrsh r3, [r4, r0]
    add r0, r4, r1, lsl #0x1
    ldrsh r1, [r0, #0x2]
    mul r0, r8, r3
    mul r1, r8, r1
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x4
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    orr r1, r1, r0, lsl #0x10
    str r1, [r11, #0x0]
    str r2, [r11, #0x0]
    mov r0, #0x0
    str r0, [r11, #0x0]
    str r1, [r11, #0x0]
    cmp r7, #0x8
    blt .L_02204288
    ldr r2, .L_0220476c
    mov r1, #0x1
    str r0, [r2, #0x0]
    str r1, [r2, #-0xbc]
.L_022043c8:
    ldr r0, [r10, #0x240]
    cmp r0, #0x0
    beq .L_02204618
    sub r1, r0, #0x1
    mov r0, #0x0
    str r1, [r10, #0x240]
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov042_02204e74
    ldr r0, .L_02204764
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x20]
    bl func_0209b668
    ldr r0, [r9, #0x8]
    ldr r4, .L_02204784
    mov r2, r0, asr #0xc
    mov r1, #0x0
    mov r0, #0x20
    sub r11, r0, #0x1
    mvn r0, #0x0
    str r0, [sp, #0x20]
    add r0, r0, #0x8000
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x20]
    str r1, [r4, #0x0]
    add r2, r2, #0xc0
    str r2, [r4, #0x0]
    str r1, [r4, #0x0]
    add r0, r0, #0x334
    sub r1, r4, #0x4
    mov r2, #0x1000
    str r2, [r1, #0x0]
    str r2, [r1, #0x0]
    str r2, [r1, #0x0]
    str r0, [sp, #0x30]
.L_02204470:
    bl genrand_int32
    mov r1, #0x640
    bl func_020bf1f8
    sub r0, r1, #0x320
    add r0, r0, r11, lsl #0xb
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    ldr r0, .L_0220473c
    mov r1, r2, lsl #0x1
    add r0, r0, r2, lsl #0x1
    ldrsh r5, [r0, #0x2]
    ldr r0, .L_0220473c
    cmp r5, #0x0
    movgt r8, #0x1
    ldrsh r6, [r0, r1]
    ldrle r8, [sp, #0x20]
    cmp r6, #0x0
    movgt r7, #0x1
    ldrle r7, [sp, #0x20]
    mul r1, r5, r8
    mul r0, r6, r7
    sub r1, r1, r0
    ldr r0, [sp, #0x30]
    cmp r1, r0
    ble .L_02204510
    mov r0, r6
    mov r1, r5
    bl func_020adc90
    mov r1, #0x8d000
    mul r7, r8, r1
    smull r2, r1, r0, r7
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, #0x0
    adc r0, r1, r0
    mov r8, r2, lsr #0xc
    orr r8, r8, r0, lsl #0x14
    b .L_02204540
.L_02204510:
    mov r0, r5
    mov r1, r6
    bl func_020adc90
    mov r1, #0x6a000
    mul r8, r7, r1
    smull r2, r1, r0, r8
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, #0x0
    adc r0, r1, r0
    mov r7, r2, lsr #0xc
    orr r7, r7, r0, lsl #0x14
.L_02204540:
    bl genrand_int32
    mov r1, #0x32
    bl func_020bf1f8
    add r0, r1, #0x3c
    mov r1, #0x2
    str r1, [r4, #0x90]
    ldr r1, [sp, #0x24]
    mov r3, r5, lsl #0x2
    str r1, [r4, #0x10]
    mul r1, r5, r0
    mul r0, r6, r0
    mov r0, r0, lsl #0x4
    mov r0, r0, asr #0x10
    mov r1, r1, lsl #0x4
    mov r0, r0, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r0, r0, r1, lsr #0x10
    add r1, r7, r6, lsl #0x2
    mov r1, r1, lsl #0x4
    str r0, [r4, #0x1c]
    mov r0, #0x0
    mov r1, r1, asr #0x10
    str r0, [r4, #0x1c]
    mov r0, r6, lsl #0x2
    mov r2, r1, lsl #0x10
    add r1, r8, r5, lsl #0x2
    rsb r0, r0, #0x0
    mov r1, r1, lsl #0x4
    add r0, r7, r0
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x24]
    rsb r0, r3, #0x0
    add r0, r8, r0
    mov r0, r0, lsl #0x4
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    orr r0, r0, r2, lsr #0x10
    str r0, [r4, #0x24]
    mov r0, #0x0
    str r0, [r4, #0x94]
    subs r11, r11, #0x1
    bpl .L_02204470
.L_02204618:
    ldr r0, [r10, #0x244]
    cmp r0, #0x0
    beq .L_022048fc
    sub r1, r0, #0x1
    mov r0, #0x0
    str r1, [r10, #0x244]
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov042_02204e74
    ldr r0, .L_02204764
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x20]
    bl func_0209b668
    ldr r1, .L_02204784
    ldr r3, [r9, #0x8]
    mvn r0, #0x3f
    mov r2, #0x0
    str r2, [r1, #0x0]
    sub r0, r0, r3, asr #0xc
    str r0, [r1, #0x0]
    str r2, [r1, #0x0]
    sub r0, r1, #0x4
    mov r1, #0x1000
    str r1, [r0, #0x0]
    str r1, [r0, #0x0]
    str r1, [r0, #0x0]
    ldr r0, [r10, #0x25c]
    str r0, [sp, #0x1c]
    b .L_022048e0
.L_022046a8:
    ldr r1, [r10, #0x25c]
    mov r0, #0x10000
    bl func_020befec
    mov r4, r0
    bl genrand_int32
    ldr r1, .L_02204788
    bl func_020bf1f8
    ldr r2, .L_0220478c
    ldr r0, [sp, #0x1c]
    add r1, r1, r2
    mla r1, r0, r4, r1
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    ldr r3, .L_0220473c
    mov r1, r0, lsl #0x1
    add r0, r3, r1, lsl #0x1
    ldrsh r4, [r0, #0x2]
    mov r0, r1, lsl #0x1
    ldrsh r5, [r3, r0]
    cmp r4, #0x0
    movgt r11, #0x1
    movle r11, r2, asr #0xb
    cmp r5, #0x0
    movgt r8, #0x1
    mvnle r8, #0x0
    mul r2, r4, r11
    mul r1, r5, r8
    ldr r0, .L_02204790
    sub r1, r2, r1
    cmp r1, r0
    ble .L_0220479c
    mov r0, r5
    mov r1, r4
    bl func_020adc90
    b .L_022047a8
.L_02204738: .word data_ov042_0220ad98
.L_0220473c: .word data_020c9670
.L_02204740: .word 0xfc18
.L_02204744: .word 0xfffffed9
.L_02204748: .word 0xfffffd12
.L_0220474c: .word data_ov042_0220b6e0
.L_02204750: .word 0x127
.L_02204754: .word data_ov042_0220acd8
.L_02204758: .word data_ov042_0220af24
.L_0220475c: .word 0x11d
.L_02204760: .word 0x666
.L_02204764: .word 0x4000444
.L_02204768: .word 0x6f7b
.L_0220476c: .word 0x4000504
.L_02204770: .word 0x1c2
.L_02204774: .word 0x7fff
.L_02204778: .word 0xf254
.L_0220477c: .word 0x4000494
.L_02204780: .word data_ov042_0220b564
.L_02204784: .word 0x4000470
.L_02204788: .word 0xbb8
.L_0220478c: .word 0xfffffa24
.L_02204790: .word 0xfffff99a
.L_02204794: .word 0x4000500
.L_02204798: .word 0x4f7b
.L_0220479c:
    mov r0, r4
    mov r1, r5
    bl func_020adc90
.L_022047a8:
    ldr r3, [r10, #0x254]
    ldr r2, [r10, #0x258]
    ldr r1, .L_02204794
    mov r0, #0x2
    str r0, [r1, #0x0]
    ldr r0, [r10, #0x260]
    add r3, r3, r4, lsl #0x3
    cmp r0, #0x0
    ldreq r0, .L_02204798
    add r2, r2, r5, lsl #0x3
    streq r0, [r1, #-0x80]
    ldrne r0, .L_02204e50
    sub r6, r3, #0x80000
    sub r7, r2, #0x20000
    strne r0, [r1, #-0x80]
    mov r0, r7, lsl #0x4
    mov r1, r0, asr #0x10
    mov r0, r6, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    ldr r0, .L_02204e54
    str r1, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x0]
.L_02204818:
    bl genrand_int32
    mov r1, #0x28
    bl func_020bf1f8
    add r0, r1, #0xa
    mla r6, r4, r0, r6
    mla r7, r5, r0, r7
    bl genrand_int32
    mov r1, #0x18
    bl func_020bf1f8
    sub r0, r1, #0xc
    str r0, [sp, #0x18]
    bl genrand_int32
    and r2, r0, #0x1
    ldr r0, [sp, #0x18]
    add r1, r2, r0
    mla r3, r4, r1, r7
    sub r0, r0, r2
    mla r2, r5, r0, r6
    mla r0, r4, r0, r7
    mla r1, r5, r1, r6
    mov r3, r3, lsl #0x4
    mov r3, r3, asr #0x10
    mov r2, r2, lsl #0x4
    mov r0, r0, lsl #0x4
    mov r3, r3, lsl #0x10
    mov r2, r2, asr #0x10
    mov r0, r0, asr #0x10
    mov r3, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x4
    mov r0, r0, lsr #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r3, r3, r2, lsr #0x10
    ldr r2, .L_02204e54
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r0, r1, lsr #0x10
    str r3, [r2, #0x8]
    mov r0, r2
    str r1, [r0, #0x8]
    mul r0, r6, r11
    cmp r0, #0x8c000
    mullt r0, r7, r8
    cmplt r0, #0xf0000
    blt .L_02204818
    ldr r0, .L_0220476c
    mov r1, #0x0
    str r1, [r0, #0x0]
.L_022048e0:
    ldr r0, [sp, #0x1c]
    subs r0, r0, #0x1
    str r0, [sp, #0x1c]
    bpl .L_022046a8
    ldr r0, .L_02204e58
    mov r1, #0x1
    str r1, [r0, #0x0]
.L_022048fc:
    ldr r0, [r10, #0x248]
    cmp r0, #0x0
    beq .L_02204be0
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov042_02204e74
    ldr r0, .L_02204764
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x20]
    bl func_0209b668
    ldr r2, [r9, #0x8]
    mvn r0, #0x3f
    ldr r3, .L_02204784
    mov r1, #0x0
    str r1, [r3, #0x0]
    sub r0, r0, r2, asr #0xc
    str r0, [r3, #0x0]
    str r1, [r3, #0x0]
    ldr r0, [r10, #0x268]
    ldr r2, [r10, #0x26c]
    sub r0, r0, #0x80000
    sub r2, r2, #0x20000
    mov r0, r0, asr #0xc
    str r0, [r3, #0x0]
    mov r0, r2, asr #0xc
    str r0, [r3, #0x0]
    str r1, [r3, #0x0]
    ldr r0, [r10, #0x248]
    cmp r0, #0x1
    bne .L_022049b0
    ldr r0, .L_02204e5c
    str r0, [r10, #0x274]
    str r0, [r10, #0x278]
    ldr r0, [r10, #0x248]
    add r0, r0, #0x1
    str r0, [r10, #0x248]
    b .L_02204b3c
.L_022049b0:
    cmp r0, #0xa
    bge .L_022049e8
    ldr r0, [r10, #0x274]
    add r0, r0, #0x9a
    add r0, r0, #0x100
    str r0, [r10, #0x274]
    ldr r0, [r10, #0x278]
    add r0, r0, #0x9a
    add r0, r0, #0x100
    str r0, [r10, #0x278]
    ldr r0, [r10, #0x248]
    add r0, r0, #0x1
    str r0, [r10, #0x248]
    b .L_02204b3c
.L_022049e8:
    cmp r0, #0x12
    bge .L_02204a30
    ldr r2, [r10, #0x274]
    rsb r1, r2, #0x1000
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    add r0, r2, r0, asr #0x2
    str r0, [r10, #0x274]
    ldr r2, [r10, #0x278]
    rsb r1, r2, #0x3000
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    add r0, r2, r0, asr #0x2
    str r0, [r10, #0x278]
    ldr r0, [r10, #0x248]
    add r0, r0, #0x1
    str r0, [r10, #0x248]
    b .L_02204b3c
.L_02204a30:
    cmp r0, #0x1a
    bge .L_02204a78
    ldr r2, [r10, #0x274]
    rsb r1, r2, #0xa000
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    add r0, r2, r0, asr #0x2
    str r0, [r10, #0x274]
    ldr r2, [r10, #0x278]
    rsb r1, r2, #0x1000
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    add r0, r2, r0, asr #0x2
    str r0, [r10, #0x278]
    ldr r0, [r10, #0x248]
    add r0, r0, #0x1
    str r0, [r10, #0x248]
    b .L_02204b3c
.L_02204a78:
    cmp r0, #0x32
    bge .L_02204a9c
    ldr r0, [r10, #0x278]
    add r0, r0, #0x1000
    str r0, [r10, #0x278]
    ldr r0, [r10, #0x248]
    add r0, r0, #0x1
    str r0, [r10, #0x248]
    b .L_02204b3c
.L_02204a9c:
    bne .L_02204ae4
    ldr r0, .L_02204e60
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x20
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02204e60
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x20
    bl DisplayBrightness_StartTransition
    ldr r0, [r10, #0x248]
    add r0, r0, #0x1
    str r0, [r10, #0x248]
    b .L_02204b3c
.L_02204ae4:
    cmp r0, #0x64
    addlt r0, r0, #0x1
    strlt r0, [r10, #0x248]
    blt .L_02204b3c
    str r1, [r10, #0x248]
    ldr r2, [r10, #0x48]
    ldr r0, .L_02204e60
    ldr r2, [r2, #0x8]
    mov r3, #0x2
    strh r3, [r2, #0xf8]
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r3, r1
    mov r2, #0x0
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02204e60
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r2, #0x0
    mov r3, r1
    bl DisplayBrightness_StartTransition
.L_02204b3c:
    ldr r3, [r10, #0x278]
    ldr r0, [r10, #0x274]
    ldr r1, .L_02204e64
    mov r2, #0x1000
    str r0, [r1, #0x0]
    str r3, [r1, #0x0]
    str r2, [r1, #0x0]
    mov r3, #0x2
    ldr r2, .L_02204e68
    str r3, [r1, #0x94]
    mov r0, #0x11
    str r2, [r1, #0x14]
    sub r2, r0, #0x1
    ldr r0, .L_0220473c
    mov r5, #0x0
.L_02204b78:
    mov r3, r2, lsl #0x1c
    mov r3, r3, lsr #0x10
    mov r3, r3, asr #0x4
    mov r4, r3, lsl #0x1
    mov r3, r4, lsl #0x1
    ldrsh r3, [r0, r3]
    add r4, r0, r4, lsl #0x1
    ldrsh r6, [r4, #0x2]
    mov r3, r3, lsl #0x9
    mov r4, r3, asr #0x10
    mov r3, r6, lsl #0x9
    mov r4, r4, lsl #0x10
    mov r3, r3, asr #0x10
    mov r4, r4, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r4, r4, lsl #0x10
    orr r3, r4, r3, lsr #0x10
    str r3, [r1, #0x20]
    str r5, [r1, #0x20]
    str r5, [r1, #0x28]
    subs r2, r2, #0x1
    bpl .L_02204b78
    ldr r1, .L_0220476c
    mov r0, #0x1
    str r5, [r1, #0x0]
    str r0, [r1, #-0xbc]
.L_02204be0:
    ldr r0, [r10, #0x24c]
    cmp r0, #0x0
    beq .L_02204e48
    ldr r6, .L_02204e6c
    add r5, sp, #0x38
    mov r4, #0x3
.L_02204bf8:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_02204bf8
    ldr r1, [r10, #0x24c]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r10, #0x24c]
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov042_02204e74
    ldr r0, .L_02204764
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x20]
    bl func_0209b668
    ldr r0, [r9, #0x8]
    ldr r4, .L_02204784
    mov r1, r0, asr #0xc
    mov r5, #0x0
    mov r0, #0xc
    str r5, [r4, #0x0]
    add r1, r1, #0xc0
    str r1, [r4, #0x0]
    str r5, [r4, #0x0]
    sub r1, r4, #0x4
    mov r2, #0x1000
    str r2, [r1, #0x0]
    str r2, [r1, #0x0]
    str r2, [r1, #0x0]
    ldr r1, [r10, #0x24c]
    sub r6, r0, #0x1
    mov r0, r1, asr #0x1
    add r11, r1, r0, lsr #0x1e
    mvn r0, #0x0
    str r0, [sp, #0x28]
    add r0, r0, #0x8000
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x28]
    add r0, r0, #0x334
    str r0, [sp, #0x34]
.L_02204cb4:
    add r0, sp, #0x38
    ldr r10, [r0, r6, lsl #0x2]
    cmp r10, r11, asr #0x2
    bge .L_02204e2c
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    ldr r0, .L_0220473c
    mov r1, r2, lsl #0x1
    add r0, r0, r2, lsl #0x1
    ldrsh r7, [r0, #0x2]
    ldr r0, .L_0220473c
    rsb r9, r10, r11, asr #0x2
    ldrsh r8, [r0, r1]
    cmp r7, #0x0
    movgt r0, #0x1
    strgt r0, [sp, #0x14]
    ldrle r0, [sp, #0x28]
    strle r0, [sp, #0x14]
    cmp r8, #0x0
    movgt r0, #0x1
    strgt r0, [sp, #0x10]
    ldrle r0, [sp, #0x28]
    strle r0, [sp, #0x10]
    ldr r0, [sp, #0x14]
    mul r1, r7, r0
    ldr r0, [sp, #0x10]
    mul r0, r8, r0
    sub r1, r1, r0
    ldr r0, [sp, #0x34]
    cmp r1, r0
    ble .L_02204d70
    mov r0, r8
    mov r1, r7
    bl func_020adc90
    ldr r3, [sp, #0x14]
    mov r1, #0x8d000
    mul r2, r3, r1
    smull r3, r1, r0, r2
    mov r0, #0x800
    adds r3, r3, r0
    mov r0, #0x0
    adc r0, r1, r0
    mov r3, r3, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    b .L_02204da4
.L_02204d70:
    mov r0, r7
    mov r1, r8
    bl func_020adc90
    ldr r2, [sp, #0x10]
    mov r1, #0x6a000
    mul r3, r2, r1
    smull r2, r1, r0, r3
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, #0x0
    adc r0, r1, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
.L_02204da4:
    mov r0, #0x2
    str r0, [r4, #0x90]
    ldr r0, [sp, #0x2c]
    rsb r1, r9, #0x0
    str r0, [r4, #0x10]
    mov r0, #0x0
    str r0, [r4, #0x1c]
    str r0, [r4, #0x1c]
    mla r0, r8, r9, r2
    mla ip, r8, r1, r2
    mla r8, r7, r9, r3
    mla r3, r7, r1, r3
    mov r1, r8, lsl #0x4
    mov r1, r1, asr #0x10
    mov r2, ip, lsl #0x4
    mov r1, r1, lsl #0x10
    mov r2, r2, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x4
    mov r0, r0, asr #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r2, lsr #0x10
    str r1, [r4, #0x24]
    mov r1, r3, lsl #0x4
    mov r1, r1, asr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x24]
    mov r0, #0x0
    str r0, [r4, #0x94]
.L_02204e2c:
    ldr r0, .L_02204e70
    subs r6, r6, #0x1
    mla r5, r10, r0, r5
    bpl .L_02204cb4
    ldr r0, .L_02204e58
    mov r1, #0x1
    str r1, [r0, #0x0]
.L_02204e48:
    add sp, sp, #0x2f8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02204e50: .word 0x6108
.L_02204e54: .word 0x400048c
.L_02204e58: .word 0x4000448
.L_02204e5c: .word 0x14cd
.L_02204e60: .word gDisplayBrightnessPair
.L_02204e64: .word 0x400046c
.L_02204e68: .word 0x539c
.L_02204e6c: .word data_ov042_0220ad68
.L_02204e70: .word 0x222
.size func_ov042_022036c4, . - func_ov042_022036c4

