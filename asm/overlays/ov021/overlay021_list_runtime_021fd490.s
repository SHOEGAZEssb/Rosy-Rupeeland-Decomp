    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_runtime.c. */
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_02075598
    .extern func_02076148
    .extern GraphicsSpriteCanvas_FillRect
    .extern func_02092960
    .extern func_ov021_021fd6e8

.global func_ov021_021fd490
func_ov021_021fd490:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r4, #0x0
    mov r5, r0
    mov r7, r4
    mov r8, #0x2
    mov r6, #0xc
    b L_021fd4f8
L_021fd4b0:
    ldr r1, [r5, #0x58]
    ldr r0, [r5, #0x54]
    ldr r1, [r1, #0xc]
    add r2, r4, r1
    cmp r2, r0
    bge L_021fd500
    mul r1, r2, r6
    ldr r2, [r5, #0x4c]
    ldr r0, [r2, r1]
    add r2, r2, r1
    ldr r0, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    cmp r0, #0x2
    movge r1, r8
    ldr r0, [r2, #0x4]
    movlt r1, r7
    bl GraphicsSpriteState_SetAnimationIndex
    add r4, r4, #0x1
L_021fd4f8:
    cmp r4, #0x4
    blt L_021fd4b0
L_021fd500:
    mov r0, #0x8e
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x0]
    mov r1, #0x2a
    mov r2, #0x7e
    mov r3, #0x7a
    bl GraphicsSpriteCanvas_FillRect
    mov r0, r5
    bl func_ov021_021fd6e8
    cmp r0, #0x0
    beq L_021fd658
    mov r0, r5
    bl func_ov021_021fd6e8
    ldr r4, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldrh r0, [r0, #0x4]
    cmp r0, #0x2
    movge r6, #0x3
    mov r0, r5
    movlt r6, #0x1
    bl func_ov021_021fd6e8
    ldr r0, [r0, #0x4]
    mov r1, r6
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x4]
    ldrh r0, [r1, #0x4]
    ldr r4, [r1, #0x10]
    cmp r0, #0x0
    bne L_021fd644
    cmp r4, #0x1
    ble L_021fd644
    cmp r4, #0x64
    bge L_021fd59c
    ldr r0, [r5, #0x24]
    mov r1, #0x1c
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fd5c0
L_021fd59c:
    ldr r0, L_021fd670
    cmp r4, r0
    ldr r0, [r5, #0x24]
    bge L_021fd5b8
    mov r1, #0x1d
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fd5c0
L_021fd5b8:
    mov r1, #0x1e
    bl GraphicsSpriteState_SetAnimationIndex
L_021fd5c0:
    ldr r1, [r5, #0x24]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x0]
    ldr r1, [r5, #0x2c]
    bl func_02075598
    mov r0, #0x7e
    str r0, [sp, #0x0]
    mov r0, #0xe
    str r0, [sp, #0x4]
    mov r0, #0x8
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r0, [r5, #0x0]
    ldr r2, L_021fd674
    mov r1, r4
    mov r3, #0x2a
    bl func_02092960
    mov r1, #0xe
    mov r2, r0
    str r1, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x0]
    add r1, r5, #0x64
    add r2, r2, #0x2e
    mov r3, #0x7e
    bl func_02076148
    b L_021fd668
L_021fd644:
    ldr r1, [r5, #0x24]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    b L_021fd668
L_021fd658:
    ldr r1, [r5, #0x24]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
L_021fd668:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fd670: .word 0x2710
L_021fd674: .word 0xff676980
    .size func_ov021_021fd490, . - func_ov021_021fd490

