.text

/* Exact fallback; see src/overlays/ov036/overlay036_oscillating_object_lifecycle.c for documented portable C. */

    .extern func_02077220
    .extern func_ov036_021fcf30
    .extern Heap_Free
    .extern data_ov036_0220600c

    .global func_ov036_02201e1c
func_ov036_02201e1c:
    stmdb sp!, {r4, lr}
    ldr r1, L_02201e4c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xd4]
    bl func_02077220
    mov r0, r4
    bl func_ov036_021fcf30
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02201e4c: .word data_ov036_0220600c
    .size func_ov036_02201e1c, .-func_ov036_02201e1c

