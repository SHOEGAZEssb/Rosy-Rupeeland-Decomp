    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_variant.c. */
    .extern data_ov017_02201408
    .extern func_ov017_021fd838
    .extern func_ov017_021fd918
.global func_ov017_021fe33c
func_ov017_021fe33c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr r2, L_021fe3c0
    add r3, sp, #0x0
    mov r5, r0
    mov r4, r1
    ldmia r2, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r1, [r5, #0x40]
    mov r0, r4
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [r4, #0x28]
    str r1, [r4, #0x24]
    str r1, [r4, #0x20]
    ldr r1, [r5, #0x70]
    str r1, [r4, #0x1c]
    str r1, [r4, #0x18]
    str r1, [r4, #0x14]
    ldr r1, [r5, #0x10]
    str r1, [r4, #0x8]
    ldr r1, [r5, #0x20]
    str r1, [r4, #0xc]
    ldr r1, [r5, #0x30]
    str r1, [r4, #0x10]
    bl func_ov017_021fd838
    ldr r2, [r5, #0x9c]
    add r1, sp, #0x0
    ldr r1, [r1, r2, lsl #0x2]
    mov r0, r4
    bl func_ov017_021fd918
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021fe3c0: .word data_ov017_02201408
    .size func_ov017_021fe33c, . - func_ov017_021fe33c
