    .text
    .extern data_021e9ac0
    .extern data_021f3ecc
    .extern func_020628c8
    .extern func_020651a4
    .extern func_02075598
    .extern func_02076148
    .extern func_02076428
    .extern func_02079f3c
    .extern func_02092960
    .extern gSystemState

/* Exact fallback; see src/overlays/ov016/overlay016_list_render.c. */
    .global func_ov016_021fd3f8

func_ov016_021fd3f8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r2, #0xb0
    mov r1, #0x0
    str r2, [sp, #0x0]
    mov r6, r0
    str r1, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl func_02076428
    ldr r0, [r6, #0x54]
    cmp r0, #0x0
    beq L_021fd5a4
    mov r10, #0x0
    mov r8, #0x4
    mov r7, r10
    mov r11, #0x8
    b L_021fd59c
L_021fd444:
    ldr r1, [r6, #0x58]
    ldr r0, [r6, #0x54]
    ldr r1, [r1, #0xc]
    add r1, r10, r1
    cmp r1, r0
    bge L_021fd5a4
    mov r0, #0x14
    mul r4, r1, r0
    ldr r1, [r6, #0x4c]
    ldr r0, [r6, #0x0]
    ldr r5, [r1, r4]
    ldr r1, [r6, #0x28]
    bl func_02075598
    cmp r5, #0x0
    beq L_021fd558
    ldr r0, [r6, #0x4c]
    ldr r9, [r5, #0x0]
    add r0, r0, r4
    ldrh r0, [r0, #0xc]
    mov r5, #0xe
    and r0, r0, #0x7
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r5, #0x5
    add r0, r9, #0x4
    bl func_020628c8
    stmia sp, {r5, r8}
    add r5, r10, #0x1
    mov r3, #0x18
    mul r3, r5, r3
    str r7, [sp, #0x8]
    mov r1, r0
    ldr r0, [r6, #0x0]
    mov r2, #0x44
    bl func_02076148
    ldr r0, [r6, #0x4c]
    ldrh r1, [r9, #0x4]
    add r0, r0, r4
    ldrh r0, [r0, #0xc]
    mov r5, #0xe
    and r0, r0, #0x2
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldr r0, L_021fd5ac
    movne r5, #0x3
    ldr r0, [r0, #0x0]
    add r0, r0, #0x1c
    bl func_020651a4
    mov r4, r0
    mov r0, #0x18
    mul r0, r10, r0
    add r9, r0, #0x20
    ldr r0, L_021fd5b0
    ldr r1, [r6, #0x2c]
    ldrb r0, [r0, #0x5f]
    cmp r0, #0x0
    ldr r0, [r6, #0x0]
    subne r9, r9, #0x2
    bl func_02075598
    str r9, [sp, #0x0]
    stmib sp, {r5, r11}
    mov r0, #0x1
    str r0, [sp, #0xc]
    ldr r0, [r6, #0x0]
    mov r1, r4
    mov r2, #0xa
    mov r3, #0xb0
    bl func_02092960
    b L_021fd598
L_021fd558:
    ldr r0, L_021fd5b4
    mov r1, #0x188
    bl func_02079f3c
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r1, #0x4
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    add r1, r0, #0x2
    add r4, r10, #0x1
    mov r3, #0x18
    mul r3, r4, r3
    ldr r0, [r6, #0x0]
    mov r2, #0x44
    bl func_02076148
L_021fd598:
    add r10, r10, #0x1
L_021fd59c:
    cmp r10, #0x5
    blt L_021fd444
L_021fd5a4:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd5ac: .word data_021e9ac0
L_021fd5b0: .word gSystemState
L_021fd5b4: .word data_021f3ecc

    .size func_ov016_021fd3f8, . - func_ov016_021fd3f8
