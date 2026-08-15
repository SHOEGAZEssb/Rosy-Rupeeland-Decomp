.text

/* Exact fallback; see src/overlays/ov036/overlay036_triple_object_lifecycle.c for documented portable C. */

    .extern Presentation_Init
    .extern func_ov036_021fe218
    .extern Presentation_InitVariant
    .extern Heap_Alloc
    .extern func_ov036_021fcf34
    .extern PresentationScalar_SetImmediate
    .extern PresentationList_Append
    .extern Presentation_SetPosition
    .extern data_ov036_02205f64
    .extern data_ov036_02206168
    .extern gHeapContext

    .global func_ov036_02203850
func_ov036_02203850:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Presentation_Init
    ldr r1, L_02203994
    add r0, r5, #0x9c
    str r1, [r5, #0x0]
    bl func_ov036_021fe218
    add r0, r5, #0xb4
    bl Presentation_InitVariant
    mov r0, #0xc4
    ldr r1, L_02203998
    mov r2, #0x4
    ldr r3, L_0220399c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022038a4
    mov r1, r4
    mov r2, #0x0
    mov r3, #0xa
    bl func_ov036_021fcf34
L_022038a4:
    str r0, [r5, #0x150]
    add r0, r0, #0x6c
    mov r1, #0x400
    bl PresentationScalar_SetImmediate
    ldr r1, [r5, #0x150]
    add r0, r5, #0x9c
    bl PresentationList_Append
    ldr r1, L_02203998
    ldr r3, L_0220399c
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022038ec
    mov r1, r4
    mov r2, #0x1
    mov r3, #0xa
    bl func_ov036_021fcf34
L_022038ec:
    mov r2, #0x0
    str r0, [r5, #0x154]
    mov r3, r2
    mov r1, #0x400
    bl Presentation_SetPosition
    ldr r0, [r5, #0x154]
    mov r1, #0x400
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r1, [r5, #0x154]
    add r0, r5, #0x9c
    bl PresentationList_Append
    ldr r1, L_02203998
    ldr r3, L_0220399c
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02203948
    mov r1, r4
    mov r2, #0x2
    mov r3, #0xa
    bl func_ov036_021fcf34
L_02203948:
    mov r1, #0x400
    mov r2, #0x0
    str r0, [r5, #0x158]
    mov r3, r2
    rsb r1, r1, #0x0
    bl Presentation_SetPosition
    ldr r0, [r5, #0x158]
    mov r1, #0x400
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r1, [r5, #0x158]
    add r0, r5, #0x9c
    bl PresentationList_Append
    mov r0, #0x1
    str r0, [r5, #0xac]
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0xb0]
    ldmia sp!, {r3, r4, r5, pc}
L_02203994: .word data_ov036_02205f64
L_02203998: .word data_ov036_02206168
L_0220399c: .word gHeapContext
    .size func_ov036_02203850, .-func_ov036_02203850

