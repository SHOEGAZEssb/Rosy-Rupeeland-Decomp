.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */
.extern func_02072bdc
.extern func_02093360
.extern func_020939d8
.extern func_ov032_021fe0c4
.extern func_ov032_021fe0e8

    .global func_ov032_021fe134
func_ov032_021fe134:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r5, r0
    ldr r3, [r5, #0xb60]
    mov r4, r1
    add r2, sp, #0x18
    mov r1, #0xb
L_021fe150:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_021fe150
    ldr r0, [r5, #0x10]
    ldr r1, [r0, #0x38]
    mov r0, r1, lsl #0x1f
    movs r0, r0, asr #0x1f
    str r1, [sp, #0x4]
    str r1, [sp, #0x14]
    movne r0, #0x1
    bne L_021fe234
    ldr r0, [r5, #0xb84]
    cmp r0, #0x0
    beq L_021fe1b0
    mov r0, r1, lsl #0x1e
    movs r0, r0, asr #0x1f
    ldrneh r0, [sp, #0x1a]
    str r1, [sp, #0x10]
    orrne r0, r0, #0x1
    strneh r0, [sp, #0x1a]
    ldreqh r0, [sp, #0x1a]
    orreq r0, r0, #0x2
    streqh r0, [sp, #0x1a]
L_021fe1b0:
    ldr r0, [r5, #0x10]
    add r1, sp, #0x18
    bl func_02093360
    mov r1, r0, lsl #0x1f
    str r0, [sp, #0x0]
    str r0, [sp, #0xc]
    movs r0, r1, asr #0x1f
    beq L_021fe1fc
    cmp r4, #0x0
    beq L_021fe1e0
    ldr r0, [r5, #0x10]
    bl func_020939d8
L_021fe1e0:
    add r0, r5, #0xc4
    bl func_ov032_021fe0c4
    ldr r0, [r5, #0xc4]
    mov r1, #0x0
    bl func_02072bdc
    mov r0, #0x1
    b L_021fe234
L_021fe1fc:
    ldr r0, [r5, #0x10]
    ldr r1, [r0, #0x38]
    mov r0, r1, lsl #0x1e
    movs r0, r0, asr #0x1f
    str r1, [sp, #0x8]
    add r0, r5, #0xc4
    beq L_021fe22c
    bl func_ov032_021fe0c4
    ldr r0, [r5, #0xc4]
    mov r1, #0x0
    bl func_02072bdc
    b L_021fe230
L_021fe22c:
    bl func_ov032_021fe0e8
L_021fe230:
    mov r0, #0x0
L_021fe234:
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov032_021fe134, .-func_ov032_021fe134

