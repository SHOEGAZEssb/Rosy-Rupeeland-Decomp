    .text
/* Exact fallback; see src/overlays/ov018/overlay018_result_text.c. */
    .extern data_021f3ecc
    .extern data_ov018_021ffce0
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern func_02076148
    .extern func_020761f8
    .extern func_020791e0
    .extern func_0207c460
    .extern func_ov018_021fe1d8
    .extern gDebugFont

.global func_ov018_021fe46c
func_ov018_021fe46c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x1c
    mov r5, r0
    ldr r1, [r5, #0x194]
    mov r4, #0x90
    bl func_ov018_021fe1d8
    ldr r1, [r5, #0x60]
    ldr r3, L_021fe598
    sub r0, r0, r1
    cmp r0, #0x80
    ldr r0, [r5, #0x194]
    mov r2, #0x0
    ldrh r1, [r0, #0x1a]
    add r0, sp, #0xc
    movgt r4, #0x10
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    str r2, [sp, #0x14]
    str r2, [sp, #0x18]
    bl func_0207c460
    ldr r0, L_021fe59c
    ldr r1, [r5, #0x70]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, L_021fe59c
    ldr r1, [sp, #0x10]
    mov r2, #0x8
    ldr r0, [r0, #0x0]
    add r1, r1, #0x2c
    sub r3, r2, #0xa
    bl func_020761f8
    mov r1, #0xd
    add r0, r0, r0, lsr #0x1f
    str r1, [sp, #0x0]
    mov r1, #0x8
    mov r0, r0, asr #0x1
    str r1, [sp, #0x4]
    sub r1, r1, #0xa
    rsb r2, r0, #0x80
    str r1, [sp, #0x8]
    ldr r0, L_021fe59c
    ldr r1, [sp, #0x10]
    ldr r0, [r0, #0x0]
    add r1, r1, #0x2c
    mov r3, r4
    bl func_02076148
    ldr r0, L_021fe5a0
    ldr r1, L_021fe5a4
    bl func_020791e0
    mov r1, r0
    ldr r0, L_021fe59c
    mov r2, #0x8
    ldr r0, [r0, #0x0]
    sub r3, r2, #0xa
    bl func_020761f8
    mov r5, r0
    ldr r0, L_021fe5a0
    ldr r1, L_021fe5a4
    bl func_020791e0
    add r1, r5, r5, lsr #0x1f
    mov r1, r1, asr #0x1
    rsb r2, r1, #0x80
    mov r1, r0
    mov r0, #0xb
    str r0, [sp, #0x0]
    mov r0, #0x8
    str r0, [sp, #0x4]
    sub r0, r0, #0xa
    str r0, [sp, #0x8]
    ldr r0, L_021fe59c
    add r3, r4, #0x14
    ldr r0, [r0, #0x0]
    bl func_02076148
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, pc}
L_021fe598: .word data_ov018_021ffce0
L_021fe59c: .word gDebugFont
L_021fe5a0: .word data_021f3ecc
L_021fe5a4: .word 0x2f6
    .size func_ov018_021fe46c, . - func_ov018_021fe46c
