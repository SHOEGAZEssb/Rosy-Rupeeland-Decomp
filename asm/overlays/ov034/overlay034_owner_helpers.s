.text

/* Exact fallback; see src/overlays/ov034/overlay034_owner_helpers.c for documented portable C. */

    .extern func_ov034_021fd494
    .extern func_ov034_021fd31c

    .global func_ov034_021fd978
func_ov034_021fd978:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
L_021fd984:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0xa0]
    bl func_ov034_021fd494
    add r4, r4, #0x1
    cmp r4, #0x3
    blt L_021fd984
    ldr r0, [r5, #0xc0]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0xc0]
    ldr r0, [r5, #0xc4]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r5, #0xc4]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov034_021fd978, .-func_ov034_021fd978

    .global func_ov034_021fd9c0
func_ov034_021fd9c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
L_021fd9cc:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0xa0]
    bl func_ov034_021fd31c
    add r4, r4, #0x1
    cmp r4, #0x3
    blt L_021fd9cc
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov034_021fd9c0, .-func_ov034_021fd9c0

    .global func_ov034_021fd9e8
func_ov034_021fd9e8:
    ldr r0, [r0, #0xa0]
    ldr r0, [r0, #0x20]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov034_021fd9e8, .-func_ov034_021fd9e8

    .global func_ov034_021fda00
func_ov034_021fda00:
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0xa0]
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov034_021fda00, .-func_ov034_021fda00

    .global func_ov034_021fda1c
func_ov034_021fda1c:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
.size func_ov034_021fda1c, .-func_ov034_021fda1c

    .global func_ov034_021fda34
func_ov034_021fda34:
    stmib r0, {r1, r2, r3}
    bx lr
.size func_ov034_021fda34, .-func_ov034_021fda34

    .global func_ov034_021fda3c
func_ov034_021fda3c:
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str r3, [r0, #0x18]
    bx lr
.size func_ov034_021fda3c, .-func_ov034_021fda3c
