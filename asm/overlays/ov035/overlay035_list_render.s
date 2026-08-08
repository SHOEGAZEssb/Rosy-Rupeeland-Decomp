.text

/* Exact fallback; see src/overlays/ov035/overlay035_list_render.c for documented portable C. */

    .extern func_ov035_021fd7b0
    .extern func_02091bd0
    .extern func_ov035_021fd128
    .extern func_ov035_021fd28c


    .global func_ov035_021fd60c
func_ov035_021fd60c: 
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x28
    mov r10, r0
    ldr r0, [r10, #0x8]
    cmp r0, #0x2
    blt L_021fd7a4
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov035_021fd7b0
    ldr r0, [r10, #0x0]
    ldmib r0, {r1, r2, r3, r4, r5}
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r3, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    str r1, [sp, #0x20]
    mov r1, r2, asr #0x10
    mov r6, r5, lsl #0x10
    str r1, [sp, #0x1c]
    mov r1, r6, asr #0x10
    str r1, [sp, #0x18]
    ldr r9, [r0, #0x0]
    ldr r0, L_021fd7ac
    mov r4, r4, lsl #0x10
    sub r0, r0, #0x80
    str r0, [sp, #0x24]
    ldr r0, L_021fd7ac
    mov r5, r4, asr #0x10
    mov r11, r3, asr #0x10
    sub r4, r0, #0x6c
    b L_021fd79c
L_021fd6a0:
    ldmib r9, {r0, r1}
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x14]
    mov r0, r1, lsl #0x10
    mov r6, r0, asr #0x10
    ldr r0, [r9, #0xc]
    ldr r1, [r9, #0x10]
    mov r0, r0, lsl #0x10
    mov r7, r0, asr #0x10
    mov r0, r1, lsl #0x10
    ldr r1, [r9, #0x14]
    mov r8, r0, asr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [sp, #0x10]
    mov r1, #0x1
    add r0, r9, #0x18
    mov r2, #0x1f
    mov r3, r1
    bl func_02091bd0
    str r0, [sp, #0x0]
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x3
    mov r3, #0xe
    str r0, [sp, #0x4]
    bl func_ov035_021fd128
    ldr r0, L_021fd7ac
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldrh r3, [r10, #0x14]
    ldr r0, [sp, #0x20]
    ldr r1, [sp, #0x1c]
    ldr r2, [sp, #0x24]
    str r3, [r2, #0x0]
    ldr r2, [sp, #0x18]
    bl func_ov035_021fd28c
    mov r1, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    ldr r2, [sp, #0x10]
    mov r0, r11, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x0]
    mov r0, r7
    mov r1, r8
    bl func_ov035_021fd28c
    ldr r0, [sp, #0x14]
    mov r11, r7
    mov r1, r0, lsl #0x10
    str r0, [sp, #0x20]
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    orr r0, r0, r1, lsr #0x10
    str r0, [r4, #0x0]
    ldr r0, L_021fd7ac
    str r6, [sp, #0x1c]
    mov r1, #0x0
    str r1, [r0, #0x4]
    ldr r9, [r9, #0x0]
    mov r5, r8
L_021fd79c:
    cmp r9, #0x0
    bne L_021fd6a0
L_021fd7a4:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd7ac: .word 0x4000500
.size func_ov035_021fd60c, .-func_ov035_021fd60c

