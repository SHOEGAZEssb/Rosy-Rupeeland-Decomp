.text

/* Exact fallback; see src/overlays/ov037/overlay037_render_object_init.c for documented portable C. */

    .extern Presentation_Init
    .extern data_ov037_021fedec

    .global func_ov037_021fceb0
func_ov037_021fceb0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl Presentation_Init
    ldr r1, L_021fcf14
    mov r0, #0x1f
    str r1, [r4, #0x0]
    str r7, [r4, #0x9c]
    str r6, [r4, #0xa0]
    mov r1, #0x0
    str r1, [r4, #0xa4]
    str r5, [r4, #0xa8]
    str r0, [r4, #0xb4]
    str r0, [r4, #0xb0]
    str r0, [r4, #0xac]
    ldr r0, L_021fcf18
    str r1, [r4, #0xb8]
    strh r0, [r4, #0xbc]
    strh r1, [r4, #0xbe]
    strh r1, [r4, #0xc0]
    mov r0, r4
    strh r1, [r4, #0xc2]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fcf14: .word data_ov037_021fedec
L_021fcf18: .word 0x7fff
    .size func_ov037_021fceb0, .-func_ov037_021fceb0

    .global func_ov037_021fcf1c
func_ov037_021fcf1c:
    bx lr
    .size func_ov037_021fcf1c, .-func_ov037_021fcf1c
