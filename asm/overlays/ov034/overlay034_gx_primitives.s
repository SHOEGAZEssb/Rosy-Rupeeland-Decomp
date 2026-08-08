.text

/* Exact fallback; see src/overlays/ov034/overlay034_gx_primitives.c for documented portable C. */

    .global func_ov034_021fd2b8
func_ov034_021fd2b8:
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, L_021fd2e8
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x0]
    bx lr
L_021fd2e8: .word 0x4000488
.size func_ov034_021fd2b8, .-func_ov034_021fd2b8

    .global func_ov034_021fd2ec
func_ov034_021fd2ec:
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r1, lsl #0x10
    mov r1, r2, lsl #0x10
    ldr r2, L_021fd318
    orr r0, r3, r0, lsr #0x10
    str r0, [r2, #0x0]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x0]
    bx lr
L_021fd318: .word 0x400048c
.size func_ov034_021fd2ec, .-func_ov034_021fd2ec

    .global func_ov034_021fd31c
func_ov034_021fd31c:
    ldr r1, [r0, #0x20]
    cmp r1, #0x0
    moveq r1, #0x1
    streq r1, [r0, #0x20]
    bx lr
.size func_ov034_021fd31c, .-func_ov034_021fd31c
