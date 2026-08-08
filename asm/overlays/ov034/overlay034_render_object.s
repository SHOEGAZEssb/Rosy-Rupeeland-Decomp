.text

/* Exact fallback; see src/overlays/ov034/overlay034_render_object.c for documented portable C. */

    .extern func_020949ec
    .extern func_020948d4
    .extern data_ov034_021ff178

    .global func_ov034_021fce00
func_ov034_021fce00:
    bx lr
.size func_ov034_021fce00, .-func_ov034_021fce00

    .global func_ov034_021fce04
func_ov034_021fce04:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_020949ec
    ldr r1, L_021fce4c
    add r0, r7, #0x6c
    str r1, [r7, #0x0]
    str r6, [r7, #0x9c]
    str r5, [r7, #0xa0]
    strh r4, [r7, #0xa4]
    mov r2, #0x0
    mov r1, #0x200
    strh r2, [r7, #0xa6]
    bl func_020948d4
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fce4c: .word data_ov034_021ff178
.size func_ov034_021fce04, .-func_ov034_021fce04
