.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_particle_recovery.c.
.extern func_020adc90

.global func_ov049_0220c48c
func_ov049_0220c48c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    mov r8, r2
    str r0, [sp, #0x0]
    rsb r0, r8, #0x0
    mov r2, #0xa
    mov r7, r3
    str r0, [sp, #0x20]
    rsb r0, r7, #0x0
    str r1, [sp, #0x4]
    sub r4, r2, #0x1
    str r0, [sp, #0x1c]
.L_0220c4bc:
    ldr r0, [sp, #0x0]
    add r0, r0, r4, lsl #0x1
    add r0, r0, #0x600
    ldrsh r1, [r0, #0x44]
    cmp r1, #0x0
    ldreqsh r0, [r0, #0x6c]
    cmpeq r0, #0x0
    bne .L_0220c66c
    ldr r0, [sp, #0x0]
    mov r1, #0x3c
    mla r0, r4, r1, r0
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x4]
    ldr r1, [r0, #0x8]
    ldr r0, [sp, #0x8]
    add r1, r1, #0xa000
    ldr r5, [r0, #0x20]
    ldr r0, [sp, #0x4]
    ldr r3, [r0, #0x4]
    ldr r0, [sp, #0x8]
    sub r5, r5, r3
    ldr r2, [r0, #0x24]
    ldr r0, [sp, #0x20]
    sub r6, r2, r1
    cmp r5, r0
    ble .L_0220c66c
    cmp r5, r8
    bge .L_0220c66c
    ldr r0, [sp, #0x1c]
    cmp r6, r0
    ble .L_0220c66c
    cmp r6, r7
    bge .L_0220c66c
    cmp r5, #0x0
    rsblt r9, r5, #0x0
    movge r9, r5
    cmp r6, #0x0
    rsblt r10, r6, #0x0
    movge r10, r6
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    mov r11, r0
    mov r0, r10
    mov r1, r7
    bl func_020adc90
    cmp r11, r0
    movle r9, #0x0
    sub r0, r8, r9
    str r0, [sp, #0x14]
    movgt r10, #0x0
    ldr r1, [sp, #0x14]
    sub r0, r7, r10
    str r0, [sp, #0xc]
    mov r1, r1, asr #0x1f
    str r1, [sp, #0x18]
    ldr r1, [sp, #0xc]
    mov r0, #0x5
    mov r1, r1, asr #0x1f
    mov r11, #0x1000
    movgt r6, r10
    movle r5, r9
    sub r0, r0, #0x1
    str r1, [sp, #0x10]
    rsb r11, r11, #0x0
.L_0220c5c0:
    cmp r5, #0x0
    movlt r10, r11
    blt .L_0220c5d4
    movgt r10, #0x1000
    movle r10, #0x0
.L_0220c5d4:
    ldr r1, [sp, #0x8]
    mov r2, #0xc
    mla r1, r0, r2, r1
    ldr r2, [sp, #0x14]
    mov r9, r10, asr #0x1f
    umull r3, ip, r2, r10
    mla ip, r2, r9, ip
    ldr r2, [sp, #0x18]
    str r3, [sp, #0x24]
    adds r3, r3, #0x800
    mla ip, r2, r10, ip
    adc r2, ip, #0x0
    mov r3, r3, lsr #0xc
    cmp r6, #0x0
    ldr lr, [r1, #0x8]
    orr r3, r3, r2, lsl #0x14
    add r2, lr, r3
    str r2, [r1, #0x8]
    movlt r10, r11
    blt .L_0220c62c
    movgt r10, #0x1000
    movle r10, #0x0
.L_0220c62c:
    ldr r2, [sp, #0xc]
    mov ip, r10, asr #0x1f
    umull r3, lr, r2, r10
    mla lr, r2, ip, lr
    ldr r2, [sp, #0x10]
    str r3, [sp, #0x28]
    adds r3, r3, #0x800
    mla lr, r2, r10, lr
    adc r2, lr, #0x0
    mov r3, r3, lsr #0xc
    ldr r9, [r1, #0xc]
    orr r3, r3, r2, lsl #0x14
    add r2, r9, r3
    str r2, [r1, #0xc]
    subs r0, r0, #0x1
    bpl .L_0220c5c0
.L_0220c66c:
    subs r4, r4, #0x1
    bpl .L_0220c4bc
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov049_0220c48c, . - func_ov049_0220c48c
