    .text
/* Exact fallback; see src/overlays/ov017/overlay017_grid_deform.c. */
    .extern func_020b5880
    .extern func_020befec
    .extern Overlay017_WaitForSquareRoot
    .global Overlay017_UpdateGridDeformation
Overlay017_UpdateGridDeformation:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x5c
    str r0, [sp, #0x0]
    ldr r1, [sp, #0x0]
    add r0, r0, #0x144
    add r1, r1, #0x510
    mov r2, #0x3cc
    bl func_020b5880
    mov r8, #0x1
L_021fcf90:
    ldr r0, [sp, #0x0]
    mov r1, #0x6c
    mov r2, #0x24
    mla r10, r8, r1, r0
    mla ip, r8, r2, r0
    ldr r1, L_021fd3e8
    mov r9, #0x1
    mov lr, #0x0
L_021fcfb0:
    mov r0, #0xc
    mla r0, r9, r0, r10
    ldr r6, [r0, #0x520]
    ldr r3, [r0, #0x508]
    ldr r2, [r0, #0x580]
    add r3, r6, r3
    add r6, r3, r2
    ldr r3, [r0, #0x4a8]
    ldr r2, [r0, #0x514]
    add r3, r6, r3
    sub r6, r3, r2, lsl #0x2
    mov r2, r6, asr #0x1
    ldr r3, [ip, r9, lsl #0x2]
    add r2, r6, r2, lsr #0x1e
    add r6, r3, r2, asr #0x2
    str r6, [ip, r9, lsl #0x2]
    mov r2, r6, asr #0x3
    ldr r3, [r0, #0x148]
    add r2, r6, r2, lsr #0x1c
    add r2, r3, r2, asr #0x4
    str r2, [r0, #0x148]
    ldr r3, [ip, r9, lsl #0x2]
    mov r0, #0x0
    umull r7, r6, r3, r1
    mla r6, r3, r0, r6
    mov r2, r3, asr #0x1f
    mla r6, r2, r1, r6
    mov r0, #0x800
    adds r2, r7, r0
    adc r0, r6, lr
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [ip, r9, lsl #0x2]
    add r9, r9, #0x1
    cmp r9, #0x8
    blt L_021fcfb0
    add r8, r8, #0x1
    cmp r8, #0x8
    blt L_021fcf90
    mov r9, #0x1
L_021fd050:
    ldr r1, [sp, #0x0]
    mov r2, #0x6c
    add r7, r1, #0x144
    sub r6, r9, #0x1
    mla r1, r6, r2, r7
    add r3, r9, #0x1
    str r1, [sp, #0x14]
    mla r1, r3, r2, r7
    mul r0, r9, r2
    str r1, [sp, #0x10]
    add r1, r7, r0
    str r1, [sp, #0x18]
    ldr r1, [sp, #0x0]
    mov r10, #0x1
    add r0, r1, r0
    str r0, [sp, #0xc]
    mov r0, #0x1000
    rsb r0, r0, #0x0
    str r0, [sp, #0x48]
    mov r0, r0, lsr #0x14
    str r0, [sp, #0x44]
L_021fd0a4:
    mov r0, #0xc
    mul r0, r10, r0
    ldr r1, [sp, #0x18]
    str r0, [sp, #0x4]
    sub r3, r10, #0x1
    mov r2, #0xc
    add r0, r1, r0
    mla r1, r3, r2, r1
    str r1, [sp, #0x20]
    mov r8, #0x0
    cmp r10, #0x7
    ldr r1, [sp, #0x18]
    add r3, r10, #0x1
    mla r1, r3, r2, r1
    ldr r3, [sp, #0x14]
    ldr r2, [sp, #0x4]
    ldr r6, [sp, #0x10]
    add r2, r3, r2
    ldr r3, [sp, #0x4]
    mov r7, r8
    add r3, r6, r3
    str r3, [sp, #0x1c]
    mov r6, r8
    cmpeq r9, #0x7
    beq L_021fd1a8
    ldr r11, [r1, #0x4]
    ldmia r0, {r4, r5}
    sub r11, r5, r11
    str r11, [sp, #0x24]
    ldr r11, [sp, #0x1c]
    ldr r3, [r1, #0x0]
    ldr r11, [r11, #0x0]
    sub r3, r4, r3
    str r3, [sp, #0x4c]
    sub r4, r11, r4
    ldr r3, [r0, #0x8]
    ldr ip, [r1, #0x8]
    ldr r11, [sp, #0x1c]
    sub lr, r3, ip
    ldr ip, [r11, #0x4]
    ldr r11, [r11, #0x8]
    sub r5, ip, r5
    str r11, [sp, #0x28]
    sub r11, r11, r3
    ldr r3, [sp, #0x24]
    mul ip, r3, r11
    str ip, [sp, #0x2c]
    mul ip, r3, r4
    str ip, [sp, #0x30]
    mul ip, lr, r5
    ldr r3, [sp, #0x2c]
    sub r3, r3, ip
    add r6, r6, r3, asr #0xc
    mul r3, lr, r4
    ldr ip, [sp, #0x4c]
    str r3, [sp, #0x58]
    mul r3, ip, r11
    ldr ip, [sp, #0x58]
    sub r3, ip, r3
    ldr ip, [sp, #0x4c]
    add r7, r7, r3, asr #0xc
    mul r3, ip, r5
    ldr ip, [sp, #0x30]
    sub r3, r3, ip
    add r8, r8, r3, asr #0xc
L_021fd1a8:
    cmp r10, #0x7
    cmpeq r9, #0x1
    beq L_021fd23c
    ldr r3, [r0, #0x0]
    ldr r4, [r2, #0x0]
    ldmib r0, {r5, r11}
    sub lr, r3, r4
    ldr r4, [r2, #0x4]
    ldr ip, [r2, #0x8]
    sub r4, r5, r4
    str r4, [sp, #0x34]
    ldr r4, [r1, #0x0]
    sub ip, r11, ip
    str r4, [sp, #0x50]
    sub r4, r4, r3
    ldr r3, [r1, #0x4]
    ldr r1, [r1, #0x8]
    sub r5, r3, r5
    ldr r3, [sp, #0x34]
    sub r11, r1, r11
    mul r1, r3, r11
    str r1, [sp, #0x54]
    mov r1, r3
    mul r3, r1, r4
    str r3, [sp, #0x38]
    mul r3, ip, r5
    ldr r1, [sp, #0x54]
    sub r1, r1, r3
    add r6, r6, r1, asr #0xc
    mul r1, ip, r4
    mul r3, lr, r11
    sub r1, r1, r3
    add r7, r7, r1, asr #0xc
    mul r3, lr, r5
    ldr r1, [sp, #0x38]
    sub r1, r3, r1
    add r8, r8, r1, asr #0xc
L_021fd23c:
    cmp r10, #0x1
    cmpeq r9, #0x1
    beq L_021fd29c
    ldr r1, [r0, #0x0]
    ldmia r2, {r3, lr}
    sub r1, r3, r1
    ldr r3, [r2, #0x8]
    ldr ip, [r0, #0x4]
    ldr r2, [r0, #0x8]
    sub ip, lr, ip
    sub r3, r3, r2
    str ip, [sp, #0x3c]
    mul r2, ip, r11
    mul lr, ip, r4
    mul ip, r3, r5
    sub r2, r2, ip
    add r6, r6, r2, asr #0xc
    mul r2, r3, r4
    mul r3, r1, r11
    sub r2, r2, r3
    add r7, r7, r2, asr #0xc
    mul r2, r1, r5
    sub r1, r2, lr
    add r8, r8, r1, asr #0xc
L_021fd29c:
    cmp r10, #0x1
    cmpeq r9, #0x7
    beq L_021fd320
    ldmia r0, {r4, r5}
    ldr r3, [r0, #0x8]
    ldr r0, [sp, #0x1c]
    ldr r1, [sp, #0x1c]
    ldr r2, [r0, #0x4]
    ldr r0, [r0, #0x8]
    sub ip, r5, r2
    sub r2, r3, r0
    ldr r0, [sp, #0x20]
    ldr r1, [r1, #0x0]
    ldr r11, [r0, #0x0]
    ldr r0, [r0, #0x4]
    sub r1, r4, r1
    sub r5, r0, r5
    ldr r0, [sp, #0x20]
    sub r4, r11, r4
    ldr r11, [r0, #0x8]
    mul r0, r2, r5
    sub r11, r11, r3
    mul r3, r2, r4
    mul r2, ip, r11
    sub r0, r2, r0
    mul r2, r1, r11
    sub r2, r3, r2
    add r6, r6, r0, asr #0xc
    add r7, r7, r2, asr #0xc
    mul r0, ip, r4
    mul r2, r1, r5
    sub r0, r2, r0
    add r8, r8, r0, asr #0xc
L_021fd320:
    ldr r0, L_021fd3ec
    mov r1, #0x1
    strh r1, [r0, #0x0]
    mul r0, r7, r7
    mla r0, r6, r6, r0
    mla r1, r8, r8, r0
    ldr r0, L_021fd3ec
    str r1, [r0, #0x8]
    mov r1, r1, asr #0x1f
    str r1, [r0, #0xc]
    bl Overlay017_WaitForSquareRoot
    str r0, [sp, #0x40]
    ldr r2, [sp, #0xc]
    ldr r1, [sp, #0x4]
    mov r0, r6, lsl #0xc
    add r1, r2, r1
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x40]
    bl func_020befec
    ldr r1, [sp, #0x8]
    str r0, [r1, #0x8dc]
    ldr r1, [sp, #0x40]
    mov r0, r7, lsl #0xc
    bl func_020befec
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0x40]
    str r0, [r2, #0x8e0]
    mov r0, r8, lsl #0xc
    bl func_020befec
    ldr r1, [sp, #0x8]
    str r0, [r1, #0x8e4]
    mov r0, r1
    ldr r1, [r0, #0x8e0]
    cmp r1, #0x1000
    ldrge r1, [sp, #0x44]
    strge r1, [r0, #0x8e0]
    bge L_021fd3c8
    ldr r0, [sp, #0x48]
    cmp r1, r0
    movlt r1, r0
    ldrlt r0, [sp, #0x8]
    strlt r1, [r0, #0x8e0]
L_021fd3c8:
    add r10, r10, #0x1
    cmp r10, #0x8
    blt L_021fd0a4
    add r9, r9, #0x1
    cmp r9, #0x8
    blt L_021fd050
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd3e8: .word 0xfd7
L_021fd3ec: .word 0x40002b0
    .size Overlay017_UpdateGridDeformation, . - Overlay017_UpdateGridDeformation
