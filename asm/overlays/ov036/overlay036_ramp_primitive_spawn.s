.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_primitive_spawn.c for documented portable C. */

    .extern func_0209189c
    .extern data_020c9670
    .extern Heap_Alloc
    .extern func_ov036_021fd690
    .extern Presentation_SetPosition
    .extern func_02094bf0
    .extern PresentationScalar_TransitionBy
    .extern PresentationScalar_TransitionTo
    .extern PresentationList_Append
    .extern data_ov036_02206180
    .extern gHeapContext

    .global func_ov036_02201580
func_ov036_02201580:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r9, r1
    mov r1, #0x1000
    ldr r4, [r10, #0x178]
    add r0, r10, #0xc0
    rsb r1, r1, #0x0
    mov r2, #0x1000
    bl func_0209189c
    mul r1, r0, r4
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r4, r0, asr #0xc
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_02201700
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r8, [r2, r0]
    mov r3, #0x2800
    ldrsh r1, [r2, r1]
    mov r6, #0x0
    umull lr, ip, r8, r3
    umull r0, r2, r1, r3
    adds r0, r0, #0x800
    mov r5, r0, lsr #0xc
    mla r2, r1, r6, r2
    mov r0, r1, asr #0x1f
    mla r2, r0, r3, r2
    adc r0, r2, #0x0
    mla ip, r8, r6, ip
    mov r7, r8, asr #0x1f
    mov r2, #0x800
    adds r6, lr, #0x800
    mla ip, r7, r3, ip
    orr r5, r5, r0, lsl #0x14
    add r0, r10, #0xc0
    sub r1, r2, #0x1000
    adc r3, ip, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r3, lsl #0x14
    bl func_0209189c
    mov r7, r0
    ldr r1, L_02201704
    ldr r3, L_02201708
    mov r0, #0xa8
    mov r2, #0x4
    bl Heap_Alloc
    movs r8, r0
    beq L_0220167c
    ldr r1, L_0220170c
    mov r2, #0x0
    mov r3, r2
    str r1, [sp, #0x0]
    mov r8, #0x18
    mov r1, #0x1
    str r8, [sp, #0x4]
    bl func_ov036_021fd690
    mov r8, r0
L_0220167c:
    mov r2, #0x600
    mov r0, r8
    mov r1, r7
    rsb r2, r2, #0x0
    mov r3, #0x0
    bl Presentation_SetPosition
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    rsb r3, r4, #0x0
    bl func_02094bf0
    mov r2, r5
    add r0, r8, #0xc
    mov r1, #0x1
    bl PresentationScalar_TransitionBy
    mov r2, r6
    add r0, r8, #0x1c
    mov r1, #0x1
    bl PresentationScalar_TransitionBy
    add r0, r8, #0x2c
    mov r1, #0x1
    mvn r2, #0xff
    bl PresentationScalar_TransitionTo
    mov r0, r9, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r8, #0x7c]
    add r0, r10, #0x158
    mov r1, #0x0
    str r1, [r8, #0x80]
    mov r1, r8
    bl PresentationList_Append
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_02201700: .word data_020c9670
L_02201704: .word data_ov036_02206180
L_02201708: .word gHeapContext
L_0220170c: .word 0x21f
    .size func_ov036_02201580, .-func_ov036_02201580

