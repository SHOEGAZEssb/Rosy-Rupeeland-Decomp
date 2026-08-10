.text
/* Exact fallback; see overlay040_object_update.c for portable C. */
    .extern Sound_Play
    .extern func_ov040_022021dc
    .extern VecFx32Object_Destroy
    .extern gSoundContext

    .global func_ov040_02203150
func_ov040_02203150:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r10, r0
    add r0, r10, #0x2a4
    mov r1, #0x50
    mov r6, #0x1000
    add r5, r0, #0x800
    mov r0, #0xbe000
    mov r11, #0x0
    sub r9, r1, #0x1
    rsb r6, r6, #0x0
    add r4, r10, #0x4
    sub r7, r0, #0xb000
    mov r8, r11
.L_02203188:
    add r0, r10, r9, lsl #0x2
    ldr r1, [r0, #0x824]
    cmp r1, #0x0
    ble .L_02203314
    add r2, r10, r9, lsl #0x4
    ldr r1, [r2, #0xc]
    add r1, r1, #0x9a
    add r1, r1, #0x100
    str r1, [r2, #0xc]
    ldr r1, [r0, #0x6e4]
    cmp r1, #0x0
    beq .L_022031e4
    add r1, r1, #0x1
    str r1, [r0, #0x6e4]
    ldr r1, [r0, #0x824]
    cmp r1, #0x7
    ldr r1, [r0, #0x6e4]
    blt .L_022031dc
    cmp r1, #0x1e
    strgt r8, [r0, #0x824]
    b .L_022031e4
.L_022031dc:
    cmp r1, #0x1e0
    strgt r11, [r0, #0x824]
.L_022031e4:
    add r1, r10, r9, lsl #0x4
    ldr r0, [r1, #0xc]
    ldr r1, [r1, #0xaac]
    mov r3, #0xbe000
    add r2, r1, r0
    add r1, r10, r9, lsl #0x2
    ldr r1, [r1, #0x824]
    cmp r1, #0x1
    moveq r3, r7
    cmp r1, #0x2
    subeq r3, r3, #0x5000
    cmp r2, r3
    ble .L_02203298
    cmp r1, #0x7
    blt .L_02203268
    add r0, r10, r9, lsl #0x4
    ldr r2, [r0, #0x8]
    mov r1, #0x12c
    mov r2, r2, asr #0x1
    str r2, [r0, #0x8]
    ldr r3, [r0, #0xc]
    mov r2, #0x7
    mov r3, r3, asr #0x1
    rsb r3, r3, #0x0
    str r3, [r0, #0xc]
    ldr r0, .L_02203324
    ldr r0, [r0, #0x0]
    bl Sound_Play
    add r1, r10, r9, lsl #0x2
    ldr r0, [r1, #0x6e4]
    add r0, r0, #0x1
    str r0, [r1, #0x6e4]
    b .L_02203298
.L_02203268:
    ldr r1, .L_02203328
    add r0, r0, r1
    rsb r1, r0, #0x0
    add r0, r10, r9, lsl #0x4
    str r1, [r0, #0xc]
    cmp r1, r6
    add r1, r10, r9, lsl #0x2
    strgt r6, [r0, #0xc]
    ldr r0, [r1, #0x6e4]
    cmp r0, #0x0
    addeq r0, r0, #0x1
    streq r0, [r1, #0x6e4]
.L_02203298:
    add r0, sp, #0x0
    add r1, r5, r9, lsl #0x4
    add r2, r4, r9, lsl #0x4
    bl func_ov040_022021dc
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    blt .L_022032bc
    cmp r0, #0x100000
    ble .L_022032cc
.L_022032bc:
    add r1, r10, r9, lsl #0x4
    ldr r0, [r1, #0x8]
    rsb r0, r0, #0x0
    str r0, [r1, #0x8]
.L_022032cc:
    add r0, r10, r9, lsl #0x4
    ldr r3, [r0, #0xaa8]
    ldr r2, [r0, #0x8]
    add r1, r10, r9, lsl #0x1
    add r2, r3, r2
    str r2, [r0, #0xaa8]
    ldr ip, [r0, #0xaac]
    ldr r3, [r0, #0xc]
    add r1, r1, #0x500
    add r3, ip, r3
    str r3, [r0, #0xaac]
    add r2, r10, r9, lsl #0x2
    ldrh r3, [r1, #0x4]
    ldr r2, [r2, #0x5a4]
    add r0, sp, #0x0
    add r2, r3, r2
    strh r2, [r1, #0x4]
    bl VecFx32Object_Destroy
.L_02203314:
    subs r9, r9, #0x1
    bpl .L_02203188
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02203324: .word gSoundContext
.L_02203328: .word 0xfffff998
    .size func_ov040_02203150, .-func_ov040_02203150

