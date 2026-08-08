.text

/* Exact fallback; see src/overlays/ov037/overlay037_actor_controller.c for documented portable C. */

    .extern func_020955b0
    .extern func_020720c0
    .extern data_ov037_021fee08

    .global func_ov037_021fd5ac
func_ov037_021fd5ac:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r2
    bl func_020955b0
    ldr r1, L_021fd5fc
    add r0, r4, #0xa0
    str r1, [r4, #0x0]
    bl func_020720c0
    str r5, [r4, #0xac]
    ldrh r0, [r5, #0x50]
    mov r3, #0x6
    mov r2, #0x18
    orr r0, r0, #0x42
    strh r0, [r5, #0x50]
    ldr r1, [r4, #0xac]
    mov r0, r4
    strb r3, [r1, #0x5a]
    ldr r1, [r4, #0xac]
    strb r2, [r1, #0x5b]
    ldmia sp!, {r3, r4, r5, pc}
L_021fd5fc: .word data_ov037_021fee08
    .size func_ov037_021fd5ac, .-func_ov037_021fd5ac
