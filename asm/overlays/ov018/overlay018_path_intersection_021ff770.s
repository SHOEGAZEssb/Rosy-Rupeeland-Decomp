    .text
/* Exact fallback; see src/overlays/ov018/overlay018_path_intersection.c. */
    .extern func_020befec

.global Overlay018_DetectPathIntersection
Overlay018_DetectPathIntersection:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r0, [r5, #0x24]
    cmp r0, #0x0
    movne r0, #0x0
    bne L_021ff95c
    ldr r4, [r5, #0x10]
    cmp r4, #0x8
    movle r0, #0x0
    ble L_021ff95c
    ldr lr, [r5, #0x4]
    sub r0, r4, #0x1
    mov r3, r0, lsl #0x2
    add r2, lr, r0, lsl #0x2
    sub r1, r4, #0x2
    mov r0, r1, lsl #0x2
    add r1, lr, r1, lsl #0x2
    ldrsh r8, [r1, #0x2]
    ldrsh r6, [lr, r3]
    ldrsh r0, [lr, r0]
    ldrsh r7, [r2, #0x2]
    sub r1, r4, #0x8
    sub r2, r6, r0
    str r2, [sp, #0x8]
    sub r2, r7, r8
    str r2, [sp, #0x0]
    b L_021ff950
L_021ff7e0:
    add r9, lr, r1, lsl #0x2
    mov r2, r1, lsl #0x2
    cmp r6, r0
    ldrsh r2, [lr, r2]
    ldrsh r3, [r9, #0x2]
    ldrsh r4, [r9, #-0x4]
    ldrsh ip, [r9, #-0x2]
    blt L_021ff81c
    cmp r6, r2
    cmplt r6, r4
    blt L_021ff94c
    cmp r0, r2
    cmpgt r0, r4
    ble L_021ff834
    b L_021ff94c
L_021ff81c:
    cmp r0, r2
    cmplt r0, r4
    blt L_021ff94c
    cmp r6, r2
    cmpgt r6, r4
    bgt L_021ff94c
L_021ff834:
    cmp r7, r8
    blt L_021ff858
    cmp r7, r3
    cmplt r7, ip
    blt L_021ff94c
    cmp r8, r3
    cmpgt r8, ip
    ble L_021ff870
    b L_021ff94c
L_021ff858:
    cmp r8, r3
    cmplt r8, ip
    blt L_021ff94c
    cmp r7, r3
    cmpgt r7, ip
    bgt L_021ff94c
L_021ff870:
    ldr r9, [sp, #0x8]
    sub r10, r3, r7
    mul r11, r9, r10
    ldr r9, [sp, #0x0]
    sub r10, r2, r6
    mul r10, r9, r10
    sub r9, r11, r10
    str r9, [sp, #0x4]
    ldr r9, [sp, #0x8]
    sub r10, ip, r7
    mul r11, r9, r10
    ldr r9, [sp, #0x0]
    sub r10, r4, r6
    mul r10, r9, r10
    ldr r9, [sp, #0x4]
    sub r10, r11, r10
    mul r10, r9, r10
    cmp r10, #0x0
    bgt L_021ff94c
    sub r10, r3, ip
    sub r11, r6, r2
    sub r9, r2, r4
    mul r4, r10, r11
    sub r2, r0, r2
    mul r2, r10, r2
    sub r10, r7, r3
    mul r10, r9, r10
    sub r4, r10, r4
    sub r3, r8, r3
    mul r3, r9, r3
    sub r2, r3, r2
    mul r3, r4, r2
    cmp r3, #0x0
    bgt L_021ff94c
    sub r0, r0, r6
    mul r0, r4, r0
    sub r1, r1, #0x1
    str r1, [r5, #0x14]
    ldr r1, [r5, #0x10]
    sub r9, r4, r2
    sub r2, r1, #0x1
    mov r1, r9
    str r2, [r5, #0x18]
    bl func_020befec
    add r2, r6, r0
    sub r0, r8, r7
    mul r0, r4, r0
    mov r1, r9
    strh r2, [r5, #0x8]
    bl func_020befec
    add r0, r7, r0
    strh r0, [r5, #0xa]
    mov r0, #0x1
    str r0, [r5, #0x24]
    b L_021ff95c
L_021ff94c:
    sub r1, r1, #0x1
L_021ff950:
    cmp r1, #0x0
    bgt L_021ff7e0
    mov r0, #0x0
L_021ff95c:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size Overlay018_DetectPathIntersection, . - Overlay018_DetectPathIntersection
