.text

/* Exact fallback; see src/overlays/ov036/overlay036_composite_controller_update.c for documented portable C. */

    .extern func_02095360
    .extern func_ov036_02203228
    .extern func_ov036_021fdcec
    .extern func_020773a8
    .extern func_02091c7c
    .extern func_02091dac
    .extern func_02091b98

    .global func_ov036_02202fb8
func_ov036_02202fb8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x100
    bl func_02095360
    ldr r0, [r4, #0x154]
    ldrh r0, [r0, #0x98]
    tst r0, #0x4
    beq L_02202fe0
    mov r0, r4
    bl func_ov036_02203228
L_02202fe0:
    ldr r0, [r4, #0x1a0]
    bl func_ov036_021fdcec
    add r0, r4, #0x110
    bl func_02095360
    ldr r0, [r4, #0xf4]
    bl func_020773a8
    add r0, r4, #0x120
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x13c
    bl func_02091dac
    add r0, r4, #0x120
    mov r1, #0x1e
    bl func_02091b98
    ldmia sp!, {r4, pc}
    .size func_ov036_02202fb8, .-func_ov036_02202fb8

