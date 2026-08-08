.text

/* Exact fallback; see src/overlays/ov027/overlay027_sprite_runtime.c. */



    .global func_ov027_021fd3d8
func_ov027_021fd3d8:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
.size func_ov027_021fd3d8, .-func_ov027_021fd3d8

