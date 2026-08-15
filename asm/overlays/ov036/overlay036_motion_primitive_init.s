.text

/* Exact fallback; see src/overlays/ov036/overlay036_motion_primitive.c for documented portable C. */

    .extern Presentation_Init
    .extern data_ov036_02206108

    .global func_ov036_021fd2a4
func_ov036_021fd2a4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl Presentation_Init
    ldr r0, L_021fd318
    mov r1, #0x0
    str r0, [r4, #0x0]
    strh r7, [r4, #0x9a]
    strh r1, [r4, #0x9c]
    ldrsh r0, [sp, #0x1c]
    strh r6, [r4, #0x9e]
    strh r0, [r4, #0xa0]
    str r1, [r4, #0xac]
    str r1, [r4, #0xa8]
    str r1, [r4, #0xa4]
    ldr r0, [sp, #0x20]
    mov r1, #0x1
    str r0, [r4, #0xb0]
    ldrh r0, [sp, #0x18]
    strh r5, [r4, #0xb4]
    strh r0, [r4, #0xb6]
    ldrh r2, [r4, #0x98]
    mov r0, r4
    orr r2, r2, #0x1
    strh r2, [r4, #0x98]
    str r1, [r4, #0x88]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fd318: .word data_ov036_02206108
    .size func_ov036_021fd2a4, .-func_ov036_021fd2a4

