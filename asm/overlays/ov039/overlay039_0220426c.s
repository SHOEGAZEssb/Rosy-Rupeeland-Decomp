.text
/* Exact fallback; see overlay039_secondary_effects.c for portable C. */
    .extern func_020adc40
    .global func_ov039_0220426c
func_ov039_0220426c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r2, #0x3
    mov r11, #0x0
    mov r10, r0
    mov r9, r1
    sub r6, r2, #0x1
    mov r5, r11
    mov r4, #0x800
L_0220428c:
    add r0, r10, r6, lsl #0x2
    ldr r3, [r0, #0x9c]
    ldr r0, [r3, #0x0]
    cmp r0, #0x0
    beq L_0220430c
    ldr r0, [r10, #0x48]
    ldr r2, [r3, #0x10]
    ldr r1, [r0, #0x8]
    ldr r0, [r3, #0x14]
    ldr r3, [r1, #0x48]
    ldr r1, [r3, #0x34]
    ldr r3, [r3, #0x30]
    sub r1, r1, #0x14000
    sub r8, r1, r0
    sub r7, r3, r2
    smull r2, r1, r7, r7
    mov r0, #0x800
    adds r2, r2, r0
    smull r0, r3, r8, r8
    adc r1, r1, r11
    adds r0, r0, r4
    mov r2, r2, lsr #0xc
    adc r3, r3, r5
    mov r0, r0, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    orr r0, r0, r3, lsl #0x14
    add r0, r2, r0
    bl func_020adc40
    cmp r0, #0x14000
    stmltib r9, {r7, r8}
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_0220430c:
    subs r6, r6, #0x1
    bpl L_0220428c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_ov039_0220426c, .-func_ov039_0220426c

