    .text

/* Exact fallback; see src/overlays/ov017/overlay017_sprite_pool.c. */
    .extern data_020c9670
    .extern data_020f4e18
    .extern data_ov017_02201414
    .extern data_ov017_022016e0
    .extern func_020720c0
    .extern func_020720e8
    .extern func_02077308
    .extern Graphics3DResourceOwner_CreateManager
    .extern Graphics3DResourceOwner_PrepareResources
    .extern func_020918f4
    .extern func_02091b6c
    .extern func_ov017_021fe3c4
    .extern genrand_int32
.global func_ov017_021fe40c
func_ov017_021fe40c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r0, r10, #0x4
    mov r4, r1
    bl func_020720c0
    add r0, r10, #0x38
    bl func_02091b6c
    mov r0, #0x0
    str r0, [r10, #0x54]
    bl genrand_int32
    str r0, [r10, #0x54]
    mov r0, r4
    bl Graphics3DResourceOwner_CreateManager
    ldr r3, L_021fe574
    str r0, [r10, #0x0]
    ldr r1, L_021fe578
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r10, #0x4
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r10, #0x4
    bl Graphics3DResourceOwner_PrepareResources
    mov r6, #0x0
    ldr r11, L_021fe57c
    ldr r5, L_021fe580
    mov r4, r6
L_021fe484:
    mov r1, r6, lsl #0xf
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    sub r0, r0, #0x3800
    mov r0, r0, lsl #0x10
    mov r7, r0, lsr #0x10
    ldr r0, L_021fe584
    mov r1, r7, asr #0x4
    ldr r0, [r0, #0xc]
    mov r8, r1, lsl #0x1
    ldr r9, [r11, r0, lsl #0x2]
    ldr r0, [r10, #0x0]
    add r1, r10, #0x4
    bl func_02077308
    add r1, r10, r6, lsl #0x2
    str r0, [r1, #0x10]
    add r0, r10, #0x54
    mov r1, #0x3
    bl func_020918f4
    and r1, r0, #0xff
    add r0, r5, r8, lsl #0x1
    mov r2, r8, lsl #0x1
    ldrsh r8, [r0, #0x2]
    add r0, r10, r6, lsl #0x2
    ldr r3, L_021fe588
    mul ip, r9, r8
    mov r8, ip, asr #0x7
    add r8, ip, r8, lsr #0x18
    mov r8, r8, asr #0x8
    str r8, [sp, #0x0]
    mov r8, #0x20
    str r8, [sp, #0x4]
    mov r8, #0x42
    str r8, [sp, #0x8]
    ldrsh r2, [r5, r2]
    ldr r0, [r0, #0x10]
    mul r8, r9, r2
    mov r2, r8, asr #0x7
    add r2, r8, r2, lsr #0x18
    mov r2, r2, asr #0x8
    bl func_ov017_021fe3c4
    add r2, r10, r6, lsl #0x2
    ldr r0, [r2, #0x10]
    add r6, r6, #0x1
    str r4, [r0, #0x34]
    str r4, [r0, #0x38]
    ldr r0, [r2, #0x10]
    add r1, r7, #0x4000
    strh r1, [r0, #0x4a]
    ldr r1, [r2, #0x10]
    mov r0, #0x3
    cmp r6, #0x8
    strb r0, [r1, #0x59]
    blt L_021fe484
    str r4, [r10, #0x30]
    mov r0, r10
    str r4, [r10, #0x34]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe574: .word 0x6020
L_021fe578: .word data_020f4e18
L_021fe57c: .word data_ov017_02201414
L_021fe580: .word data_020c9670
L_021fe584: .word data_ov017_022016e0
L_021fe588: .word 0xfffff99a
    .size func_ov017_021fe40c, . - func_ov017_021fe40c
