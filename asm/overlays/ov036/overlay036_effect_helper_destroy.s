.text

/* Exact fallback; see src/overlays/ov036/overlay036_random_effect.c for documented portable C. */

    .extern data_ov036_02205eac
    .extern func_02095308

    .global func_ov036_021fe238
func_ov036_021fe238:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe254
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fe254: .word data_ov036_02205eac
    .size func_ov036_021fe238, .-func_ov036_021fe238
