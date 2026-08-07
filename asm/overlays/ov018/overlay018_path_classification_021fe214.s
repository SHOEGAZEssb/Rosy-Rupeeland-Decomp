    .text
/* Exact fallback; see src/overlays/ov018/overlay018_path_classification.c. */
    .extern GameWork_SetFlag
    .extern GameWork_TestFlag
    .extern data_020c37e4
    .extern data_020d7a48
    .extern func_020befec
    .extern func_ov018_021fe19c
    .extern func_ov018_021fe1d8
    .extern func_ov018_021ffa14
    .extern gGameWork

.global func_ov018_021fe214
func_ov018_021fe214:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r10, r0
    ldr r0, L_021fe458
    ldr r4, [r10, #0x58]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    str r1, [r10, #0x420]
    str r0, [sp, #0x4]
    mov r9, #0x0
    b L_021fe440
L_021fe240:
    ldr r0, L_021fe45c
    mov r1, #0x24
    mla r2, r9, r1, r0
    str r2, [r10, #0x194]
    ldrsh r1, [r2, #0x0]
    ldr r0, [r10, #0x19c]
    cmp r1, r0
    bne L_021fe43c
    ldr r0, L_021fe460
    ldrh r1, [r2, #0x1c]
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_021fe43c
    ldr r0, [r10, #0x194]
    ldrh r1, [r0, #0x1e]
    cmp r1, #0x0
    beq L_021fe29c
    ldr r0, L_021fe460
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_021fe43c
L_021fe29c:
    ldr r1, [r10, #0x194]
    mov r0, r10
    bl func_ov018_021fe19c
    mov r11, r0
    ldr r1, [r10, #0x194]
    mov r0, r10
    bl func_ov018_021fe1d8
    ldr r8, [r10, #0x194]
    mov r2, r0
    ldrsh r1, [r8, #0x14]
    ldrsh r5, [r8, #0x10]
    ldrsh r3, [r8, #0x12]
    add r7, r11, r1
    ldrsh r1, [r8, #0x16]
    add r5, r11, r5
    ldrsh r0, [r4, #0x20]
    add r6, r2, r3
    add r8, r2, r1
    cmp r0, r5
    str r5, [sp, #0x14]
    str r6, [sp, #0x10]
    str r7, [sp, #0xc]
    str r8, [sp, #0x8]
    blt L_021fe43c
    ldrsh r1, [r4, #0x1c]
    cmp r1, r7
    bge L_021fe43c
    ldrsh ip, [r4, #0x22]
    cmp ip, r6
    blt L_021fe43c
    ldrsh r3, [r4, #0x1e]
    cmp r3, r8
    bge L_021fe43c
    cmp r1, r5
    strgt r1, [sp, #0x14]
    cmp r0, r7
    strlt r0, [sp, #0xc]
    cmp r3, r6
    strgt r3, [sp, #0x10]
    cmp ip, r8
    ldr r0, [r10, #0x58]
    mov r1, r11
    strlt ip, [sp, #0x8]
    bl func_ov018_021ffa14
    cmp r0, #0x0
    beq L_021fe43c
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x14]
    sub r2, r1, r0
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0x10]
    sub r0, r1, r0
    mul r1, r2, r0
    mov r0, #0x64
    mul r0, r1, r0
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [r10, #0x420]
    ldrsh r11, [r4, #0x20]
    ldrsh r3, [r4, #0x1c]
    ldrsh r2, [r4, #0x22]
    ldrsh r1, [r4, #0x1e]
    sub r3, r11, r3
    ldr r0, [sp, #0x0]
    sub r1, r2, r1
    mul r1, r3, r1
    bl func_020befec
    cmp r0, #0x1e
    blt L_021fe43c
    sub r2, r7, r5
    sub r0, r8, r6
    mul r1, r2, r0
    ldr r0, [sp, #0x0]
    bl func_020befec
    cmp r0, #0x1e
    blt L_021fe43c
    mov r0, #0x0
    str r0, [r10, #0x420]
    ldr r1, [r10, #0x194]
    ldr r0, L_021fe460
    ldrh r1, [r1, #0x1c]
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_021fe460
    ldr r1, L_021fe464
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, [r10, #0x54]
    cmp r0, #0x1
    beq L_021fe434
    ldr r1, L_021fe460
    ldr r0, [r1, #0x0]
    add r0, r0, #0x294
    add r2, r0, #0x5c00
    ldrb r0, [r2, r9]
    cmp r0, #0x0
    bne L_021fe434
    mov r0, #0x1
    strb r0, [r2, r9]
    ldr r0, [r1, #0x0]
    ldr r1, L_021fe468
    bl GameWork_SetFlag
L_021fe434:
    mov r0, #0x1
    b L_021fe450
L_021fe43c:
    add r9, r9, #0x1
L_021fe440:
    ldr r0, [sp, #0x4]
    cmp r9, r0
    blt L_021fe240
    mov r0, #0x0
L_021fe450:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe458: .word data_020c37e4
L_021fe45c: .word data_020d7a48
L_021fe460: .word gGameWork
L_021fe464: .word 0x3ae
L_021fe468: .word 0x3ca
    .size func_ov018_021fe214, . - func_ov018_021fe214
