.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_controller_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern func_02077688
    .extern func_020720d4
    .extern data_ov036_02206028
    .extern data_ov036_02205eac

    .global func_ov036_02201350
func_ov036_02201350:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_022013d4
    add r0, r4, #0x148
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x158
    bl func_02095308
    ldr r1, [r4, #0x118]
    ldr r0, [r1, #0x0]
    bl func_02077688
    ldr r1, L_022013d8
    add r0, r4, #0x158
    str r1, [r4, #0x158]
    bl func_02095308
    ldr r1, L_022013d8
    add r0, r4, #0x148
    str r1, [r4, #0x148]
    bl func_02095308
    add r0, r4, #0x10c
    bl func_020720d4
    add r0, r4, #0x100
    bl func_020720d4
    add r0, r4, #0xf4
    bl func_020720d4
    add r0, r4, #0xe8
    bl func_020720d4
    add r0, r4, #0xdc
    bl func_020720d4
    add r0, r4, #0xcc
    bl func_020720d4
    mov r0, r4
    ldmia sp!, {r4, pc}
L_022013d4: .word data_ov036_02206028
L_022013d8: .word data_ov036_02205eac
    .size func_ov036_02201350, .-func_ov036_02201350

