.text
/* Exact fallback; see overlay039_scene_lifecycle.c for portable C. */
    .extern func_020befec
    .extern func_0209a07c
    .extern func_0209a0d8
    .extern func_ov039_02201290
    .global func_ov039_022012c4
func_ov039_022012c4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r0, r4, #0x1c00
    ldrsh r0, [r0, #0xa4]
    cmp r0, #0x0
    ble L_022013ac
    mov r1, #0xa
    bl func_020befec
    cmp r0, #0x2
    bne L_0220134c
    mov r0, #0x8
    sub r5, r0, #0x1
L_022012f8:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x50]
    bl func_0209a07c
    subs r5, r5, #0x1
    bpl L_022012f8
    mov r0, #0x8
    ldr r5, L_022013e0
    sub r7, r0, #0x1
    mov r6, #0x1
L_0220131c:
    ldr r1, [r4, #0x48]
    add r0, r4, r7, lsl #0x2
    ldr r2, [r1, #0x0]
    mov r1, r5
    stmia sp, {r2, r6}
    ldr r0, [r0, #0x50]
    add r2, r5, #0x1
    add r3, r5, #0x2
    bl func_0209a0d8
    subs r7, r7, #0x1
    bpl L_0220131c
    b L_022013ac
L_0220134c:
    cmp r0, #0x4
    bne L_022013ac
    mov r0, #0x8
    sub r5, r0, #0x1
L_0220135c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x50]
    bl func_0209a07c
    subs r5, r5, #0x1
    bpl L_0220135c
    mov r0, #0x8
    ldr r5, L_022013e4
    sub r7, r0, #0x1
    mov r6, #0x1
L_02201380:
    ldr r1, [r4, #0x48]
    add r0, r4, r7, lsl #0x2
    ldr r2, [r1, #0x0]
    mov r1, r5
    stmia sp, {r2, r6}
    ldr r0, [r0, #0x50]
    add r2, r5, #0x1
    add r3, r5, #0x2
    bl func_0209a0d8
    subs r7, r7, #0x1
    bpl L_02201380
L_022013ac:
    mov r0, #0x8
    sub r6, r0, #0x1
    mov r5, #0x1
L_022013b8:
    add r0, r4, r6, lsl #0x2
    ldr r1, [r0, #0x50]
    mov r0, r4
    mov r3, r5
    and r2, r6, #0xff
    bl func_ov039_02201290
    subs r6, r6, #0x1
    bpl L_022013b8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_022013e0: .word 0x1294
L_022013e4: .word 0x1291
    .size func_ov039_022012c4, .-func_ov039_022012c4

