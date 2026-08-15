.text

/* Exact fallback; see src/overlays/ov034/overlay034_owner_lifecycle.c for documented portable C. */

    .extern Presentation_Init
    .extern func_02071adc
    .extern func_0201e0ec
    .extern Heap_Alloc
    .extern func_ov034_021fcff0
    .extern PresentationScalar_SetImmediate
    .extern data_ov034_021ff194
    .extern data_020f4e18
    .extern data_021052fc
    .extern data_ov034_021ff1a8
    .extern gHeapContext

    .global func_ov034_021fd544
func_ov034_021fd544:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r9, r0
    bl Presentation_Init
    ldr r1, L_021fd61c
    ldr r0, L_021fd620
    str r1, [r9, #0x0]
    ldr r0, [r0, #0x0]
    ldr r1, L_021fd624
    bl func_02071adc
    ldr r1, L_021fd628
    str r0, [r9, #0x9c]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    ldr r1, [r0, #0x35c]
    ldr r6, L_021fd62c
    str r1, [r9, #0xac]
    ldr r1, [r0, #0x434]
    ldr r4, L_021fd630
    str r1, [r9, #0xb0]
    ldr r1, [r0, #0xd4]
    mov r8, #0x0
    str r1, [r9, #0xb4]
    ldr r1, [r0, #0x1ac]
    mov r10, #0x1800
    str r1, [r9, #0xb8]
    ldr r0, [r0, #0x284]
    mov r7, #0x2c
    str r0, [r9, #0xbc]
    mov r5, #0x4
L_021fd5c0:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd5e4
    mov r1, r8
    bl func_ov034_021fcff0
L_021fd5e4:
    add r1, r9, r8, lsl #0x2
    add r8, r8, #0x1
    str r0, [r1, #0xa0]
    str r10, [r0, #0x1c]
    cmp r8, #0x3
    blt L_021fd5c0
    add r0, r9, #0x6c
    mov r1, #0x0
    bl PresentationScalar_SetImmediate
    mov r1, #0x0
    str r1, [r9, #0xc4]
    mov r0, r9
    str r1, [r9, #0xc0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fd61c: .word data_ov034_021ff194
L_021fd620: .word data_020f4e18
L_021fd624: .word 0x5001
L_021fd628: .word data_021052fc
L_021fd62c: .word data_ov034_021ff1a8
L_021fd630: .word gHeapContext
.size func_ov034_021fd544, .-func_ov034_021fd544
