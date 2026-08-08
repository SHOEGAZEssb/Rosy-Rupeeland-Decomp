.text

/* Exact fallback; see src/overlays/ov034/overlay034_sector_update.c for documented portable C. */

    .extern func_02091af0
    .global func_ov034_021fd494
func_ov034_021fd494:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
L_021fd4ac:
    ldmia sp!, {r4, pc}
    b L_021fd4bc
    b L_021fd4f4
    b L_021fd508
L_021fd4bc:
    ldr r0, [r4, #0x10]
    add r0, r0, #0x20
    str r0, [r4, #0x10]
    cmp r0, #0x400
    movge r0, #0x400
    strge r0, [r4, #0x10]
    ldrge r0, [r4, #0x20]
    addge r0, r0, #0x1
    strge r0, [r4, #0x20]
    ldr r1, [r4, #0x1c]
    ldr r0, [r4, #0x10]
    add r0, r1, r0
    str r0, [r4, #0x1c]
    ldmia sp!, {r4, pc}
L_021fd4f4:
    ldr r1, [r4, #0x1c]
    ldr r0, [r4, #0x10]
    add r0, r1, r0
    str r0, [r4, #0x1c]
    ldmia sp!, {r4, pc}
L_021fd508:
    ldr r0, [r4, #0x28]
    add r3, r0, #0x1
    str r3, [r4, #0x28]
    ldr r2, [r4, #0x24]
    cmp r3, r2
    movge r0, #0x0
    strge r0, [r4, #0x20]
    ldrge r0, [r4, #0x18]
    strge r0, [r4, #0x1c]
    ldmgeia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    ldr r1, [r4, #0x18]
    bl func_02091af0
    str r0, [r4, #0x1c]
    ldmia sp!, {r4, pc}
.size func_ov034_021fd494, .-func_ov034_021fd494
