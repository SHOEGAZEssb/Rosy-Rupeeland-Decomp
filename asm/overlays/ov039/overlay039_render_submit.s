.text
/* Exact fallback; see overlay039_render_submit.c for documented portable C. */
    .extern func_0209a2ac
    .extern func_0205943c
    .extern func_0201e0ec
    .extern func_0209c3b4
    .extern func_0200500c
    .extern func_02004fe0
    .extern func_0209c430
    .extern func_02005058
    .extern func_020befec
    .extern func_ov069_0220ff38
    .extern func_02005030
    .extern func_ov069_0221070c
    .extern func_ov049_0220c8a0
    .extern func_ov045_0220c48c
    .extern func_ov039_021fda80
    .extern func_ov049_0220c254
    .extern func_ov049_0220cf94
    .extern func_ov069_0221100c
    .extern func_ov069_02211274
    .extern gSoundContext
    .extern data_021052fc
    .global func_ov039_0220076c
func_ov039_0220076c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xf4
    mov r4, r1
    mov r8, r0
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r8, #0x74]
    mov r1, r4
    mov r2, #0x1
    bl func_0209a2ac
    mov r6, #0x0
    mov r5, #0x1
L_022007a0:
    add r0, r8, r6, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, r4
    mov r2, r5
    bl func_0209a2ac
    add r6, r6, #0x1
    cmp r6, #0xa
    blt L_022007a0
    mov r6, #0x0
    mov r5, #0x1
