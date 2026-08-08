.text

/* Exact fallback; see src/overlays/ov037/overlay037_audio_object.c for documented portable C. */

    .extern func_020949ec
    .extern data_ov037_021fee78

    .global func_ov037_021fd1cc
func_ov037_021fd1cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020949ec
    ldr r1, L_021fd1e8
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
L_021fd1e8: .word data_ov037_021fee78
    .size func_ov037_021fd1cc, .-func_ov037_021fd1cc
