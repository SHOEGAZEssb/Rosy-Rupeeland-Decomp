.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_handles.c for documented portable C. */

    .extern func_02094d28
    .extern func_ov036_021fe978

    .global func_ov036_02200318
func_ov036_02200318:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r2, #0x0
    mov r7, r0
    sub r3, r2, #0x300
    mov r1, #0x2
    bl func_02094d28
    mov r4, r0
    mov r0, r7
    mov r1, #0x3
    mov r2, #0x0
    mov r3, #0x300
    bl func_02094d28
    mov r2, #0x4000
    sub r5, r0, #0x180
    mov r0, r7
    rsb r2, r2, #0x0
    mov r1, #0x1
    mov r3, #0x2000
    bl func_02094d28
    ldr r1, [r7, #0xb8]
    mov r6, #0x0
    cmp r1, #0x0
    rsbne r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    rsbne r4, r4, #0x0
    mov r8, r0, lsr #0x10
L_02200388:
    mov r1, r6, lsl #0xa
    add ip, r7, r6, lsl #0x2
    ldr r2, [r7, #0x20]
    ldr r3, [r7, #0x30]
    ldr r0, [r7, #0x10]
    sub r1, r1, #0x600
    add r1, r1, r0
    ldr r0, [ip, #0xa0]
    add r1, r4, r1
    add r2, r5, r2
    sub r3, r3, #0x10
    bl func_ov036_021fe978
    add r0, r7, r6, lsl #0x2
    ldr r0, [r0, #0xa0]
    add r6, r6, #0x1
    strh r8, [r0, #0x4c]
    cmp r6, #0x4
    blt L_02200388
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size func_ov036_02200318, .-func_ov036_02200318

