.text

/* Exact fallback; see src/overlays/ov036/overlay036_particle_list_render.c for documented portable C. */

    .extern func_ov036_021fd128
    .extern func_ov036_021fdef0
    .extern func_ov036_021fd4c8

    .global func_ov036_021fe988
func_ov036_021fe988:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x10
    str r0, [sp, #0x4]
    bl func_ov036_021fd128
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov036_021fdef0
    ldr r4, [r4, #0xa0]
    b L_021fe9ec
L_021fe9e0:
    mov r0, r4
    bl func_ov036_021fd4c8
    ldr r4, [r4, #0x8]
L_021fe9ec:
    cmp r4, #0x0
    bne L_021fe9e0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size func_ov036_021fe988, .-func_ov036_021fe988
