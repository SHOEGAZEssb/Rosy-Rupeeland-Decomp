.text

/* Exact fallback; see src/overlays/ov036/overlay036_triple_object_update.c for documented portable C. */

    .extern func_02094dd4
    .extern func_ov036_021fd28c
    .extern func_020948e4
    .extern func_020948d4

    .global func_ov036_02203a38
func_ov036_02203a38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02094dd4
    mov r4, r0
    add r0, r5, #0xb4
    bl func_ov036_021fd28c
    cmp r0, #0x0
    beq L_02203a90
    ldr r0, [r5, #0xd4]
    mov r1, #0x2
    cmp r0, #0x0
    add r0, r5, #0xd0
    ble L_02203a78
    sub r2, r1, #0x42
    bl func_020948e4
    b L_02203a80
L_02203a78:
    mov r2, #0x40
    bl func_020948e4
L_02203a80:
    mov r0, #0xc
    str r0, [r5, #0x130]
    mov r0, #0x0
    str r0, [r5, #0x134]
L_02203a90:
    ldr r0, [r5, #0x150]
    ldr r1, [r5, #0xd4]
    add r0, r0, #0x1c
    bl func_020948d4
    ldr r0, [r5, #0xd4]
    ldr r2, [r5, #0x154]
    add r1, r0, r0, lsr #0x1f
    add r0, r2, #0x1c
    mov r1, r1, asr #0x1
    bl func_020948d4
    ldr r0, [r5, #0xd4]
    ldr r2, [r5, #0x158]
    add r1, r0, r0, lsr #0x1f
    add r0, r2, #0x1c
    mov r1, r1, asr #0x1
    bl func_020948d4
    ldr r0, [r5, #0xb0]
    cmp r0, #0x0
    beq L_02203aec
    add r0, r5, #0xb4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_02203aec:
    ldr r0, [r5, #0x150]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r5, #0x154]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r5, #0x158]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov036_02203a38, .-func_ov036_02203a38

