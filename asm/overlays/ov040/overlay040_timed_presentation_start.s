.text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern func_02072b68
    .global func_ov040_021ff8b0
func_ov040_021ff8b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x1
    str r0, [r4, #0xabc]
    cmp r1, #0x7d0
    str r1, [r4, #0xab4]
    movge r0, #0x2
    strge r0, [r4, #0xabc]
    ldr r0, [r4, #0xb10]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0xc]
    mov r1, #0x13
    bl func_02072b68
    ldr r0, [r4, #0xb10]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
    .size func_ov040_021ff8b0, .-func_ov040_021ff8b0
