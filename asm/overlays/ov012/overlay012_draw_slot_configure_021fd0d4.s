    .text
    .extern func_020add34
/* Exact register/control-flow fallback; see src/overlays/ov012/overlay012_draw_slot_configure.c. */
    .global Overlay012_ConfigureDrawSlot
Overlay012_ConfigureDrawSlot:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    bmi L_021fd110
    cmp r4, #4
    bge L_021fd110
    add r0, r5, r4, lsl #4
    mov r1, #1
    strh r1, [r0, #0xe]
    str r2, [r5, r4, lsl #4]
    ldr r2, [sp, #0x10]
    str r3, [r0, #4]
    mov r1, r0
    str r2, [r0, #8]
    bl func_020add34
L_021fd110:
    cmp r4, #0
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r4, #4
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    ldr r2, [sp, #0x1c]
    orr r0, r1, r0, lsl #5
    add r1, r5, r4, lsl #4
    mov r3, #1
    strh r3, [r1, #0xe]
    orr r0, r0, r2, lsl #0xa
    strh r0, [r1, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
    .size Overlay012_ConfigureDrawSlot, . - Overlay012_ConfigureDrawSlot
