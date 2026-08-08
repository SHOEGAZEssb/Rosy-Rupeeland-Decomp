.text

/* Exact fallback; see src/overlays/ov036/overlay036_effect_controller_destroy.c for documented portable C. */

    .extern func_02095308
    .extern func_02077688
    .extern func_020720d4
    .extern Heap_Free
    .extern data_ov036_02205f2c
    .extern data_ov036_02205eac

    .global func_ov036_021feef0
func_ov036_021feef0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021fef64
    add r0, r4, #0xf8
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x108
    bl func_02095308
    ldr r1, [r4, #0xdc]
    ldr r0, [r1, #0x0]
    bl func_02077688
    ldr r1, L_021fef68
    add r0, r4, #0x108
    str r1, [r4, #0x108]
    bl func_02095308
    ldr r1, L_021fef68
    add r0, r4, #0xf8
    str r1, [r4, #0xf8]
    bl func_02095308
    add r0, r4, #0xec
    bl func_020720d4
    add r0, r4, #0xe0
    bl func_020720d4
    add r0, r4, #0xcc
    bl func_020720d4
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fef64: .word data_ov036_02205f2c
L_021fef68: .word data_ov036_02205eac
    .size func_ov036_021feef0, .-func_ov036_021feef0
