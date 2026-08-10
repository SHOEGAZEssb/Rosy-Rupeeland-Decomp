    .text
/* Exact fallback; see src/overlays/ov018/overlay018_coordinate_helpers.c. */
    .extern GamePhaseMetadata_GetByIndex
.global func_ov018_021fe184
func_ov018_021fe184:
    cmp r1, r0
    ldrne r2, [r1, #0x4]
    strne r2, [r0, #0x4]
    ldrne r1, [r1, #0x8]
    strne r1, [r0, #0x8]
    bx lr
    .size func_ov018_021fe184, . - func_ov018_021fe184

    .global func_ov018_021fe19c
func_ov018_021fe19c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldrsh r1, [r4, #0x2]
    mov r5, r0
    sub r0, r1, #0x1
    bl GamePhaseMetadata_GetByIndex
    ldrsb r2, [r0, #0x4e]
    ldr r1, [r5, #0x1a0]
    mov r0, #0x3c0
    sub r1, r2, r1
    mul r0, r1, r0
    ldrsh r1, [r4, #0xc]
    add r0, r0, r0, lsr #0x1f
    add r0, r1, r0, asr #0x1
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov018_021fe19c, . - func_ov018_021fe19c

    .global func_ov018_021fe1d8
func_ov018_021fe1d8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldrsh r1, [r4, #0x2]
    mov r5, r0
    sub r0, r1, #0x1
    bl GamePhaseMetadata_GetByIndex
    ldrsb r2, [r0, #0x4f]
    ldr r1, [r5, #0x1a4]
    mov r0, #0x2c0
    sub r1, r2, r1
    mul r0, r1, r0
    ldrsh r1, [r4, #0xe]
    add r0, r0, r0, lsr #0x1f
    add r0, r1, r0, asr #0x1
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov018_021fe1d8, . - func_ov018_021fe1d8
