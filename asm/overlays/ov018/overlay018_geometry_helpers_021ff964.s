    .text
/* Exact fallback; see src/overlays/ov018/overlay018_geometry_helpers.c (point-buffer predicates). */
    .extern func_ov018_021ff474
.global func_ov018_021ff964
func_ov018_021ff964:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x14]
    cmp r1, #0x0
    ldmltia sp!, {r3, pc}
    ldr r2, [r0, #0x18]
    mov r3, #0x8
    bl func_ov018_021ff474
    ldmia sp!, {r3, pc}
    .size func_ov018_021ff964, . - func_ov018_021ff964

    .global func_ov018_021ff984
func_ov018_021ff984:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, [r0, #0x10]
    cmp r1, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r3, [r0, #0x14]
    ldr lr, [r0, #0x4]
    mov r1, r3, lsl #0x2
    add r2, lr, r3, lsl #0x2
    ldr ip, [r0, #0x18]
    add r3, r3, #0x1
    ldrsh r1, [lr, r1]
    ldrsh r2, [r2, #0x2]
    mov r0, #0x0
    b L_021ff9fc
L_021ff9c0:
    add r4, lr, r3, lsl #0x2
    mov r5, r3, lsl #0x2
    ldrsh r9, [lr, r5]
    ldrsh r8, [r4, #0x2]
    ldrsh r5, [r4, #0x6]
    ldrsh r4, [r4, #0x4]
    sub r7, r9, r1
    sub r6, r5, r8
    sub r5, r8, r2
    sub r4, r4, r9
    mul r6, r7, r6
    mul r4, r5, r4
    sub r4, r6, r4
    add r0, r0, r4
    add r3, r3, #0x1
L_021ff9fc:
    cmp r3, ip
    blt L_021ff9c0
    add r0, r0, r0, lsr #0x1f
    movs r0, r0, asr #0x1
    rsbmi r0, r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_ov018_021ff984, . - func_ov018_021ff984

    .global func_ov018_021ffa14
func_ov018_021ffa14:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x218
    ldr r3, [r0, #0x10]
    cmp r3, #0x4
    movlt r0, #0x0
    blt L_021ffba8
    ldr r8, [r0, #0x4]
    sub r0, r3, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x10]
    ldrsh r4, [r8, #0x0]
    ldrsh r5, [r8, #0x2]
    mov r10, #0x1
    add r0, sp, #0x18
    b L_021ffa9c
L_021ffa54:
    add r3, r8, r10, lsl #0x2
    mov r6, r10, lsl #0x2
    ldrsh r9, [r8, r6]
    ldrsh r7, [r3, #0x2]
    ldrsh r6, [r3, #0x6]
    ldrsh r11, [r3, #0x4]
    sub r3, r9, r4
    sub r6, r6, r7
    mul r6, r3, r6
    sub r7, r7, r5
    sub r3, r11, r9
    mul r3, r7, r3
    sub r6, r6, r3
    ldr r3, [sp, #0x10]
    str r6, [r0, r10, lsl #0x2]
    add r3, r3, r6
    str r3, [sp, #0x10]
    add r10, r10, #0x1
L_021ffa9c:
    ldr r3, [sp, #0x0]
    cmp r10, r3
    blt L_021ffa54
    sub r0, r1, r4
    mov r6, #0x0
    str r0, [sp, #0x8]
    sub r0, r2, r5
    str r6, [sp, #0xc]
    str r0, [sp, #0x4]
    mov r7, #0x1
    b L_021ffb80
L_021ffac8:
    add r0, sp, #0x18
    ldr r0, [r0, r7, lsl #0x2]
    add r9, r8, r7, lsl #0x2
    mov r3, r7, lsl #0x2
    ldrsh lr, [r8, r3]
    cmp r0, #0x0
    ldrsh ip, [r9, #0x2]
    ldrsh r3, [r9, #0x4]
    ldrsh r11, [r9, #0x6]
    beq L_021ffb7c
    sub r9, lr, r4
    sub r10, r2, ip
    mul r10, r9, r10
    str r10, [sp, #0x14]
    sub r9, ip, r5
    sub r10, r1, lr
    mul r10, r9, r10
    ldr r9, [sp, #0x14]
    sub r9, r9, r10
    muls r10, r9, r0
    bmi L_021ffb7c
    sub r10, r3, lr
    sub r9, r11, ip
    sub ip, r2, r11
    mul ip, r10, ip
    sub r10, r1, r3
    mul r10, r9, r10
    sub r9, ip, r10
    muls r10, r9, r0
    bmi L_021ffb7c
    sub r9, r4, r3
    ldr r3, [sp, #0x4]
    sub r10, r5, r11
    mul r3, r9, r3
    ldr r9, [sp, #0x8]
    mul r9, r10, r9
    sub r3, r3, r9
    muls r9, r3, r0
    bmi L_021ffb7c
    ldr r3, [sp, #0x10]
    muls r0, r3, r0
    ldrmi r0, [sp, #0xc]
    addpl r6, r6, #0x1
    addmi r0, r0, #0x1
    strmi r0, [sp, #0xc]
L_021ffb7c:
    add r7, r7, #0x1
L_021ffb80:
    ldr r0, [sp, #0x0]
    cmp r7, r0
    blt L_021ffac8
    cmp r6, #0x0
    moveq r0, #0x0
    beq L_021ffba8
    ldr r0, [sp, #0xc]
    cmp r6, r0
    movgt r0, #0x1
    movle r0, #0x0
L_021ffba8:
    add sp, sp, #0x218
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_ov018_021ffa14, . - func_ov018_021ffa14

    .global func_ov018_021ffbb0
func_ov018_021ffbb0:
    str r1, [r0, #0x24]
    bx lr
    .size func_ov018_021ffbb0, . - func_ov018_021ffbb0
