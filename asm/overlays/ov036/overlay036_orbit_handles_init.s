.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_handles.c for documented portable C. */

    .extern func_020949ec
    .extern data_ov036_0220607c

    .global func_ov036_02200234
func_ov036_02200234:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020949ec
    ldr r0, L_02200284
    mov r2, #0x0
    str r0, [r5, #0x0]
    str r4, [r5, #0xc0]
    str r2, [r5, #0xb4]
    str r2, [r5, #0xbc]
    str r2, [r5, #0xb8]
    str r2, [r5, #0x9c]
    mov r1, r2
L_02200268:
    add r0, r5, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0xa0]
    cmp r2, #0x4
    blt L_02200268
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_02200284: .word data_ov036_0220607c
    .size func_ov036_02200234, .-func_ov036_02200234

