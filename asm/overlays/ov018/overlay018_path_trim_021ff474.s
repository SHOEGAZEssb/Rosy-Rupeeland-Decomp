    .text
/* Exact fallback; see src/overlays/ov018/overlay018_path_trim.c. */
    .extern func_020befec
    .extern func_ov018_021ff738
    .extern func_ov018_021ff75c

.global func_ov018_021ff474
func_ov018_021ff474:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x220
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r7, r3
    ldrsh r5, [r10, #0x8]
    ldrsh r6, [r10, #0xa]
    mov r4, #0x0
    b L_021ff554
L_021ff49c:
    ldr r2, [r10, #0x4]
    mov r1, r9, lsl #0x2
    add r0, r2, r9, lsl #0x2
    ldrsh r11, [r0, #0x2]
    ldrsh r0, [r2, r1]
    str r0, [sp, #0x14]
    sub r0, r11, r6
    mul r1, r0, r0
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x14]
    sub r0, r0, r5
    mla r2, r0, r0, r1
    str r0, [sp, #0x10]
    ldr r0, L_021ff734
    mov r1, #0x1
    strh r1, [r0, #0x0]
    str r2, [r0, #0x8]
    mov r1, r2, asr #0x1f
    str r1, [r0, #0xc]
    bl func_ov018_021ff738
    str r0, [sp, #0x18]
    add r0, r4, r0
    cmp r0, r7
    blt L_021ff544
    ldr r1, [sp, #0x10]
    sub r4, r7, r4
    mul r0, r1, r4
    ldr r1, [sp, #0x18]
    bl func_020befec
    ldr r1, [sp, #0xc]
    add r5, r5, r0
    mul r0, r1, r4
    ldr r3, [r10, #0x4]
    mov r2, r9, lsl #0x2
    ldr r1, [sp, #0x18]
    strh r5, [r3, r2]
    bl func_020befec
    ldr r1, [r10, #0x4]
    add r2, r6, r0
    add r0, r1, r9, lsl #0x2
    strh r2, [r0, #0x2]
    b L_021ff55c
L_021ff544:
    ldr r5, [sp, #0x14]
    mov r4, r0
    mov r6, r11
    sub r9, r9, #0x1
L_021ff554:
    cmp r9, #0x0
    bge L_021ff49c
L_021ff55c:
    ldrsh r5, [r10, #0x8]
    ldrsh r6, [r10, #0xa]
    mov r4, #0x0
    b L_021ff624
L_021ff56c:
    ldr r2, [r10, #0x4]
    mov r1, r8, lsl #0x2
    add r0, r2, r8, lsl #0x2
    ldrsh r11, [r0, #0x2]
    ldrsh r0, [r2, r1]
    str r0, [sp, #0x8]
    sub r0, r11, r6
    mul r1, r0, r0
    str r0, [sp, #0x0]
    ldr r0, [sp, #0x8]
    sub r0, r0, r5
    mla r2, r0, r0, r1
    str r0, [sp, #0x4]
    ldr r0, L_021ff734
    mov r1, #0x1
    strh r1, [r0, #0x0]
    str r2, [r0, #0x8]
    mov r1, r2, asr #0x1f
    str r1, [r0, #0xc]
    bl func_ov018_021ff738
    str r0, [sp, #0x1c]
    add r0, r4, r0
    cmp r0, r7
    blt L_021ff614
    ldr r1, [sp, #0x4]
    sub r4, r7, r4
    mul r0, r1, r4
    ldr r1, [sp, #0x1c]
    bl func_020befec
    ldr r1, [sp, #0x0]
    add r5, r5, r0
    mul r0, r1, r4
    ldr r3, [r10, #0x4]
    mov r2, r8, lsl #0x2
    ldr r1, [sp, #0x1c]
    strh r5, [r3, r2]
    bl func_020befec
    ldr r1, [r10, #0x4]
    add r2, r6, r0
    add r0, r1, r8, lsl #0x2
    strh r2, [r0, #0x2]
    b L_021ff630
L_021ff614:
    ldr r5, [sp, #0x8]
    mov r4, r0
    mov r6, r11
    add r8, r8, #0x1
L_021ff624:
    ldr r0, [r10, #0x10]
    cmp r8, r0
    blt L_021ff56c
L_021ff630:
    ldr r0, [r10, #0x10]
    cmp r9, #0x0
    movlt r9, #0x0
    cmp r8, r0
    subge r8, r0, #0x1
    ldr r0, [r10, #0x14]
    mov r5, #0x0
    sub r0, r0, r9
    str r0, [r10, #0x14]
    ldr r0, [r10, #0x18]
    add r4, sp, #0x20
    sub r0, r0, r9
    str r0, [r10, #0x18]
    b L_021ff680
L_021ff668:
    ldr r1, [r10, #0x4]
    add r0, r4, r5, lsl #0x2
    add r1, r1, r9, lsl #0x2
    add r5, r5, #0x1
    bl func_ov018_021ff75c
    add r9, r9, #0x1
L_021ff680:
    cmp r9, r8
    ble L_021ff668
    str r5, [r10, #0x10]
    mov r6, #0x0
    add r4, sp, #0x20
    b L_021ff724
L_021ff698:
    ldr r0, [r10, #0x4]
    add r1, r4, r6, lsl #0x2
    add r0, r0, r6, lsl #0x2
    bl func_ov018_021ff75c
    ldr r0, [r10, #0x14]
    cmp r6, r0
    blt L_021ff720
    ldr r0, [r10, #0x18]
    cmp r6, r0
    bgt L_021ff720
    ldr r1, [r10, #0x4]
    mov r0, r6, lsl #0x2
    ldrsh r1, [r1, r0]
    ldrsh r0, [r10, #0x1c]
    cmp r1, r0
    strlth r1, [r10, #0x1c]
    ldr r1, [r10, #0x4]
    mov r0, r6, lsl #0x2
    ldrsh r1, [r1, r0]
    ldrsh r0, [r10, #0x20]
    cmp r1, r0
    strgth r1, [r10, #0x20]
    ldr r1, [r10, #0x4]
    ldrsh r0, [r10, #0x1e]
    add r1, r1, r6, lsl #0x2
    ldrsh r1, [r1, #0x2]
    cmp r1, r0
    strlth r1, [r10, #0x1e]
    ldr r1, [r10, #0x4]
    ldrsh r0, [r10, #0x22]
    add r1, r1, r6, lsl #0x2
    ldrsh r1, [r1, #0x2]
    cmp r1, r0
    strgth r1, [r10, #0x22]
L_021ff720:
    add r6, r6, #0x1
L_021ff724:
    cmp r6, r5
    blt L_021ff698
    add sp, sp, #0x220
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021ff734: .word 0x40002b0
    .size func_ov018_021ff474, . - func_ov018_021ff474
