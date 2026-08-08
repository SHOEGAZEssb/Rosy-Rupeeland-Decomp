.text
/* Exact fallback; see src/overlays/ov034/overlay034_sector_state.c for documented portable C. */
    .extern data_ov034_021fe788
    .extern func_ov034_021fd330
    .global func_ov034_021fd3a0
func_ov034_021fd3a0:
    stmdb sp!, {r4, lr}
    mov lr, #0x2
    ldr ip, L_021fd3f0
    b L_021fd3e4
L_021fd3b0:
    ldr r3, [r0, #0x0]
    add r4, r2, lr
    cmp r4, #0x10
    subge r4, r4, #0x10
    add r3, ip, r3, lsl #0x6
    ldr r3, [r3, r4, lsl #0x2]
    cmp r1, r3
    bne L_021fd3e0
    mov r1, r2
    mov r2, lr
    bl func_ov034_021fd330
    ldmia sp!, {r4, pc}
L_021fd3e0:
    add lr, lr, #0x1
L_021fd3e4:
    cmp lr, #0x12
    blt L_021fd3b0
    ldmia sp!, {r4, pc}
L_021fd3f0: .word data_ov034_021fe788
.size func_ov034_021fd3a0, .-func_ov034_021fd3a0
