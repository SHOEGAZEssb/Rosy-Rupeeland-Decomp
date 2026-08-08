.text

/* Exact fallback; see src/overlays/ov036/overlay036_random_effect.c for documented portable C. */

    .extern data_ov036_02205eac

    .global func_ov036_021fe218
func_ov036_021fe218:
    ldr r2, L_021fe234
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fe234: .word data_ov036_02205eac
    .size func_ov036_021fe218, .-func_ov036_021fe218
