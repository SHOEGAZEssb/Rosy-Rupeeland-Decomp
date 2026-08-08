.text

/* Exact fallback; see src/overlays/ov036/overlay036_scene_runtime.c for documented portable C. */

    .extern func_ov043_0220b9bc
    .extern func_020b0558
    .extern func_ov048_0220bad4

    .global func_ov036_02204ae0
func_ov036_02204ae0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x60]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    mov r5, r0
    add r0, r4, #0x98
    bl func_ov043_0220b9bc ; func_ov048_0220b9bc
    cmp r0, #0x1
    subeq r5, r5, #0x7e
    subeq r5, r5, #0x400
    bl func_020b0558
    ldr r2, L_02204b68
    ldr r0, L_02204b6c
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #-0x7c]
    ldr r0, [r4, #0x60]
    str r1, [r0, #0x98]
    str r5, [r0, #0x9c]
    ldr r0, [r4, #0x60]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r2, L_02204b70
    mov r0, #0x1
    str r0, [r2, #0x0]
    mov r1, #0x0
    add r0, r4, #0x98
    str r1, [r2, #0xf8]
    bl func_ov048_0220bad4
    ldmia sp!, {r3, r4, r5, pc}
L_02204b68: .word 0x7fff
L_02204b6c: .word 0x40004c0
L_02204b70: .word 0x4000448
    .size func_ov036_02204ae0, .-func_ov036_02204ae0

