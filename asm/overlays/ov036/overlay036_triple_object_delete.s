.text

/* Exact fallback; see src/overlays/ov036/overlay036_triple_object_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern func_ov036_0220384c
    .extern func_ov036_021fcf30
    .extern Heap_Free
    .extern data_ov036_02205f64
    .extern data_ov036_02205eac

    .global func_ov036_022039e8
func_ov036_022039e8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_02203a30
    add r0, r4, #0x9c
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0xb4
    bl func_ov036_0220384c
    ldr r1, L_02203a34
    add r0, r4, #0x9c
    str r1, [r4, #0x9c]
    bl func_02095308
    mov r0, r4
    bl func_ov036_021fcf30
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02203a30: .word data_ov036_02205f64
L_02203a34: .word data_ov036_02205eac
    .size func_ov036_022039e8, .-func_ov036_022039e8

