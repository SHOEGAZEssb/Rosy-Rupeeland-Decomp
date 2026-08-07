    .text
/* Exact fallback; see src/overlays/ov018/overlay018_dialog_runtime.c (layout, text, and input helpers). */
    .extern MIi_CpuCopy16
    .extern data_021f3ecc
    .extern func_02079160
    .extern func_020791e0
    .extern func_02092e9c
    .extern func_02093360
.global func_ov018_021fd9f8
func_ov018_021fd9f8:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
    .size func_ov018_021fd9f8, . - func_ov018_021fd9f8

    .global func_ov018_021fda10
func_ov018_021fda10:
    stmdb sp!, {r4, r5, r6, lr}
    mov r1, r1, lsl #0x10
    mov r6, r0
    mov r5, r1, lsr #0x10
    ldr r0, L_021fda5c
    mov r1, r5
    bl func_02079160
    mov r4, r0
    ldr r0, L_021fda5c
    mov r1, r5
    bl func_020791e0
    mov r2, r4
    add r1, r6, #0x1c8
    bl MIi_CpuCopy16
    ldr r0, [r6, #0x418]
    add r1, r6, #0x1c8
    mov r2, #0x4
    bl func_02092e9c
    ldmia sp!, {r4, r5, r6, pc}
L_021fda5c: .word data_021f3ecc
    .size func_ov018_021fda10, . - func_ov018_021fda10

    .global func_ov018_021fda60
func_ov018_021fda60:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x34
    mov r4, r0
    ldr r3, [r4, #0x2c]
    add r2, sp, #0x1c
    mov r1, #0xb
L_021fda78:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_021fda78
    ldr r0, [r4, #0x418]
    ldr r2, [r0, #0x38]
    mov r0, r2, lsl #0x1f
    movs r0, r0, asr #0x1f
    str r2, [sp, #0x4]
    str r2, [sp, #0x14]
    movne r0, #0x1
    bne L_021fdb74
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fdae0
    mov r0, r2, lsl #0x1e
    movs r0, r0, asr #0x1f
    ldrneh r0, [sp, #0x1e]
    str r2, [sp, #0x10]
    orrne r0, r0, #0x1
    strneh r0, [sp, #0x1e]
    ldreqh r0, [sp, #0x1e]
    orreq r0, r0, #0x2
    streqh r0, [sp, #0x1e]
    b L_021fdb38
L_021fdae0:
    mov r0, r2, lsl #0x17
    mov r1, r2, lsl #0x1e
    mov r0, r0, asr #0x1f
    orrs r0, r0, r1, asr #0x1f
    ldr r0, [r4, #0x18c]
    str r2, [sp, #0x8]
    ldrne r1, [r0, #0x54]
    str r2, [sp, #0xc]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x2
    strneh r0, [r1, #0x24]
    bne L_021fdb38
    ldr r2, [r0, #0x54]
    ldrh r1, [r2, #0x24]
    and r0, r1, #0x2
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    orreq r0, r1, #0x2
    streqh r0, [r2, #0x24]
    ldreqh r0, [r2, #0x24]
    biceq r0, r0, #0x1
    streqh r0, [r2, #0x24]
L_021fdb38:
    ldr r0, [r4, #0x418]
    add r1, sp, #0x1c
    bl func_02093360
    mov r1, r0, lsl #0x1f
    str r0, [sp, #0x0]
    str r0, [sp, #0x18]
    movs r0, r1, asr #0x1f
    moveq r0, #0x0
    beq L_021fdb74
    ldr r1, [r4, #0x18c]
    mov r0, #0x1
    ldr r2, [r1, #0x54]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
L_021fdb74:
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
    .size func_ov018_021fda60, . - func_ov018_021fda60
