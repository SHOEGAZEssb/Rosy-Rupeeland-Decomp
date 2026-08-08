.text

/* Exact fallback; see src/overlays/ov027/overlay027_sprite_runtime.c. */



    .global func_ov027_021fd3f0
func_ov027_021fd3f0:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
.size func_ov027_021fd3f0, .-func_ov027_021fd3f0

