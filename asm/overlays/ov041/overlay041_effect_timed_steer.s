.text

/* Exact fallback for func_ov041_022024c8; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_timed_steer.c. */
.extern func_020ae024

    .global func_ov041_022024c8
func_ov041_022024c8: ; 0x022024c8
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x930]
    mov r5, r1
    add r0, r0, #0x1
    mov r4, r2
    str r0, [r6, #0x930]
    cmp r0, #0x28
    ble .L_02202534
    cmp r0, #0x46
    bge .L_02202534
    ldr r1, [r6, #0x48]
    ldr r0, [r6, #0x6c]
    ldr r2, [r1, #0x8]
    ldr r1, [r6, #0x70]
    ldr r3, [r2, #0xd4]
    ldr r2, [r2, #0xd8]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_020ae024
    cmp r0, #0x0
    ldr r2, [r6, #0x4b8]
    addlt r0, r0, #0x10000
    sub r0, r0, r2
    mov r1, #0xa0
    str r0, [r5, #0x0]
    str r1, [r4, #0x0]
.L_02202534:
    ldr r0, [r6, #0x930]
    cmp r0, #0x8c
    ble .L_02202568
    mov r0, #0x0
    sub r1, r0, #0x1000
    bl func_020ae024
    cmp r0, #0x0
    ldr r2, [r6, #0x4b8]
    addlt r0, r0, #0x10000
    sub r0, r0, r2
    mov r1, #0xa0
    str r0, [r5, #0x0]
    str r1, [r4, #0x0]
.L_02202568:
    ldr r1, [r6, #0x4b4]
    ldr r0, [r6, #0x70]
    sub r0, r1, r0
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x6c]
    mov r1, #0x3
    cmp r0, #0x80000
    movgt r0, #0x1
    movle r0, #0x2
    str r0, [r6, #0x91c]
    mov r0, #0xcd
    str r0, [r6, #0x928]
    mov r0, #0x0
    str r1, [r6, #0x920]
    str r0, [r6, #0x934]
    str r0, [r6, #0x930]
    ldmia sp!, {r4, r5, r6, pc}

    .size func_ov041_022024c8, . - func_ov041_022024c8

