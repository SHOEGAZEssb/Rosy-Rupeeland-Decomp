.text

/* Exact fallback; see src/overlays/ov036/overlay036_quad_controller_render.c for documented portable C. */

    .extern func_02077a24

    .global func_ov036_022029b0
func_ov036_022029b0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
L_022029bc:
    mov r1, r4
    add r0, r5, r4, lsl #0x4
    bl func_02077a24
    add r4, r4, #0x1
    cmp r4, #0x4
    blt L_022029bc
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov036_022029b0, .-func_ov036_022029b0

