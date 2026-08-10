.text

/* Exact fallback; see src/overlays/ov036/overlay036_effect_spawn.c for documented portable C. */

    .extern GraphicsAnimationInstance_SetAnimation

    .global func_ov036_021ff050
func_ov036_021ff050:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r2
    and r1, r1, #0xff
    mov r5, r3
    bl GraphicsAnimationInstance_SetAnimation
    str r6, [r4, #0x20]
    ldr r0, [sp, #0x18]
    ldr r2, [sp, #0x10]
    str r5, [r4, #0x24]
    ldr r1, [sp, #0x14]
    str r2, [r4, #0x28]
    strb r1, [r4, #0x5a]
    ldrh r1, [r4, #0x50]
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    strh r0, [r4, #0x50]
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov036_021ff050, .-func_ov036_021ff050

