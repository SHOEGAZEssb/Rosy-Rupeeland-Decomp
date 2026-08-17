    .text

/* Exact fallback; see src/overlays/ov017/overlay017_grid_runtime.c. */
    .extern data_020c9670
    .extern func_020b0808
    .extern func_020b0844
    .extern func_020b0880
.global Overlay017Transform_SubmitGeometry
Overlay017Transform_SubmitGeometry:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr ip, [r4, #0x10]
    ldr r3, [r4, #0xc]
    ldr r1, [r4, #0x8]
    ldr r0, L_021fd90c
    ldr r2, L_021fd910
    str r1, [r0, #0x0]
    str r3, [r0, #0x0]
    str ip, [r0, #0x0]
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0880
    ldr r0, [r4, #0x24]
    ldr r2, L_021fd910
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0844
    ldr r0, [r4, #0x28]
    ldr r2, L_021fd910
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    ldr r3, [r4, #0x1c]
    ldr r2, [r4, #0x18]
    ldr r1, [r4, #0x14]
    ldr r0, L_021fd914
    str r1, [r0, #0x0]
    str r2, [r0, #0x0]
    str r3, [r0, #0x0]
    ldmia sp!, {r4, pc}
L_021fd90c: .word 0x4000470
L_021fd910: .word data_020c9670
L_021fd914: .word 0x400046c
    .size Overlay017Transform_SubmitGeometry, . - Overlay017Transform_SubmitGeometry

