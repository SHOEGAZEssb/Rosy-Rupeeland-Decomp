.text
/* Exact fallback; see overlay039_scene_lifecycle.c for portable C. */
    .extern func_02072b68
    .global func_ov039_02201234
func_ov039_02201234:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    ldrb r1, [sp, #0x10]
    ldr r0, [r6, #0xc]
    mov r5, r2
    mov r4, r3
    bl func_02072b68
    ldr ip, [r6, #0xc]
    ldr r3, [sp, #0x14]
    ldrh r2, [ip, #0x24]
    mov r1, #0x0
    mov r0, #0x100
    orr r2, r2, #0x2
    strh r2, [ip, #0x24]
    ldr r2, [r6, #0xc]
    strb r3, [r2, #0x3a]
    str r5, [r6, #0x30]
    str r4, [r6, #0x34]
    str r1, [r6, #0x38]
    strh r0, [r6, #0x3c]
    strh r0, [r6, #0x3e]
    strh r1, [r6, #0x40]
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov039_02201234, .-func_ov039_02201234

