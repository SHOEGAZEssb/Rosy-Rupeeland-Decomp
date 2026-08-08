.text

/* Exact fallback; see src/overlays/ov031/overlay031_wave_effect.c for documented portable C. */
.extern data_020c9670
.extern data_ov031_021fe5fc
.extern func_02091a70
.extern func_020befec
.extern genrand_int32


    .global func_ov031_021fce98
func_ov031_021fce98:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x1c
    ldr r3, L_021fd14c
    add r2, sp, #0x14
    mov r7, r0
    mov r1, #0x5
L_021fceb0:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_021fceb0
    ldr r3, [r7, #0x484]
    add r2, r7, #0x300
    mov r1, #0xc0
    mla r5, r3, r1, r2
    mov r0, #0x180
    mla r4, r3, r0, r7
    mov r0, #0x100
    ldr r2, [r7, #0x4a0]
    ldr r1, [r7, #0x49c]
    str r0, [sp, #0x10]
    cmp r2, r1
    addlt r0, r2, #0x1
    strlt r0, [r7, #0x4a0]
    ldr r0, [r7, #0x480]
    cmp r0, #0x1
    beq L_021fcf0c
    cmp r0, #0x2
    beq L_021fcf28
    b L_021fcf40
L_021fcf0c:
    ldr r2, [r7, #0x49c]
    ldr r3, [r7, #0x4a0]
    mov r0, #0x0
    mov r1, #0x100
    bl func_02091a70
    str r0, [sp, #0x10]
    b L_021fcf40
L_021fcf28:
    ldr r2, [r7, #0x49c]
    ldr r3, [r7, #0x4a0]
    mov r0, #0x100
    mov r1, #0x0
    bl func_02091a70
    str r0, [sp, #0x10]
L_021fcf40:
    bl genrand_int32
    ldr r1, L_021fd150
    mov r2, #0xa
    and r1, r0, r1
    mul r0, r1, r2
    str r0, [sp, #0x8]
    bl genrand_int32
    ldr r2, L_021fd150
    ldr r1, [sp, #0x8]
    and r0, r0, r2
    add r0, r0, r0, lsl #0x2
    mov r1, r1, asr #0x1f
    str r0, [sp, #0x0]
    mov r0, r0, asr #0x1f
    str r1, [sp, #0xc]
    str r0, [sp, #0x4]
    mov r6, #0x0
L_021fcf84:
    ldr r1, [r7, #0x48c]
    ldr r0, L_021fd154
    ldr r2, [r7, #0x488]
    mla r0, r6, r0, r1
    ldr r1, L_021fd158
    mov r0, r0, lsl #0x10
    mla r1, r6, r1, r2
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, L_021fd15c
    ldr r9, [sp, #0x8]
    ldrsh ip, [r1, r2]
    ldr r10, [sp, #0xc]
    mov r0, r0, lsr #0x10
    umull r9, lr, ip, r9
    mla lr, ip, r10, lr
    mov r0, r0, asr #0x4
    adds r9, r9, #0x800
    mov r1, r0, lsl #0x2
    ldr r0, L_021fd15c
    ldr r10, [sp, #0x8]
    ldrsh r2, [r0, r1]
    mov r3, ip, asr #0x1f
    mla lr, r3, r10, lr
    adc r3, lr, #0x0
    mov r9, r9, lsr #0xc
    orr r9, r9, r3, lsl #0x14
    mov r3, r9, asr #0xc
    mov r8, r6, lsl #0x1
    strh r3, [r4, r8]
    ldr r3, [sp, #0x0]
    ldr r9, [sp, #0x4]
    umull ip, r3, r2, r3
    mla r3, r2, r9, r3
    mov r0, r2, asr #0x1f
    ldr r2, [sp, #0x0]
    ldrsh lr, [r4, r8]
    mla r3, r0, r2, r3
    mov r0, #0x800
    adds r2, ip, r0
    mov r0, #0x0
    adc r0, r3, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r0, lr, r2, asr #0xc
    strh r0, [r4, r8]
    ldr r0, [r7, #0x490]
    mov r1, #0x5
    add r0, r6, r0
    bl func_020befec
    add r0, sp, #0x14
    ldrsb r0, [r0, r1]
    strb r0, [r5, r6]
    add r6, r6, #0x1
    cmp r6, #0xc0
    blt L_021fcf84
    ldr r0, [r7, #0x494]
    mov r1, #0xe6
    mov r0, r0, asr #0x1
    bl func_020befec
    sub r1, r1, #0x20
    mov r2, #0x0
L_021fd084:
    cmp r1, #0x0
    blt L_021fd09c
    cmp r1, #0xc0
    ldrltsb r0, [r5, r1]
    sublt r0, r0, #0x3
    strltb r0, [r5, r1]
L_021fd09c:
    add r2, r2, #0x1
    cmp r2, #0x20
    add r1, r1, #0x1
    blt L_021fd084
    ldr r2, [r7, #0x498]
    cmp r2, #0xc0
    movlt r0, #0xa
    addlt r1, r2, #0x1
    strltb r0, [r5, r2]
    cmplt r1, #0xc0
    movlt r0, #0xe
    strltb r0, [r5, r1]
    mov r2, #0x0
L_021fd0d0:
    ldrsb r0, [r5, r2]
    add r1, r0, #0x10
    ldr r0, [sp, #0x10]
    mul r1, r0, r1
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r0, r0, asr #0x8
    sub r0, r0, #0x10
    strb r0, [r5, r2]
    add r2, r2, #0x1
    cmp r2, #0xc0
    blt L_021fd0d0
    ldr r0, [r7, #0x488]
    mov r1, #0xfa
    sub r0, r0, #0x12c
    str r0, [r7, #0x488]
    ldr r0, [r7, #0x48c]
    add r0, r0, #0x2bc
    str r0, [r7, #0x48c]
    ldr r0, [r7, #0x490]
    add r0, r0, #0x1
    str r0, [r7, #0x490]
    ldr r0, [r7, #0x494]
    add r0, r0, #0x1
    str r0, [r7, #0x494]
    ldr r0, [r7, #0x498]
    add r0, r0, #0x1
    bl func_020befec
    str r1, [r7, #0x498]
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_021fd14c: .word data_ov031_021fe5fc
L_021fd150: .word 0xfff
L_021fd154: .word 0x1414
L_021fd158: .word 0x5dc
L_021fd15c: .word data_020c9670
.size func_ov031_021fce98, .-func_ov031_021fce98
    .global func_ov031_021fd160
func_ov031_021fd160:
    ldr r3, [r0, #0x484]
    mov r2, #0x180
    rsb r3, r3, #0x1
    mla r0, r3, r2, r0
    mov r1, r1, lsl #0x1
    ldrsh r0, [r1, r0]
    bx lr
.size func_ov031_021fd160, .-func_ov031_021fd160
    .global func_ov031_021fd17c
func_ov031_021fd17c:
    ldr r3, [r0, #0x484]
    mov r2, #0xc0
    rsb r3, r3, #0x1
    mla r0, r3, r2, r0
    add r0, r0, r1
    add r0, r0, #0x300
    ldrsb r0, [r0, #0x0]
    bx lr
.size func_ov031_021fd17c, .-func_ov031_021fd17c
