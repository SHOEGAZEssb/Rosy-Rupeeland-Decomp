.text

/* Exact fallback; see src/overlays/ov036/overlay036_resource_object_render.c for documented portable C. */

    .global func_ov036_021fe1c0
func_ov036_021fe1c0:
    cmp r1, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    rsb r1, r1, #0x4
    mov r1, r0, lsr r1
    ldr r0, L_021fe1e0
    str r1, [r0, #0x0]
    bx lr
L_021fe1e0: .word 0x40004ac
    .size func_ov036_021fe1c0, .-func_ov036_021fe1c0
