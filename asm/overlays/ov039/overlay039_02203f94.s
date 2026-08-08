.text
/* Exact fallback; see overlay039_secondary_effects.c for portable C. */
    .extern func_ov039_022014f8
    .extern func_ov039_02204118
    .extern Sound_Play
    .extern func_02005058
    .extern data_020c9670
    .extern gSoundContext
    .global func_ov039_02203f94
func_ov039_02203f94:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    add r1, r4, #0x2c
    add r2, r4, #0xac
    bl func_ov039_022014f8
    add r0, r4, #0x1000
    ldr r0, [r0, #0xccc]
    ldr r3, L_022040e8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r2, r0, lsl #0x1
    add r0, r0, #0x1
    mov r1, r0, lsl #0x1
    mov r0, #0x3
    ldrsh r2, [r3, r2]
    ldrsh ip, [r3, r1]
    sub r5, r0, #0x1
    rsb r3, r2, #0x0
L_02203fec:
    add r2, r4, r5, lsl #0x2
    ldr r1, [r2, #0x9c]
    ldr r0, [r1, #0x0]
    cmp r0, #0x0
    bne L_022040d0
    mov lr, #0xc000
    umull r8, r7, r3, lr
    mov r0, #0x0
    umull r6, r5, ip, lr
    adds r8, r8, #0x800
    mla r7, r3, r0, r7
    mov r3, r3, asr #0x1f
    mla r7, r3, lr, r7
    adc r7, r7, #0x0
    mov r8, r8, lsr #0xc
    adds r6, r6, #0x800
    mla r5, ip, r0, r5
    mov r3, ip, asr #0x1f
    mla r5, r3, lr, r5
    ldr r3, [sp, #0x4]
    orr r8, r8, r7, lsl #0x14
    add r3, r3, r8
    str r3, [r1, #0x10]
    adc r1, r5, #0x0
    mov r3, r6, lsr #0xc
    ldr r5, [sp, #0x8]
    orr r3, r3, r1, lsl #0x14
    ldr r1, [r2, #0x9c]
    add r3, r5, r3
    str r3, [r1, #0x14]
    ldr r1, [r2, #0x9c]
    mov lr, #0x21c
    str r0, [r1, #0x20]
    ldr r5, [r2, #0x9c]
    mov ip, #0x1
    ldr r3, [r5, #0x20]
    add r1, r4, #0x1000
    str r3, [r5, #0x1c]
    ldr r3, [r2, #0x9c]
    str lr, [r3, #0x8]
    ldr r3, [r2, #0x9c]
    str ip, [r3, #0x0]
    ldr r1, [r1, #0xccc]
    ldr r3, [r2, #0x9c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [r3, #0x24]
    ldr r1, [r2, #0x9c]
    str r0, [r1, #0x4]
    ldr r0, [r2, #0x9c]
    bl func_ov039_02204118
    ldr r0, L_022040ec
    ldr r1, L_022040f0
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    b L_022040d8
L_022040d0:
    subs r5, r5, #0x1
    bpl L_02203fec
L_022040d8:
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_022040e8: .word data_020c9670
L_022040ec: .word gSoundContext
L_022040f0: .word 0x1c5
    .size func_ov039_02203f94, .-func_ov039_02203f94

