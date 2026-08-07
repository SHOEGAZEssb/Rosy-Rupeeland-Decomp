    .text

/* Exact fallback; see src/overlays/ov017/overlay017_record_base.c. */
    .extern func_020add34
.global func_ov017_021fea18
func_ov017_021fea18:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    bmi L_021fea54
    cmp r4, #0x4
    bge L_021fea54
    add r0, r5, r4, lsl #0x4
    mov r1, #0x1
    strh r1, [r0, #0xe]
    str r2, [r5, r4, lsl #0x4]
    ldr r2, [sp, #0x10]
    str r3, [r0, #0x4]
    mov r1, r0
    str r2, [r0, #0x8]
    bl func_020add34
L_021fea54:
    cmp r4, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r4, #0x4
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    ldr r2, [sp, #0x1c]
    orr r0, r1, r0, lsl #0x5
    add r1, r5, r4, lsl #0x4
    mov r3, #0x1
    strh r3, [r1, #0xe]
    orr r0, r0, r2, lsl #0xa
    strh r0, [r1, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov017_021fea18, . - func_ov017_021fea18
