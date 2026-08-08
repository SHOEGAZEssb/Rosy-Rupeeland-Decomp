.text

/* Exact fallback; see src/overlays/ov036/overlay036_multi_effect_emitter.c for documented portable C. */

    .extern func_020948e4

    .global func_ov036_021ff778
func_ov036_021ff778:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r3
    add r0, r5, #0xc
    mov r1, #0x2
    bl func_020948e4
    mov r2, r4
    add r0, r5, #0x1c
    mov r1, #0x2
    bl func_020948e4
    ldr r2, [sp, #0x10]
    add r0, r5, #0x2c
    mov r1, #0x2
    bl func_020948e4
    ldr r0, [sp, #0x14]
    mov r1, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r5, #0x7c]
    str r1, [r5, #0x80]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov036_021ff778, .-func_ov036_021ff778

