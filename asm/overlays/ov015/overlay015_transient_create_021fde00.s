    .text
    .extern Heap_Alloc
    .extern data_ov015_021fec98
    .extern func_02070e0c
    .extern func_02092790
    .extern func_020959d4
    .extern func_02095c30
    .extern func_02095f48
    .extern gHeapContext

/* Exact fallback for transient presentation creation; see src/overlays/ov015/overlay015_selection_runtime.c. */
    .global func_ov015_021fde00

func_ov015_021fde00:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r3
    cmp r2, #0x0
    add r0, r6, #0x98
    bne L_021fde34
    mov r1, #0x0
    bl func_02092790
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070e0c
    b L_021fde48
L_021fde34:
    mov r1, #0x1
    bl func_02092790
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070e0c
L_021fde48:
    ldr r1, L_021fdea4
    ldr r3, L_021fdea8
    mov r0, #0x2d0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fde70
    mov r1, #0x0
    mov r2, r1
    bl func_020959d4
L_021fde70:
    str r0, [r6, #0xf8]
    cmp r4, #0x0
    beq L_021fde88
    ldr r0, [r6, #0xf8]
    mov r1, r4
    bl func_02095f48
L_021fde88:
    ldr r0, [r6, #0xf8]
    mov r1, r5
    bl func_02095c30
    ldr r0, [r6, #0x48]
    orr r0, r0, #0x2
    str r0, [r6, #0x48]
    ldmia sp!, {r4, r5, r6, pc}
L_021fdea4: .word data_ov015_021fec98
L_021fdea8: .word gHeapContext

    .size func_ov015_021fde00, . - func_ov015_021fde00
