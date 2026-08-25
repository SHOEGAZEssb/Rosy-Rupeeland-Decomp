.text

/* Exact fallback; see src/overlays/ov036/overlay036_oscillating_object_lifecycle.c for documented portable C. */

    .extern func_ov036_021fcec4
    .extern TitleInterpolatedValue_Init
    .extern PresentationScalar_SetImmediate
    .extern func_ov036_02201d60
    .extern data_ov036_0220600c

    .global func_ov036_02201d70
func_ov036_02201d70:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r2
    mov r5, r3
    mov r2, #0x0
    mov r3, #0x16
    mov r4, r0
    bl func_ov036_021fcec4
    ldr r1, L_02201de8
    add r0, r4, #0xd8
    str r1, [r4, #0x0]
    bl TitleInterpolatedValue_Init
    ldr r1, [sp, #0x10]
    mov r0, #0x0
    str r1, [r4, #0xc8]
    str r5, [r4, #0xcc]
    str r6, [r4, #0xd4]
    str r0, [r4, #0xd0]
    ldr r1, L_02201dec
    str r0, [r4, #0xf4]
    mov r2, #0x1
    add r0, r4, #0x6c
    str r2, [r4, #0x88]
    bl PresentationScalar_SetImmediate
    mov r2, #0xf
    mov r0, r4
    mov r1, #0x10
    str r2, [r4, #0xa4]
    bl func_ov036_02201d60
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_02201de8: .word data_ov036_0220600c
L_02201dec: .word 0x666
    .size func_ov036_02201d70, .-func_ov036_02201d70