L_022007c8:
    add r0, r8, r6, lsl #0x2
    ldr r0, [r0, #0x98]
    mov r1, r4
    mov r2, r5
    bl func_0209a2ac
    add r6, r6, #0x1
    cmp r6, #0x2
    blt L_022007c8
    ldr r0, [r8, #0x78]
    mov r1, r4
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r8, #0x7c]
    mov r1, r4
    mov r2, #0x1
    bl func_0209a2ac
    mov r0, #0x6
    sub r6, r0, #0x1
    mov r5, #0x1
L_02200814:
    add r0, r8, r6, lsl #0x2
    ldr r0, [r0, #0x80]
    mov r1, r4
    mov r2, r5
    bl func_0209a2ac
    subs r6, r6, #0x1
    bpl L_02200814
    ldr r1, [r8, #0x74]
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x20]
    add r0, r0, #0x80000
    sub r1, r1, r0
    mov r0, r1, asr #0x1f
    mov r2, r0, lsl #0xb
    mov r0, #0x800
    adds r3, r0, r1, lsl #0xb
    orr r2, r2, r1, lsr #0x15
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    mov r0, #0x0
    orr r2, r2, r1, lsl #0x14
    sub r1, r0, #0x80000
    cmp r2, r1
    movlt r2, r1
    cmp r2, #0x7f000
    movgt r2, #0x7f000
    mov r0, r2, asr #0xc
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r0, L_02200cb8
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    mov r3, #0x64
    bl func_0205943c
    ldr r0, L_02200cbc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r6, r0
    bl func_0209c3b4
    mov r0, #0x1e
    mvn r5, #0x7
    sub r7, r0, #0x1
    mov r9, r5, lsr #0x11
    add r4, sp, #0xdc
    mov r11, #0x8
    mov r10, #0x0
L_022008dc:
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0xa0]
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    bne L_02200a28
    mov r1, #0x1000
    add r0, sp, #0xe4
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    mov r0, #0x18000
    str r0, [sp, #0x94]
    mov r0, #0x0
    str r0, [sp, #0x98]
    mov r1, #0x28000
    add r0, sp, #0x9c
    str r1, [r0, #0x0]
    mov r1, #0x10000
    str r1, [r0, #0x4]
    mov r1, #0x28000
    add r0, sp, #0xa4
    str r1, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r1, #0x38000
    add r0, sp, #0xac
    str r1, [r0, #0x0]
    mov r1, #0x10000
    str r1, [r0, #0x4]
    mov r1, #0x38000
    add r0, sp, #0xb4
    str r1, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r1, #0x48000
    add r0, sp, #0xbc
    str r1, [r0, #0x0]
    mov r1, #0x10000
    str r1, [r0, #0x4]
    mov r1, #0x48000
    add r0, sp, #0xc4
    str r1, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r1, #0x58000
    add r0, sp, #0xcc
    str r1, [r0, #0x0]
    mov r1, #0x10000
    str r1, [r0, #0x4]
    add r0, sp, #0x84
    str r5, [sp, #0xd4]
    str r5, [sp, #0xd8]
    str r11, [r4, #0x0]
    str r11, [r4, #0x4]
    bl func_02004fe0
    add ip, r8, r7, lsl #0x2
    ldr r1, [ip, #0xa0]
    mov r0, r6
    ldr r2, [r1, #0x4]
    add r1, sp, #0x84
    str r2, [sp, #0x88]
    ldr r3, [ip, #0xa0]
    add r2, sp, #0xe4
    ldr lr, [r3, #0x8]
    mov r3, r10
    str lr, [sp, #0x8c]
    str r10, [sp, #0x90]
    add lr, sp, #0xd4
    str lr, [sp, #0x0]
    str r10, [sp, #0x4]
    ldr ip, [ip, #0xa0]
    ldr ip, [ip, #0x1c]
    and lr, ip, #0x6
    add ip, sp, #0x94
    add ip, ip, lr, lsl #0x3
    str ip, [sp, #0x8]
    str r9, [sp, #0xc]
    str r10, [sp, #0x10]
    bl func_0209c430
    add r0, sp, #0x84
    bl func_02005058
    add r0, sp, #0xe4
    bl func_02005058
L_02200a28:
    subs r7, r7, #0x1
    bpl L_022008dc
    add r0, r8, #0x1000
    ldr r2, [r0, #0xdb0]
    mov r0, #0x15
    sub r1, r2, #0x14
    mul r0, r1, r0
    add r0, r0, #0x33
    add r4, r0, #0x700
    ldr r5, [r8, #0x74]
    cmp r4, #0x1000
    ldrh r0, [r5, #0x42]
    movgt r4, #0x1000
    tst r0, #0x4
    beq L_02200a6c
    cmp r2, #0x0
    ble L_02200b00
L_02200a6c:
    cmp r2, #0x0
    beq L_02200a84
    ldr r0, [r8, #0x98]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    bne L_02200ab4
L_02200a84:
    add r0, r8, #0x1c00
    ldrh r0, [r0, #0xae]
    mov r1, #0x7
    bl func_020befec
    rsbs r3, r0, #0xa
    add r0, r8, #0x1c00
    ldrh r2, [r0, #0xaa]
    movmi r3, #0x0
    add r0, r8, #0x118
    add r1, r5, #0x1c
    bl func_ov069_0220ff38
    b L_02200af0
L_02200ab4:
    add r1, r8, #0xda0
    add r0, sp, #0x74
    add r1, r1, #0x1000
    bl func_02005030
    ldr r1, [sp, #0x7c]
    mov r0, #0x19
    mla r5, r4, r0, r1
    add r1, sp, #0x74
    add r0, r8, #0x118
    mov r2, #0x0
    mov r3, #0xa
    str r5, [sp, #0x7c]
    bl func_ov069_0220ff38
    add r0, sp, #0x74
    bl func_02005058
L_02200af0:
    add r0, r8, #0x1c00
    ldrsh r1, [r0, #0xa8]
    add r0, r8, #0x118
    bl func_ov069_0221070c
L_02200b00:
    ldr r1, [r8, #0x48]
    add r0, r8, #0x54
    ldr r1, [r1, #0x8]
    add r0, r0, #0x400
    ldr r1, [r1, #0x48]
    add r1, r1, #0x2c
    bl func_ov049_0220c8a0
    ldr r1, [r8, #0x48]
    add r0, r8, #0x54
    ldr r1, [r1, #0x14]
    mov r2, #0x40000
    ldr r1, [r1, #0x98]
    mov r3, r2
    add r0, r0, #0x400
    add r1, r1, #0x1c
    bl func_ov045_0220c48c ; func_ov049_0220c48c
    add r0, sp, #0x64
    bl func_02004fe0
    add r7, r8, #0x54
    add r5, sp, #0x54
    add r9, sp, #0x64
    b L_02200ba0
L_02200b58:
    ldr r1, [r8, #0x48]
    mov r0, r5
    ldr r1, [r1, #0x8]
    ldr r1, [r1, #0x48]
    add r1, r1, #0x2c
    bl func_02005030
    ldr r1, [sp, #0x6c]
    mov r0, r8
    str r1, [sp, #0x0]
    ldr r3, [sp, #0x5c]
    ldr r2, [sp, #0x60]
    ldr r1, [sp, #0x58]
    sub r2, r3, r2
    ldr r3, [sp, #0x68]
    sub r2, r2, #0x10000
    bl func_ov039_021fda80
    mov r0, r5
    bl func_02005058
L_02200ba0:
    mov r1, r9
    add r0, r7, #0x400
    bl func_ov049_0220c254
    cmp r0, #0x0
    bne L_02200b58
    add r0, r8, #0x54
    add r0, r0, #0x400
    bl func_ov049_0220cf94
    add r0, sp, #0x64
    bl func_02005058
    add r0, r8, #0x2fc
    add r0, r0, #0x800
    mov r1, #0x0
    bl func_ov069_0221100c
    add r0, r8, #0x2fc
    add r0, r0, #0x800
    bl func_ov069_02211274
    add r0, r8, #0x1000
    ldr r0, [r0, #0xdb0]
    cmp r0, #0x0
    ble L_02200cb0
    ldr r0, [r8, #0x98]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    beq L_02200cb0
    mvn ip, #0x1f
    mov r9, #0x80000
    add r5, sp, #0x3c
    mov r7, #0x40000
    mov lr, #0xc0000
    add r11, sp, #0x4c
    mov r10, #0x20
    add r0, sp, #0x24
    mov r1, r4
    mov r2, r4
    mov r3, r4
    str ip, [sp, #0x44]
    str ip, [sp, #0x48]
    str r10, [r11, #0x0]
    str r10, [r11, #0x4]
    str r9, [sp, #0x34]
    str r7, [sp, #0x38]
    str lr, [r5, #0x0]
    str r9, [r5, #0x4]
    bl func_0200500c
    add r1, r8, #0xda0
    add r0, sp, #0x14
    add r1, r1, #0x1000
    bl func_02005030
    add r0, sp, #0x44
    str r0, [sp, #0x0]
    mov r1, #0x1c
    str r1, [sp, #0x4]
    add r0, sp, #0x34
    str r0, [sp, #0x8]
    ldr r3, L_02200cc0
    add r1, sp, #0x14
    str r3, [sp, #0xc]
    mov r4, #0x190
    add r2, sp, #0x24
    mov r0, r6
    mov r3, #0x0
    str r4, [sp, #0x10]
    bl func_0209c430
    add r0, sp, #0x14
    bl func_02005058
    add r0, sp, #0x24
    bl func_02005058
L_02200cb0:
    add sp, sp, #0xf4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02200cb8: .word gSoundContext
L_02200cbc: .word data_021052fc
L_02200cc0: .word 0x7fff
    .size func_ov039_0220076c, .-func_ov039_0220076c

