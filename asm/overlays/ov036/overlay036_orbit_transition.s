.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_transition.c for documented portable C. */

    .extern func_02094bbc
    .extern func_020948d4
    .extern func_020948e4
    .extern func_020948f8
    .extern func_ov036_021fd4b0

    .global func_ov036_02200b38
func_ov036_02200b38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    ldr r3, [r4, #0x0]
    mov r0, #0x280
    mul r2, r3, r0
    mov r5, r1
    mov r0, r3, lsl #0x6
    rsb r3, r0, #0x0
    ldr ip, [r4, #0xc]
    sub r2, r2, #0x600
    ldr r1, [r4, #0x8]
    mov r0, r5
    add r2, ip, r2
    sub r3, r3, #0x20
    bl func_02094bbc
    add r0, r5, #0x5c
    mov r1, #0x0
    bl func_020948d4
    ldr r2, [r4, #0x10]
    add r0, r5, #0x5c
    mov r1, #0x2
    bl func_020948e4
    ldr r1, [r4, #0x1c]
    add r0, r5, #0x1c
    ldr r2, [r4, #0x14]
    bl func_020948f8
    mov r0, r5
    ldr r1, [r4, #0x18]
    bl func_ov036_021fd4b0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov036_02200b38, .-func_ov036_02200b38
