    .text
/* Exact fallback; see src/overlays/ov022/overlay022_selection_effect.c. */
    .extern data_020f4e14
    .extern data_ov022_022006fc
    .extern func_ov046_0220b7bc
    .extern func_ov046_0220bffc
    .extern func_ov046_0220c478
    .extern gHeapContext
    .extern Heap_Alloc

.global func_ov022_021fe898
func_ov022_021fe898:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe910
    mov r5, r0
    ldr r3, L_021fe914
    mov r0, #0x118
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe8cc
    ldr r1, L_021fe918
    mov r2, #0x2
    ldr r1, [r1, #0x0]
    bl func_ov046_0220b7bc
L_021fe8cc:
    str r0, [r5, #0x35c]
    ldr r1, [r5, #0x2b4]
    mov r2, #0x0
    ldr r3, [r1, #0x38]
    ldr r1, [r1, #0xc]
    ldr r1, [r3, r1, lsl #0x3]
    mov r3, r2
    ldrsh r4, [r1, #0x0]
    mov r1, r4
    bl func_ov046_0220bffc
    ldr r0, [r5, #0x35c]
    mov r1, r4
    bl func_ov046_0220c478
    ldr r0, L_021fe91c
    mov r1, #0x0
    strh r1, [r0, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
L_021fe910: .word data_ov022_022006fc
L_021fe914: .word gHeapContext
L_021fe918: .word data_020f4e14
L_021fe91c: .word 0x4000050
.size func_ov022_021fe898, . - func_ov022_021fe898
