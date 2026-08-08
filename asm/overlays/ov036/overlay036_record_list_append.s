.text

/* Exact fallback; see src/overlays/ov036/overlay036_record_list.c for documented portable C. */

    .extern Heap_Alloc
    .extern func_ov036_021fdba0
    .extern data_ov036_02206138
    .extern gHeapContext

    .global func_ov036_021fdc5c
func_ov036_021fdc5c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r1
    mov r5, r3
    mov r4, r0
    mov r6, r2
    ldr r1, L_021fdce4
    ldr r3, L_021fdce8
    mov r0, #0x34
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdcb4
    ldr r1, [sp, #0x20]
    str r5, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r1, [r4, #0xc]
    mov r2, r7
    str r1, [sp, #0x8]
    ldr r1, [r4, #0x10]
    mov r3, r6
    bl func_ov036_021fdba0
L_021fdcb4:
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    streq r0, [r4, #0x4]
    streq r0, [r4, #0x0]
    ldrne r1, [r4, #0x4]
    strne r0, [r1, #0x0]
    strne r0, [r4, #0x4]
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021fdce4: .word data_ov036_02206138
L_021fdce8: .word gHeapContext
    .size func_ov036_021fdc5c, .-func_ov036_021fdc5c
