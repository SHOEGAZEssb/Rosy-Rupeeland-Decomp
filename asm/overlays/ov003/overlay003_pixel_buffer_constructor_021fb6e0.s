    .text
    .extern data_ov003_021fbcd0
    .extern gHeapContext
    .extern Heap_AllocCore
    .extern MIi_CpuClearFast
    .extern genrand_int32
    .extern func_020bf1f8
    .extern data_ov003_021fbb40
    .extern func_ov003_021fb7c0
    .global func_ov003_021fb6e0
func_ov003_021fb6e0: ; 0x021fb6e0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    ldr r1, L_021fb7b4
    mov r10, r0
    ldr r3, L_021fb7b8
    mov r0, #0x6000
    mov r2, #0x20
    bl Heap_AllocCore
    str r0, [r10, #0x0]
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x6000
    bl MIi_CpuClearFast
    mov r3, #0x0
L_021fb718:
    mov r2, r3, lsl #0x1
    orr r1, r2, r2, lsl #0x5
    add r0, r10, r3, lsl #0x1
    orr r1, r1, r2, lsl #0xa
    add r3, r3, #0x1
    strh r1, [r0, #0x4]
    cmp r3, #0x10
    blt L_021fb718
    mov r6, #0x32
    ldr r4, L_021fb7bc
    mov r7, #0x0
    add r11, sp, #0x0
    mov r5, r6
L_021fb74c:
    bl genrand_int32
    mov r1, r6
    bl func_020bf1f8
    mov r9, r1
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    cmp r9, r1
    beq L_021fb79c
    add r0, r4, r9, lsl #0x3
    add r8, r4, r1, lsl #0x3
    ldr r3, [r4, r9, lsl #0x3]
    ldr r2, [r0, #0x4]
    mov r1, r8
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    bl func_ov003_021fb7c0
    mov r0, r8
    mov r1, r11
    bl func_ov003_021fb7c0
L_021fb79c:
    add r7, r7, #0x1
    cmp r7, #0x64
    blt L_021fb74c
    mov r0, r10
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fb7b4: .word data_ov003_021fbcd0
L_021fb7b8: .word gHeapContext
L_021fb7bc: .word data_ov003_021fbb40
    .size func_ov003_021fb6e0, .-func_ov003_021fb6e0

