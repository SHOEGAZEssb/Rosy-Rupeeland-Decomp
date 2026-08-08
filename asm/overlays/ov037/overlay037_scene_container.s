.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_helpers.c for documented portable C. */

    .extern data_ov037_021fedac
    .extern func_02095308

    .global func_ov037_021fd6d0
func_ov037_021fd6d0:
    ldr r2, L_021fd6ec
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fd6ec: .word data_ov037_021fedac
    .size func_ov037_021fd6d0, .-func_ov037_021fd6d0

    .global func_ov037_021fd6f0
func_ov037_021fd6f0:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd70c
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd70c: .word data_ov037_021fedac
    .size func_ov037_021fd6f0, .-func_ov037_021fd6f0
