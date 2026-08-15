.text

/* Exact fallback; see src/overlays/ov037/overlay037_render_object_state.c for documented portable C. */

    .extern Presentation_InterpolateScalar
    .extern func_ov037_021fd1b4

    .global func_ov037_021fd170
func_ov037_021fd170:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x98]
    tst r1, #0x8
    ldmeqia sp!, {r4, pc}
    ldr r2, [r4, #0xb0]
    ldr r3, [r4, #0xb4]
    mov r1, #0x1
    bl Presentation_InterpolateScalar
    str r0, [r4, #0xac]
    mov r0, r4
    bl func_ov037_021fd1b4
    cmp r0, #0x0
    ldrneh r0, [r4, #0x98]
    bicne r0, r0, #0x8
    strneh r0, [r4, #0x98]
    ldmia sp!, {r4, pc}
    .size func_ov037_021fd170, .-func_ov037_021fd170
