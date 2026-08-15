.text

/* Exact fallback; see src/overlays/ov035/overlay035_quinary_effect_helpers.c for documented portable C. */

    .extern func_ov035_021fd4dc
    .extern Sound_Play
    .extern Presentation_InterpolateLinear
    .extern func_02091b98
    .extern Presentation_SetScript
    .extern Heap_Alloc
    .extern func_ov035_021fcf34
    .extern PresentationList_Append
    .extern PresentationScalar_SetImmediate
    .extern Presentation_SetPosition
    .extern func_ov035_021fd51c
    .extern gSoundContext
    .extern data_ov035_02202bd4
    .extern data_ov035_02202ca4
    .extern data_ov035_02203d48
    .extern data_020c9670
    .extern gHeapContext

    .global func_ov035_022011a8
func_ov035_022011a8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x170]
    bl func_ov035_021fd4dc
    ldr r0, L_02201290
    ldr r1, L_02201294
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r5, #0xf4]
    ldr r3, [r5, #0x134]
    ldr r1, [r0, #0x20]
    mov r0, #0x1e
    ldr r2, [r1, #0x4]
    mov r1, #0x10
    bl Presentation_InterpolateLinear
    mov r1, r0
    add r0, r5, #0x138
    bl func_02091b98
    ldr r0, [r5, #0x104]
    ldr r1, L_02201298
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r0, [r5, #0x100]
    ldr r1, L_0220129c
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r1, L_022012a0
    ldr r3, L_022012a4
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_02201244
    ldr r1, [r5, #0xf4]
    ldr r2, [r5, #0x134]
    mov r3, #0xb
    bl func_ov035_021fcf34
    mov r4, r0
L_02201244:
    mov r1, r4
    add r0, r5, #0x128
    bl PresentationList_Append
    ldr r1, L_022012a8
    add r0, r4, #0x6c
    bl PresentationScalar_SetImmediate
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x500
    mov r3, #0x400
    bl Presentation_SetPosition
    ldr r1, [r5, #0xf4]
    ldr r0, [r5, #0x134]
    ldr r1, [r1, #0x20]
    ldr r1, [r1, #0x4]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02201290: .word gSoundContext
L_02201294: .word 0x1ca
L_02201298: .word data_ov035_02202bd4
L_0220129c: .word data_ov035_02202ca4
L_022012a0: .word data_ov035_02203d48
L_022012a4: .word gHeapContext
L_022012a8: .word 0x666
    .size func_ov035_022011a8, .-func_ov035_022011a8

    .global func_ov035_022012ac
func_ov035_022012ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r6, [r0, #0x104]
    mov r9, #0x38
    ldr r1, [r6, #0x60]
    ldr r3, L_0220135c
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x1
    add r1, r2, #0x1
    mov r1, r1, lsl #0x1
    ldrsh lr, [r3, r1]
    sub r1, r9, #0x50
    mov r4, r2, lsl #0x1
    mul r2, lr, r1
    ldrsh r5, [r3, r4]
    mov r1, #0x60
    sub r8, r9, #0x50
    smulbb r3, r5, r1
    mla ip, r5, r9, r2
    add r4, r3, lr, lsl #0x5
    mov r7, r4, asr #0x7
    smulbb r1, lr, r1
    sub r3, r1, r5, lsl #0x5
    mov r1, ip, asr #0x7
    mov r2, r3, asr #0x7
    mul r8, r5, r8
    smulbb r5, lr, r9
    sub lr, r5, r8
    mov r8, lr, asr #0x7
    ldr r5, [r6, #0x20]
    add r7, r4, r7, lsr #0x18
    add r9, ip, r1, lsr #0x18
    ldr r4, [r6, #0x10]
    add r1, r5, r7, asr #0x8
    str r1, [sp, #0x0]
    add r1, lr, r8, lsr #0x18
    add r3, r3, r2, lsr #0x18
    ldr r0, [r0, #0x170]
    add r1, r4, r1, asr #0x8
    add r2, r5, r9, asr #0x8
    add r3, r4, r3, asr #0x8
    bl func_ov035_021fd51c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_0220135c: .word data_020c9670
    .size func_ov035_022012ac, .-func_ov035_022012ac

