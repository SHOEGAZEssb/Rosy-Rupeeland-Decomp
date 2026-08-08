.text

/* Exact fallback for func_ov042_021fea08; see the documented portable C in
 * src/overlays/ov042/overlay042_record_helpers.c. */
.extern func_0209a07c

    .global func_ov042_021fea08
func_ov042_021fea08:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    add r2, r5, r4, lsl #0x2
    add r0, r2, #0x1000
    ldr r0, [r0, #0x4c8]
    cmp r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldr r0, [r2, #0xf28]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r2, #0xf28]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r2, #0xf28]
    bl func_0209a07c
    add r0, r5, r4, lsl #0x2
    add r0, r0, #0x1000
    mvn r1, #0x0
    str r1, [r0, #0x4c8]
    add r1, r5, #0x1000
    ldr r2, [r1, #0x648]
    str r2, [r0, #0x588]
    str r4, [r1, #0x648]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov042_021fea08, . - func_ov042_021fea08
