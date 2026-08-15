.text

/* Exact fallback; see src/overlays/ov036/overlay036_multi_effect_emitter.c for documented portable C. */

    .extern func_ov036_021fd28c
    .extern func_0209189c
    .extern func_ov036_021ff778
    .extern func_020918f4
    .extern Heap_Alloc
    .extern func_ov036_021fd2a4
    .extern Presentation_SetPosition
    .extern PresentationScalar_SetImmediate
    .extern PresentationList_Append
    .extern data_020c9670
    .extern data_ov036_02206148
    .extern gHeapContext

    .global func_ov036_021ff7cc
func_ov036_021ff7cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldr r0, [r9, #0xf8]
    mov r7, r1
    bl func_ov036_021fd28c
    cmp r0, #0x0
    beq L_021ff858
    rsb r4, r7, #0x0
    mov r1, r4
    mov r2, r7
    add r0, r9, #0xc0
    bl func_0209189c
    mov r6, r0
    mov r1, r4
    mov r2, r7
    add r0, r9, #0xc0
    bl func_0209189c
    mov r5, r0
    mov r1, r4
    mov r2, r7
    add r0, r9, #0xc0
    bl func_0209189c
    mov r4, r0
    add r0, r9, #0xc0
    mov r1, #0x2
    mov r2, #0x4
    bl func_0209189c
    str r4, [sp, #0x0]
    mov r2, r6
    mov r3, r5
    str r0, [sp, #0x4]
    mov r0, r9
    ldr r1, [r9, #0xf8]
    bl func_ov036_021ff778
L_021ff858:
    add r0, r9, #0xc0
    mov r1, #0x1000
    bl func_020918f4
    mov r4, r0, lsl #0x4
    add r0, r9, #0xc0
    mov r1, #0x600
    mov r2, #0xc00
    bl func_0209189c
    mov r3, r4, asr #0x3
    add r1, r3, #0x1
    ldr r2, L_021ff9b8
    mov r3, r3, lsl #0x1
    ldrsh r3, [r2, r3]
    mov r1, r1, lsl #0x1
    ldrsh r2, [r2, r1]
    mul r3, r0, r3
    mul r4, r0, r2
    mov r0, r3, asr #0xb
    add r3, r3, r0, lsr #0x14
    mov r2, r4, asr #0xb
    add r4, r4, r2, lsr #0x14
    mov r1, #0x10
    add r0, r9, #0xc0
    mov r2, #0x1f
    mov r6, r3, asr #0xc
    mov r7, r4, asr #0xc
    bl func_0209189c
    mov r5, r0
    add r0, r9, #0xc0
    mov r1, #0x10
    mov r2, #0x1f
    bl func_0209189c
    mov r4, r0
    ldr r1, L_021ff9bc
    ldr r3, L_021ff9c0
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    movs r8, r0
    beq L_021ff96c
    add r0, r9, #0xc0
    mov r1, #0x14
    mov r2, #0x1e
    bl func_0209189c
    mov r10, r0
    ldr r1, L_021ff9c4
    ldr r2, L_021ff9c8
    add r0, r9, #0xc0
    bl func_0209189c
    mov r1, r10, lsl #0x10
    mov r2, r1, asr #0x10
    orr r1, r5, r4, lsl #0x5
    add r3, r5, r5, lsr #0x1f
    add r4, r4, r4, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp, #0x0]
    mov r1, r4, asr #0x1
    mov r1, r1, lsl #0x5
    orr r1, r1, r3, asr #0x1
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r0, r8
    mov r1, #0x1
    bl func_ov036_021fd2a4
    mov r8, r0
L_021ff96c:
    mov r0, r8
    mov r1, r6
    mov r3, r7
    mov r2, #0x0
    bl Presentation_SetPosition
    add r0, r9, #0xc0
    mov r1, #0x1000
    bl func_020918f4
    mov r1, r0, lsl #0x4
    add r0, r8, #0x5c
    bl PresentationScalar_SetImmediate
    ldr r1, L_021ff9cc
    add r0, r8, #0x6c
    bl PresentationScalar_SetImmediate
    mov r1, r8
    add r0, r9, #0x128
    bl PresentationList_Append
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_021ff9b8: .word data_020c9670
L_021ff9bc: .word data_ov036_02206148
L_021ff9c0: .word gHeapContext
L_021ff9c4: .word 0x666
L_021ff9c8: .word 0xccd
L_021ff9cc: .word 0x333
    .size func_ov036_021ff7cc, .-func_ov036_021ff7cc

