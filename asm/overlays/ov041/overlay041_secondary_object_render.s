.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_secondary_object_render.c. */
.extern data_020f4e14
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_02076428
.extern func_0209a2ac
.extern func_0209c9d4
.extern func_0209cb74
.extern func_020befec

    .global func_ov041_02200ce8
func_ov041_02200ce8: ; 0x02200ce8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1a4
    mov r4, r1
    mov r1, #0x0
    mov r2, #0x1
    mov r10, r0
    bl func_0209a2ac
    add r0, sp, #0x54
    mov r1, r4
    bl func_02005030
    mov r0, #0x4
    sub r7, r0, #0x1
    add r6, sp, #0x54
    mov r5, #0x1
.L_02200d20:
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, r6
    mov r2, r5
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl .L_02200d20
    ldr r0, [r10, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x1ec]
    mov r3, r1
    cmp r0, #0x0
    moveq r2, #0xc0000
    rsbeq r2, r2, #0x0
    movne r2, #0x0
    add r0, sp, #0x44
    bl func_0200500c
    ldr r0, [r10, #0x5c]
    add r1, sp, #0x44
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0x60]
    add r1, sp, #0x44
    mov r2, #0x1
    bl func_0209a2ac
    ldr r1, [r10, #0x48]
    ldr r0, [r1, #0x1f4]
    cmp r0, #0x2
    bne .L_02200da8
    add r0, sp, #0x44
    bl func_02005058
    add r0, sp, #0x54
    bl func_02005058
    b .L_0220104c
.L_02200da8:
    ldr r0, [r1, #0x1ec]
    cmp r0, #0x0
    bne .L_02200e08
    ldr r1, [r1, #0x174]
    mov r0, #0x60
    sub r2, r1, #0x4
    mul r1, r2, r0
    ldr r0, [r10, #0x15c]
    bl func_020befec
    mov r1, #0x90
    mul r1, r0, r1
    mov r0, r1, asr #0xc
    add r2, r0, #0x10
    cmp r2, #0xa8
    bge .L_02200e08
    mov r0, #0xaa
    str r0, [sp, #0x0]
    mov r1, #0x4
    ldr r0, .L_02201054
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0xf2
    mov r3, #0xf5
    bl func_02076428
.L_02200e08:
    ldr r0, [r10, #0x48]
    mov r1, r4
    ldr r0, [r0, #0x18]
    add r0, r0, #0x84
    bl func_020050a4
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x18]
    bl func_0209c9d4
    ldr r0, [r10, #0x158]
    mov r1, #0x6
    add r0, r0, #0x1
    str r0, [r10, #0x158]
    bl func_020befec
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    mov r0, r0, lsl #0x6
    str r0, [sp, #0x18]
    mov r4, #0x2
    mov r5, #0x0
.L_02200e58:
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1f
    cmp r5, #0x1
    movgt r4, #0x0
    add r0, r1, r0, ror #0x1f
    add r8, r0, r4
    mov r3, #0x30
    mul r0, r5, r3
    mov r2, #0x12
    add r7, r5, #0x1
    str r0, [sp, #0x14]
    mul r0, r7, r3
    add r1, r8, #0x1
    str r0, [sp, #0x10]
    mov r0, r8, lsl #0x11
    mla r6, r5, r2, r10
    str r0, [sp, #0xc]
    mov r11, r1, lsl #0x11
    mov r7, #0x0
.L_02200ea4:
    add r0, r6, r7, lsl #0x1
    ldrh r0, [r0, #0xa4]
    mov r1, #0x64
    bl func_020befec
    mov r0, #0x36
    mul r0, r7, r0
    cmp r1, #0x32
    rsbge r1, r1, #0x64
    mov r2, r1, asr #0x1
    sub r8, r0, #0x5a
    add r2, r1, r2, lsr #0x1e
    ldr r1, [sp, #0x14]
    mov r9, r7, lsl #0x1
    add r0, sp, #0x104
    str r8, [r0, r9, lsl #0x3]
    ldr r0, [r10, #0x15c]
    add r1, r1, r2, asr #0x2
    add r0, r1, r0, asr #0xc
    sub r1, r0, #0x26
    add r0, sp, #0x104
    add r0, r0, r9, lsl #0x3
    str r1, [r0, #0x4]
    add r0, r6, r7, lsl #0x1
    ldrh r0, [r0, #0xb6]
    mov r1, #0x64
    bl func_020befec
    cmp r1, #0x32
    rsbge r1, r1, #0x64
    add r0, sp, #0x104
    add r2, r0, r9, lsl #0x3
    mov r3, r1, asr #0x1
    str r8, [r2, #0x8]
    add r3, r1, r3, lsr #0x1e
    ldr r1, [sp, #0x10]
    ldr r0, [r10, #0x15c]
    add r1, r1, r3, asr #0x2
    add r0, r1, r0, asr #0xc
    sub r0, r0, #0x26
    mov r1, r7, lsr #0x1f
    str r0, [r2, #0xc]
    rsb r0, r1, r7, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    cmp r0, #0x2
    rsbge r0, r0, #0x4
    mov r1, r0, lsl #0x11
    ldr r0, [sp, #0x18]
    add r2, r1, r0, lsl #0xc
    add r0, sp, #0x64
    str r2, [r0, r9, lsl #0x3]
    add r1, r0, r9, lsl #0x3
    ldr r0, [sp, #0xc]
    stmib r1, {r0, r2, r11}
    add r0, r6, r7, lsl #0x1
    ldrh r0, [r0, #0xa4]
    mov r1, #0x78
    bl func_020befec
    cmp r1, #0x3c
    rsbge r1, r1, #0x78
    add r0, r1, r1, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r1, r0, #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x1f
    orr r0, r0, r1, lsl #0x5
    orr r2, r0, r1, lsl #0xa
    mov r1, r9, lsl #0x1
    add r0, sp, #0x1c
    strh r2, [r0, r1]
    add r0, r6, r7, lsl #0x1
    ldrh r0, [r0, #0xb6]
    mov r1, #0x78
    bl func_020befec
    cmp r1, #0x3c
    rsbge r1, r1, #0x78
    add r0, r1, r1, lsr #0x1f
    mov r1, r0, asr #0x1
    rsb r2, r1, #0x1f
    mov r1, r1, asr #0x1
    rsb r1, r1, #0x1f
    add r0, sp, #0x1c
    orr r1, r1, r2, lsl #0x5
    add r7, r7, #0x1
    add r0, r0, r9, lsl #0x1
    orr r1, r1, r2, lsl #0xa
    strh r1, [r0, #0x2]
    cmp r7, #0x9
    blt .L_02200ea4
    mov r0, #0x12
    str r0, [sp, #0x0]
    add r0, sp, #0x1c
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x48]
    add r1, sp, #0x104
    ldr r0, [r0, #0x18]
    add r2, sp, #0x64
    mov r3, #0x1e
    bl func_0209cb74
    add r5, r5, #0x1
    cmp r5, #0xa
    blt .L_02200e58
    add r0, sp, #0x44
    bl func_02005058
    add r0, sp, #0x54
    bl func_02005058
.L_0220104c:
    add sp, sp, #0x1a4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02201054: .word data_020f4e14
    .size func_ov041_02200ce8, . - func_ov041_02200ce8

