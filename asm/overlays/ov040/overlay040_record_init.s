.text
/* Exact fallback; see overlay040_scene_lifecycle.c for portable C. */
    .extern data_ov040_022042d4
    .global func_ov040_021fd724
func_ov040_021fd724:
    ldr r2, L_021fd73c
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
L_021fd73c: .word data_ov040_022042d4
    .size func_ov040_021fd724, .-func_ov040_021fd724
