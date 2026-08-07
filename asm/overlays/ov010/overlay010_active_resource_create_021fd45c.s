    .text
    .extern Heap_Alloc
    .extern data_020f4e18
    .extern data_ov010_021fec8c
    .extern func_020720e8
    .extern func_02077308
    .extern func_02077ca0
    .extern gHeapContext

/* Exact fallback; see src/overlays/ov010/overlay010_active_resource_create.c. */
    .global func_ov010_021fd45c
func_ov010_021fd45c: ; 0x021fd45c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x0
    str r0, [r5, #0x144]
    str r0, [r5, #0x148]
    ldr r0, [r5, #0x14c]
    add r0, r5, r0, lsl #0x2
    ldr r1, [r0, #0x90]
    ldr r0, [r0, #0x13c]
    add r4, r1, r0, lsl #0x5
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    beq L_021fd4c4
    ldr r0, L_021fd514
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0x7c
    ldmia r4, {r2, r3}
    bl func_020720e8
    ldr r0, [r5, #0x88]
    add r1, r5, #0x7c
    bl func_02077308
    str r0, [r5, #0x8c]
    mov r1, #0x3
    strb r1, [r0, #0x59]
    ldmia sp!, {r3, r4, r5, pc}
L_021fd4c4:
    ldr r1, L_021fd518
    ldr r3, L_021fd51c
    mov r0, #0x18
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd50c
    ldr r1, [r4, #0x4]
    ldr r2, L_021fd514
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp, #0x0]
    ldr r3, [r4, #0x0]
    ldr r1, [r2, #0x0]
    mov r3, r3, lsl #0x10
    ldr r2, [r5, #0x78]
    mov r3, r3, lsr #0x10
    bl func_02077ca0
L_021fd50c:
    str r0, [r5, #0x12c]
    ldmia sp!, {r3, r4, r5, pc}
L_021fd514: .word data_020f4e18
L_021fd518: .word data_ov010_021fec8c
L_021fd51c: .word gHeapContext

    .size func_ov010_021fd45c, . - func_ov010_021fd45c
