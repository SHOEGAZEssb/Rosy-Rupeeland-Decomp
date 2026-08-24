.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_handles.c for documented portable C. */

    .extern func_ov036_021fe978
    .extern gFx32CosSinTable

    .global func_ov036_022002b8
func_ov036_022002b8:
    stmdb sp!, {r3, lr}
    mov r1, r0
    ldr r0, [r1, #0xbc]
    ldr r2, L_02200314
    add r3, r0, #0x100
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r2, r0]
    str r3, [r1, #0xbc]
    mov r2, r0, lsl #0x4
    mov r0, r2, asr #0x7
    add r0, r2, r0, lsr #0x18
    mov lr, r0, asr #0x8
    str lr, [r1, #0xb0]
    ldr ip, [r1, #0x10]
    ldr r0, [r1, #0x9c]
    ldr r2, [r1, #0x20]
    ldr r3, [r1, #0x30]
    add r1, ip, lr
    bl func_ov036_021fe978
    ldmia sp!, {r3, pc}
L_02200314: .word gFx32CosSinTable
    .size func_ov036_022002b8, .-func_ov036_022002b8

