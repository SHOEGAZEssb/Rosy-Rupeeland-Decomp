.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */
.extern data_020f4e14
.extern data_ov025_02202f40
.extern func_02075598
.extern func_020755bc
.extern func_02075e48
.extern func_02075ea8
.extern func_02075ecc
.extern func_ov025_021fd03c
.extern gSystemState


    .global func_ov025_021fd160
func_ov025_021fd160:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    ldr r2, L_021fd2dc
    mov r10, r0
    ldr r0, [r2, #0x0]
    mov r9, r1
    bl func_020755bc
    ldr r0, L_021fd2dc
    mov r1, r9
    ldr r0, [r0, #0x0]
    bl func_02075598
    ldr r0, L_021fd2e0
    mov r1, #0x0
    ldrb r0, [r0, #0x5f]
    ldr r7, L_021fd2dc
    mov r6, #0x0
    cmp r0, #0x0
    ldr r0, L_021fd2e4
    movne r1, #0x1
    mov r5, #0xe
    add r4, r0, r1, lsl #0x4
    mov r8, #0xac
L_021fd1b8:
    str r5, [sp, #0x0]
    add r0, r4, r6, lsl #0x2
    mov r1, r6, lsl #0x2
    ldrsh r2, [r0, #0x2]
    ldrh r1, [r1, r4]
    ldr r0, [r7, #0x0]
    mov r3, r8
    sub r2, r2, #0x5
    bl func_02075e48
    add r6, r6, #0x1
    cmp r6, #0x4
    blt L_021fd1b8
    mov r5, #0x0
L_021fd1ec:
    mov r0, #0xb
    mov r1, #0x14
    mul r7, r5, r0
    mul r4, r5, r1
    and r8, r5, #0x1
    mov r6, #0x0
    mvn r11, #0x1
L_021fd208:
    add r2, r6, r7
    ldr r1, [r10, #0x178]
    mov r0, r2, lsl #0x1
    ldrh r1, [r1, r0]
    cmp r1, #0x0
    beq L_021fd298
    add r1, r10, r2, lsl #0x2
    ldr r2, [r1, #0x40]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r10, #0x178]
    ldrh r0, [r1, r0]
    bl func_02075ecc
    str r0, [sp, #0x4]
    ldr r0, L_021fd2dc
    ldr r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    bl func_02075ea8
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x13
    mov r0, #0x16
    mla r0, r6, r0, r3
    cmp r8, #0x0
    movne r2, #0x2
    moveq r2, r11
    add r2, r0, r2
    ldr r1, [sp, #0x4]
    mov r0, #0xe
    str r0, [sp, #0x0]
    ldr r0, L_021fd2dc
    add r3, r4, #0x1d
    ldr r0, [r0, #0x0]
    bl func_02075e48
    b L_021fd2ac
L_021fd298:
    add r0, r10, r2, lsl #0x2
    ldr r1, [r0, #0x40]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
L_021fd2ac:
    add r6, r6, #0x1
    cmp r6, #0xb
    blt L_021fd208
    add r5, r5, #0x1
    cmp r5, #0x7
    blt L_021fd1ec
    mov r0, r10
    mov r1, r9
    mov r2, #0x1
    bl func_ov025_021fd03c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd2dc: .word data_020f4e14
L_021fd2e0: .word gSystemState
L_021fd2e4: .word data_ov025_02202f40
.size func_ov025_021fd160, .-func_ov025_021fd160

