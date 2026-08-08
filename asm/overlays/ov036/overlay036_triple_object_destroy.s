.text

/* Exact fallback; see src/overlays/ov036/overlay036_triple_object_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern func_ov036_0220384c
    .extern func_ov036_021fcf30
    .extern data_ov036_02205f64
    .extern data_ov036_02205eac

    .global func_ov036_022039a0
func_ov036_022039a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_022039e0
    add r0, r4, #0x9c
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0xb4
    bl func_ov036_0220384c
    ldr r1, L_022039e4
    add r0, r4, #0x9c
    str r1, [r4, #0x9c]
    bl func_02095308
    mov r0, r4
    bl func_ov036_021fcf30
    mov r0, r4
    ldmia sp!, {r4, pc}
L_022039e0: .word data_ov036_02205f64
L_022039e4: .word data_ov036_02205eac
    .size func_ov036_022039a0, .-func_ov036_022039a0

