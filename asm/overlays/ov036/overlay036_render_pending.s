.text

/* Exact fallback; see src/overlays/ov036/overlay036_render_updates.c for documented portable C. */

    .extern func_02094d28
    .extern func_ov036_021fd28c

    .global func_ov036_021fd248
func_ov036_021fd248:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x98]
    tst r1, #0x8
    ldmeqia sp!, {r4, pc}
    ldr r2, [r4, #0xb0]
    ldr r3, [r4, #0xb4]
    mov r1, #0x1
    bl func_02094d28
    str r0, [r4, #0xac]
    mov r0, r4
    bl func_ov036_021fd28c
    cmp r0, #0x0
    ldrneh r0, [r4, #0x98]
    bicne r0, r0, #0x8
    strneh r0, [r4, #0x98]
    ldmia sp!, {r4, pc}
    .size func_ov036_021fd248, .-func_ov036_021fd248

