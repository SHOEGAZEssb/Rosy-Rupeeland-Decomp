.text

/* Exact fallback; see src/overlays/ov030/overlay030_scene_constructor.c. */
.extern data_ov030_021ff88c


    .global func_ov030_021fd260
func_ov030_021fd260:
    ldr r2, L_021fd278
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
L_021fd278: .word data_ov030_021ff88c
.size func_ov030_021fd260, .-func_ov030_021fd260
