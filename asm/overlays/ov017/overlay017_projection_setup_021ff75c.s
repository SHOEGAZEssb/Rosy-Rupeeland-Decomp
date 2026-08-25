    .text
/* Exact fallback; see src/overlays/ov017/overlay017_projection_setup.c. */
    .extern data_ov017_02201414
    .extern data_ov017_022016e0
    .extern Graphics3DSceneState_Apply
    .extern func_020adc90
    .extern func_020b01a0
    .extern func_020b0558
.global Overlay017_SetupProjection
Overlay017_SetupProjection:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl func_020b0558
    add r0, r4, #0x310
    bl Graphics3DSceneState_Apply
    ldr r2, L_021ff898
    mov r3, #0x0
    ldr r0, L_021ff89c
    str r3, [r2, #0x0]
    ldr r1, [r0, #0xc]
    ldr r0, L_021ff8a0
    ldr r0, [r0, r1, lsl #0x2]
    mov r1, r0, lsl #0xc
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [r2, #0x2c]
    str r3, [r2, #0x2c]
    str r3, [r2, #0x2c]
    str r3, [r2, #0x180]
    str r3, [r2, #0x180]
    add r6, sp, #0x4
    add r5, sp, #0x0
L_021ff7bc:
    mov r0, r6
    mov r1, r5
    bl func_020b01a0
    cmp r0, #0x0
    bne L_021ff7bc
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x0]
    bl func_020adc90
    mov r1, r0, lsl #0x7
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    add r0, r0, #0x80
    ldr r3, L_021ff8a4
    str r0, [r4, #0x3a4]
    mov r0, #0x1
    str r0, [r3, #0x0]
    mov r2, #0x0
    ldr r0, L_021ff89c
    str r2, [r3, #-0x4]
    ldr r1, [r0, #0xc]
    ldr r0, L_021ff8a0
    str r2, [r3, #0x28]
    ldr r0, [r0, r1, lsl #0x2]
    str r2, [r3, #0x28]
    mov r1, r0, lsl #0xc
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [r3, #0x28]
    str r2, [r3, #0x17c]
    str r2, [r3, #0x17c]
    add r6, sp, #0x4
    add r5, sp, #0x0
L_021ff844:
    mov r0, r6
    mov r1, r5
    bl func_020b01a0
    cmp r0, #0x0
    bne L_021ff844
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x0]
    bl func_020adc90
    rsb r1, r0, #0x0
    mov r0, #0x60
    mul r2, r1, r0
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r0, r0, asr #0xc
    add r1, r0, #0x60
    ldr r0, L_021ff8a4
    str r1, [r4, #0x3a8]
    mov r1, #0x1
    str r1, [r0, #0x0]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
L_021ff898: .word 0x4000444
L_021ff89c: .word data_ov017_022016e0
L_021ff8a0: .word data_ov017_02201414
L_021ff8a4: .word 0x4000448
    .size Overlay017_SetupProjection, . - Overlay017_SetupProjection
