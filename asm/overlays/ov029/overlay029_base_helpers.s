.text

/* Exact fallback; see src/overlays/ov029/overlay029_base_helpers.c. */
.extern data_ov029_021fecec
.extern func_0207c460

    .global func_ov029_021fce00
func_ov029_021fce00:
    stmdb sp!, {r4, lr}
    ldr r2, L_021fce2c
    mov r4, r0
    str r2, [r4, #0x0]
    mov r2, #0x0
    str r2, [r4, #0x4]
    str r2, [r4, #0x8]
    str r2, [r4, #0xc]
    bl func_0207c460
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fce2c: .word data_ov029_021fecec
.size func_ov029_021fce00, .-func_ov029_021fce00
    .global func_ov029_021fce30
func_ov029_021fce30:
    bx lr
.size func_ov029_021fce30, .-func_ov029_021fce30
    .global func_ov029_021fce34
func_ov029_021fce34:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
.size func_ov029_021fce34, .-func_ov029_021fce34
    .global func_ov029_021fce4c
func_ov029_021fce4c:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr
.size func_ov029_021fce4c, .-func_ov029_021fce4c
