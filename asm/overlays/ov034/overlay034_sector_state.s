.text

/* Exact fallback; see src/overlays/ov034/overlay034_sector_state.c for documented portable C. */

    .global func_ov034_021fd330
func_ov034_021fd330:
    stmdb sp!, {r4, lr}
    add r4, r1, r2
    ldr r3, [r0, #0x1c]
    cmp r4, #0x10
    subge r4, r4, #0x10
    mov r3, r3, lsl #0x10
    mov lr, r3, lsr #0x10
    mov ip, r4, lsl #0x10
    mov r3, ip, asr #0x3
    add r3, ip, r3, lsr #0x1c
    mov r3, r3, asr #0x4
    str lr, [r0, #0x1c]
    str lr, [r0, #0x14]
    add r3, r3, #0x800
    str r3, [r0, #0x18]
    cmp r4, r1
    ldrlt r1, [r0, #0x18]
    addlt r1, r1, #0x10000
    strlt r1, [r0, #0x18]
    mov r1, #0x6
    mul r1, r2, r1
    str r1, [r0, #0x24]
    mov r1, #0x0
    str r1, [r0, #0x28]
    str r1, [r0, #0x10]
    mov r1, #0x3
    str r1, [r0, #0x20]
    ldmia sp!, {r4, pc}
.size func_ov034_021fd330, .-func_ov034_021fd330
