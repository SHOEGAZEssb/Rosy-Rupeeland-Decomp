.text

/* Exact fallback; see src/overlays/ov037/overlay037_specialized_render_object.c for documented portable C. */

    .extern func_ov037_021fceb0
    .extern func_020948d4
    .extern func_02094dd4
    .extern data_ov037_021fee24

    .global func_ov037_021fd554
func_ov037_021fd554:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    mov r2, #0x0
    mov r3, #0x5
    mov r5, r0
    bl func_ov037_021fceb0
    ldr r1, L_021fd580
    mov r0, r5
    str r1, [r5, #0x0]
    str r4, [r5, #0xc4]
    ldmia sp!, {r3, r4, r5, pc}
L_021fd580: .word data_ov037_021fee24
    .size func_ov037_021fd554, .-func_ov037_021fd554

    .global func_ov037_021fd584
func_ov037_021fd584:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xc4]
    ldr r1, [r4, #0x50]
    add r0, r4, #0x4c
    add r1, r2, r1
    bl func_020948d4
    mov r0, r4
    bl func_02094dd4
    ldmia sp!, {r4, pc}
    .size func_ov037_021fd584, .-func_ov037_021fd584
