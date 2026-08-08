.text

/* Exact fallback; see src/overlays/ov037/overlay037_audio_object.c for documented portable C. */

    .extern gSoundContext
    .extern func_02059278

    .global func_ov037_021fd1ec
func_ov037_021fd1ec:
    stmdb sp!, {r3, lr}
    ldr r0, [r1, #0x0]
    cmp r0, #0x0
    bne L_021fd220
    ldr r1, [r1, #0x4]
    ldr r0, L_021fd228
    mov r1, r1, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    mov r2, #0x7f
    bl func_02059278
    mov r0, #0x2
    ldmia sp!, {r3, pc}
L_021fd220:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
L_021fd228: .word gSoundContext
    .size func_ov037_021fd1ec, .-func_ov037_021fd1ec
