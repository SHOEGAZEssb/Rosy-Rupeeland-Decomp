.text

/* Exact fallback; see src/overlays/ov036/overlay036_effect_controller_destroy.c for documented portable C. */

    .extern func_02095308
    .extern func_02077688
    .extern func_020720d4
    .extern data_ov036_02205f2c
    .extern data_ov036_02205eac

    .global func_ov036_021fee7c
func_ov036_021fee7c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021feee8
    add r0, r4, #0xf8
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x108
    bl func_02095308
    ldr r1, [r4, #0xdc]
    ldr r0, [r1, #0x0]
    bl func_02077688
    ldr r1, L_021feeec
    add r0, r4, #0x108
    str r1, [r4, #0x108]
    bl func_02095308
    ldr r1, L_021feeec
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
    ldmia sp!, {r4, pc}
L_021feee8: .word data_ov036_02205f2c
L_021feeec: .word data_ov036_02205eac
    .size func_ov036_021fee7c, .-func_ov036_021fee7c
