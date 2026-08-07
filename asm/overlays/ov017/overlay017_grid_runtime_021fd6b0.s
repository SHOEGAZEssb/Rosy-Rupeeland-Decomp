    .text

/* Exact fallback; see src/overlays/ov017/overlay017_grid_runtime.c. */
    .extern data_ov017_02201414
    .extern data_ov017_022016e0
.global func_ov017_021fd6b0
func_ov017_021fd6b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r4, L_021fd73c
    ldr r5, L_021fd740
    ldr r4, [r4, #0xc]
    mov lr, #0x0
    ldr r4, [r5, r4, lsl #0x2]
    mov r8, #0x6c
    mov r5, r4, lsl #0x4
    mov r4, r5, asr #0x2
    add r4, r5, r4, lsr #0x1d
    mov r4, r4, asr #0x3
    mul r5, r4, r4
    mov r9, #0x24
L_021fd6e4:
    mla r6, lr, r8, r0
    mla r7, lr, r9, r0
    mov r4, #0x0
L_021fd6f0:
    mov ip, #0xc
    mla r10, r4, ip, r6
    ldr r11, [r10, #0x144]
    ldr r10, [r10, #0x14c]
    sub ip, r1, r11
    sub r11, r2, r10
    mul r10, r11, r11
    mla r10, ip, ip, r10
    cmp r10, r5
    ldrlt ip, [r7, r4, lsl #0x2]
    addlt ip, ip, r3
    strlt ip, [r7, r4, lsl #0x2]
    add r4, r4, #0x1
    cmp r4, #0x8
    ble L_021fd6f0
    add lr, lr, #0x1
    cmp lr, #0x8
    ble L_021fd6e4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd73c: .word data_ov017_022016e0
L_021fd740: .word data_ov017_02201414
    .size func_ov017_021fd6b0, . - func_ov017_021fd6b0

