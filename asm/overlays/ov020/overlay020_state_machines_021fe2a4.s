    .text
/* Exact fallback; see src/overlays/ov020/overlay020_state_machines.c. */
    .extern data_ov020_021fe450
    .extern func_02092260
    .extern func_02092288
    .extern func_02093de4
    .extern func_02093ffc
    .extern func_020946a8
    .extern func_020946c8
    .extern func_02094738
    .extern func_ov020_021fd280
    .extern func_ov020_021fd81c
    .extern func_ov020_021fde6c
    .extern func_ov020_021fde9c
    .extern func_ov020_021fdee0

.global func_ov020_021fe2a4
func_ov020_021fe2a4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x1dc]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x44]
    cmp r0, #0x0
    beq L_021fe2d4
    cmp r0, #0x1
    beq L_021fe2f4
    cmp r0, #0x2
    beq L_021fe368
    b L_021fe3d0
L_021fe2d4:
    mov r0, r4
    mov r1, #0x4
    bl func_020946a8
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021fe2f4:
    mov r0, r4
    bl func_02093ffc
    cmp r0, #0x0
    beq L_021fe34c
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_021fe334
    mov r0, r5
    bl func_ov020_021fdee0
    mov r0, r5
    mov r1, #0x8
    bl func_02092288
L_021fe334:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fe368
L_021fe34c:
    ldr r0, [r5, #0x1dc]
    bl func_ov020_021fd280
    cmp r0, #0x0
    beq L_021fe3d0
    mov r0, r5
    bl func_ov020_021fde9c
    b L_021fe3d0
L_021fe368:
    mov r0, r4
    bl func_02093de4
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    mov r0, r4
    beq L_021fe3b8
    add r1, r5, #0x30
    bl func_020946c8
    cmp r0, #0x0
    beq L_021fe3d0
    mov r0, r5
    mov r1, #0x8
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fe3d0
L_021fe3b8:
    mov r1, #0x6
    bl func_02094738
    ldr r1, L_021fe3e0
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov020_021fd81c
L_021fe3d0:
    mov r0, r5
    bl func_ov020_021fde6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fe3e0: .word data_ov020_021fe450
    .size func_ov020_021fe2a4, . - func_ov020_021fe2a4

