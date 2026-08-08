.text

/* Exact fallback; see overlay039_shared_setup.c for documented portable C. */
    .extern func_ov039_021fd7f0
    .extern func_0209a208
    .extern func_0209a2a4
    .extern func_ov039_021ff330
    .extern Sound_Play
    .extern data_ov039_0220807c
    .extern data_ov039_02208094
    .extern gSoundContext

    .global func_ov039_021fd438
func_ov039_021fd438:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x38
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r2, #0x1
    str r2, [sp, #0x4]
    mov r10, r0
    mov r9, r1
    ldr r1, [r10, #0x6c]
    mov r2, #0x24000
    mov r3, #0x28000
    bl func_ov039_021fd7f0
    ldr r0, [r10, #0x6c]
    mov r1, #0x40
    strh r1, [r0, #0x42]
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r1, [r10, #0x70]
    mov r0, r10
    sub r2, r2, #0x25000
    mov r3, #0x2b000
    bl func_ov039_021fd7f0
    ldr r1, L_021fd704
    str r9, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x98]
    mov r0, #0x3
    str r0, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r2, #0x0
    ldr r1, [r10, #0x98]
    mov r0, r10
    sub r3, r2, #0x9000
    bl func_ov039_021fd7f0
    ldr r1, L_021fd708
    str r9, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x9c]
    mov r0, #0x1
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r2, #0x9000
    ldr r1, [r10, #0x9c]
    mov r0, r10
    sub r3, r2, #0x15000
    bl func_ov039_021fd7f0
    ldr ip, L_021fd70c
    add r11, sp, #0x20
    add r4, sp, #0x8
    mov r7, r11
    ldmia ip!, {r0, r1, r2, r3}
    stmia r11!, {r0, r1, r2, r3}
    ldmia ip, {r0, r1}
    ldr r5, L_021fd710
    stmia r11, {r0, r1}
    mov r6, r4
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1}
    stmia r4, {r0, r1}
    mov r5, #0x1
    mov r8, #0x0
    mov r4, #0x4
    mov r11, r5
L_021fd56c:
    ldr r1, L_021fd714
    str r9, [sp, #0x0]
    mov r2, r1
    mov r3, r1
    mov r0, r10
    add r2, r2, #0x1
    add r3, r3, #0x2
    str r5, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x80]
    stmia sp, {r4, r11}
    ldr r2, [r7, r8, lsl #0x2]
    ldr r3, [r6, r8, lsl #0x2]
    ldr r1, [r1, #0x80]
    mov r0, r10
    mov r2, r2, lsl #0xc
    mov r3, r3, lsl #0xc
    bl func_ov039_021fd7f0
    tst r8, #0x1
    addne r0, r10, r8, lsl #0x2
    ldrne r1, [r0, #0x80]
    movne r0, #0x40
    add r8, r8, #0x1
    strneh r0, [r1, #0x42]
    cmp r8, #0x6
    blt L_021fd56c
    mov r0, #0x3
    sub r4, r0, #0x1
L_021fd5e0:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x74]
    mov r1, r10
    bl func_0209a2a4
    subs r4, r4, #0x1
    bpl L_021fd5e0
    mov r0, #0xa
    sub r5, r0, #0x1
    mvn r4, #0x0
L_021fd604:
    add r0, r10, r5, lsl #0x2
    ldr r0, [r0, #0x4c]
    ldr r1, [r10, #0x74]
    bl func_0209a2a4
    add r0, r10, r5, lsl #0x2
    ldr r0, [r0, #0x4c]
    subs r5, r5, #0x1
    str r4, [r0, #0x44]
    bpl L_021fd604
    ldr r0, [r10, #0x98]
    ldr r1, [r10, #0x74]
    bl func_0209a2a4
    ldr r0, [r10, #0x98]
    mvn r1, #0x0
    str r1, [r0, #0x44]
    ldr r0, [r10, #0x9c]
    ldr r1, [r10, #0x74]
    bl func_0209a2a4
    mov r0, #0x6
    ldr r1, [r10, #0x9c]
    mvn r2, #0x2
    str r2, [r1, #0x44]
    ldr r1, [r10, #0x9c]
    mov r2, #0x4
    strh r2, [r1, #0x42]
    sub r4, r0, #0x1
    mov r5, #0x1
L_021fd670:
    add r0, r4, r4, lsr #0x1f
    mov r0, r0, asr #0x1
    add r2, r10, r4, lsl #0x2
    add r1, r10, r0, lsl #0x2
    ldr r0, [r2, #0x80]
    ldr r1, [r1, #0x74]
    bl func_0209a2a4
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x80]
    subs r4, r4, #0x1
    str r5, [r0, #0x44]
    bpl L_021fd670
    mov r5, #0x0
    mov r4, #0x65
    mov r3, r5
    mov r1, #0xc
L_021fd6b0:
    mla r2, r5, r1, r10
    add r0, r10, r5, lsl #0x2
    add r0, r0, #0x1000
    str r4, [r0, #0xcc8]
    str r3, [r0, #0xcf0]
    add r0, r2, #0x1000
    add r5, r5, #0x1
    str r3, [r0, #0xd20]
    str r3, [r0, #0xd1c]
    cmp r5, #0x8
    blt L_021fd6b0
    mov r0, r10
    mov r1, #0x4
    bl func_ov039_021ff330
    ldr r0, L_021fd718
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_Play
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd704: .word 0x1271
L_021fd708: .word 0x13bd
L_021fd70c: .word data_ov039_0220807c
L_021fd710: .word data_ov039_02208094
L_021fd714: .word 0x1274
L_021fd718: .word gSoundContext
    .size func_ov039_021fd438, .-func_ov039_021fd438

