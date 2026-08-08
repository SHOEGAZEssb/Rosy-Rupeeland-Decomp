.text

/* Exact fallback; see src/overlays/ov036/overlay036_secondary_resource_object.c for documented portable C. */

    .extern func_02077d4c
    .extern func_02077d5c
    .extern func_02077d6c
    .extern func_ov036_021fdef0
    .extern func_ov036_021fe1c0
    .extern func_02070454
    .extern func_02070464
    .extern func_ov036_021fd128
    .extern func_ov036_021fe1e4

    .global func_ov036_0220009c
func_ov036_0220009c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    ldr r5, L_0220021c
    mov r1, #0x0
    mov r4, r0
    str r1, [r5, #0x0]
    ldr r3, [r4, #0x30]
    ldr r2, [r4, #0x20]
    ldr r1, [r4, #0x10]
    mov r0, #0x10000
    str r1, [r5, #0x2c]
    str r2, [r5, #0x2c]
    str r3, [r5, #0x2c]
    str r0, [r5, #0x28]
    str r0, [r5, #0x28]
    mov r0, #0x1000
    str r0, [r5, #0x28]
    ldr r7, [r4, #0x9c]
    mov r0, r7
    bl func_02077d4c
    mov r6, r0
    ldr r0, [r4, #0x9c]
    bl func_02077d5c
    mov r5, r0
    mov r0, r7
    bl func_02077d6c
    mov r2, r5
    mov r3, r0
    mov r0, r6
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r5, [r7, #0x10]
    mov r1, #0x1
    ldr r5, [r5, #0xc]
    str r5, [sp, #0xc]
    bl func_ov036_021fdef0
    ldr r0, [r4, #0x9c]
    ldr r1, [r0, #0x14]
    ldr r5, [r1, #0xc]
    bl func_02077d4c
    mov r1, r0
    mov r0, r5
    bl func_ov036_021fe1c0
    ldr r0, [r4, #0x9c]
    ldr r0, [r0, #0x4]
    bl func_02070454
    ldr r1, [r4, #0x9c]
    mov r4, r0, lsl #0xc
    ldr r0, [r1, #0x4]
    bl func_02070464
    mov r5, r0, lsl #0xc
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x15
    bl func_ov036_021fd128
    mov r2, #0x1
    ldr r1, L_02200220
    rsb r0, r2, #0x8000
    str r2, [r1, #0x0]
    str r0, [r1, #-0x80]
    mov r1, r5
    mov r0, #0x0
    bl func_ov036_021fe1e4
    ldr r2, L_02200224
    ldr r3, L_02200228
    mov r0, r4
    mov r1, r5
    str r2, [r3, #0x0]
    mov r2, #0x0
    str r2, [r3, #0x0]
    bl func_ov036_021fe1e4
    ldr r2, L_0220022c
    mov r3, #0x80
    mov r0, r4
    mov r1, #0x0
    str r3, [r2, #0x0]
    bl func_ov036_021fe1e4
    ldr r0, L_02200230
    ldr r2, L_0220022c
    mov r1, #0x0
    str r0, [r2, #0x0]
    str r1, [r2, #-0xc]
    add r0, r0, #0xff00
    str r0, [r2, #0x0]
    str r1, [r2, #0x70]
    mov r0, #0x1
    str r0, [r2, #-0x4c]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0220021c: .word 0x4000444
L_02200220: .word 0x4000500
L_02200224: .word 0xff80
L_02200228: .word 0x400048c
L_0220022c: .word 0x4000494
L_02200230: .word 0x1000080
    .size func_ov036_0220009c, .-func_ov036_0220009c

