.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern func_020befec
    .global func_ov039_0220760c
func_ov039_0220760c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x48]
    cmp r1, #0x0
    mov r1, #0xa
    ldrh r0, [r2, #0x42]
    beq L_02207674
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r2, [r4, #0x4c]
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldrsh r0, [r4, #0xba]
    bl func_020befec
    b L_02207668
L_0220764c:
    add r1, r4, r0, lsl #0x2
    ldr r2, [r1, #0x58]
    ldrh r1, [r2, #0x40]
    cmp r1, #0x0
    ldreqh r1, [r2, #0x42]
    biceq r1, r1, #0x4
    streqh r1, [r2, #0x42]
L_02207668:
    subs r0, r0, #0x1
    bpl L_0220764c
    ldmia sp!, {r4, pc}
L_02207674:
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r2, [r4, #0x50]
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r2, [r4, #0x4c]
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldrsh r0, [r4, #0xba]
    bl func_020befec
    b L_022076c4
L_022076a8:
    add r1, r4, r0, lsl #0x2
    ldr r2, [r1, #0x58]
    ldrh r1, [r2, #0x40]
    cmp r1, #0x0
    ldreqh r1, [r2, #0x42]
    orreq r1, r1, #0x4
    streqh r1, [r2, #0x42]
L_022076c4:
    subs r0, r0, #0x1
    bpl L_022076a8
    ldmia sp!, {r4, pc}
    .size func_ov039_0220760c, .-func_ov039_0220760c

