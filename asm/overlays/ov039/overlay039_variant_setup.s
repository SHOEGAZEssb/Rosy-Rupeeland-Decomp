.text

/* Exact fallback; see overlay039_variant_setup.c for documented portable C. */
    .extern func_0209a208
    .extern func_ov039_021fd7f0
    .extern func_ov039_021fd438
    .extern data_ov039_022083b0

    .global func_ov039_021fd070
func_ov039_021fd070:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    add r0, r10, #0x1c00
    ldrh r0, [r0, #0xb2]
    mov r9, r1
    cmp r0, #0x1
    bhi L_021fd23c
    ldr r6, L_021fd244
    mov r8, #0x0
    mov r4, #0x1
    sub r5, r6, #0xd
    mov r11, r8
    mov r7, r4
L_021fd0a8:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    mov r2, r5
    add r3, r6, #0x1
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x4c]
    cmp r8, #0x0
    moveq r0, r11
    movne r0, #0x2
    and r0, r0, #0xff
    stmia sp, {r0, r4}
    add r0, r10, r8, lsl #0x2
    ldr r1, [r0, #0x4c]
    mov r0, r10
    mov r2, #0x35000
    mov r3, #0x1d000
    bl func_ov039_021fd7f0
    add r8, r8, #0x1
    cmp r8, #0x4
    blt L_021fd0a8
    ldr r6, L_021fd244
    mov r4, #0x33000
    mov r11, #0x1
    mov r8, #0x4
    rsb r4, r4, #0x0
    sub r5, r6, #0xd
    mov r7, r11
L_021fd120:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    mov r2, r5
    add r3, r6, #0x1
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x4c]
    cmp r8, #0x4
    moveq r0, #0x0
    movne r0, #0x2
    and r0, r0, #0xff
    stmia sp, {r0, r11}
    add r0, r10, r8, lsl #0x2
    ldr r1, [r0, #0x4c]
    mov r0, r10
    mov r2, r4
    mov r3, #0x1d000
    bl func_ov039_021fd7f0
    add r8, r8, #0x1
    cmp r8, #0x8
    blt L_021fd120
    ldr r1, L_021fd248
    mov r0, r10
    str r9, [sp, #0x0]
    mov r4, #0x2
    add r2, r1, #0x1
    add r3, r1, #0x2
    str r4, [sp, #0x4]
    bl func_0209a208
    ldr r1, L_021fd248
    str r0, [r10, #0x6c]
    str r9, [sp, #0x0]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    str r4, [sp, #0x4]
    bl func_0209a208
    mov r8, #0x0
    mov r7, #0x1
    ldr r6, L_021fd24c
    ldr r4, L_021fd250
    str r0, [r10, #0x70]
    mov r5, r7
    mov r11, r8
L_021fd1d8:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x1
    add r3, r6, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r8, r8, lsr #0x1f
    mov r1, r1, asr #0x1
    add r2, r10, r8, lsl #0x2
    rsb r1, r1, #0x1
    str r0, [r2, #0x74]
    and r1, r1, #0xff
    stmia sp, {r1, r5}
    ldr r1, [r2, #0x74]
    ldr r3, [r4, r8, lsl #0x2]
    mov r0, r10
    mov r2, r11
    bl func_ov039_021fd7f0
    add r8, r8, #0x1
    cmp r8, #0x3
    blt L_021fd1d8
    mov r0, r10
    mov r1, r9
    bl func_ov039_021fd438
L_021fd23c:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd244: .word 0x1282
L_021fd248: .word 0x1277
L_021fd24c: .word 0x126e
L_021fd250: .word data_ov039_022083b0
    .size func_ov039_021fd070, .-func_ov039_021fd070

    .global func_ov039_021fd254
func_ov039_021fd254:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    add r0, r10, #0x1c00
    ldrh r0, [r0, #0xb2]
    mov r9, r1
    cmp r0, #0x1
    bhi L_021fd420
    mov r8, #0x0
    mov r4, #0x1
    ldr r6, L_021fd428
    mov r11, #0x2
    mov r5, r8
    mov r7, r4
L_021fd28c:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x7
    add r3, r6, #0x1
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x4c]
    cmp r8, #0x0
    moveq r0, r5
    movne r0, r11
    and r0, r0, #0xff
    stmia sp, {r0, r4}
    add r0, r10, r8, lsl #0x2
    ldr r1, [r0, #0x4c]
    mov r0, r10
    mov r2, #0x35000
    mov r3, #0x1d000
    bl func_ov039_021fd7f0
    add r8, r8, #0x1
    cmp r8, #0x4
    blt L_021fd28c
    mov r4, #0x33000
    mov r5, #0x1
    ldr r6, L_021fd428
    mov r8, #0x4
    rsb r4, r4, #0x0
    mov r11, #0x0
    mov r7, r5
L_021fd304:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x7
    add r3, r6, #0x1
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x4c]
    cmp r8, #0x4
    moveq r0, r11
    movne r0, #0x2
    and r0, r0, #0xff
    stmia sp, {r0, r5}
    add r0, r10, r8, lsl #0x2
    ldr r1, [r0, #0x4c]
    mov r0, r10
    mov r2, r4
    mov r3, #0x1d000
    bl func_ov039_021fd7f0
    add r8, r8, #0x1
    cmp r8, #0x8
    blt L_021fd304
    ldr r1, L_021fd42c
    mov r0, r10
    str r9, [sp, #0x0]
    mov r4, #0x2
    add r2, r1, #0x13
    add r3, r1, #0x2
    str r4, [sp, #0x4]
    bl func_0209a208
    ldr r1, L_021fd42c
    str r0, [r10, #0x6c]
    str r9, [sp, #0x0]
    mov r0, r10
    add r2, r1, #0x13
    add r3, r1, #0x2
    str r4, [sp, #0x4]
    bl func_0209a208
    mov r8, #0x0
    mov r7, #0x1
    ldr r6, L_021fd430
    ldr r4, L_021fd434
    str r0, [r10, #0x70]
    mov r5, r7
    mov r11, r8
L_021fd3bc:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x18
    add r3, r6, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r8, r8, lsr #0x1f
    mov r1, r1, asr #0x1
    add r2, r10, r8, lsl #0x2
    rsb r1, r1, #0x1
    str r0, [r2, #0x74]
    and r1, r1, #0xff
    stmia sp, {r1, r5}
    ldr r1, [r2, #0x74]
    ldr r3, [r4, r8, lsl #0x2]
    mov r0, r10
    mov r2, r11
    bl func_ov039_021fd7f0
    add r8, r8, #0x1
    cmp r8, #0x3
    blt L_021fd3bc
    mov r0, r10
    mov r1, r9
    bl func_ov039_021fd438
L_021fd420:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd428: .word 0x1282
L_021fd42c: .word 0x1277
L_021fd430: .word 0x126e
L_021fd434: .word data_ov039_022083b0
    .size func_ov039_021fd254, .-func_ov039_021fd254

