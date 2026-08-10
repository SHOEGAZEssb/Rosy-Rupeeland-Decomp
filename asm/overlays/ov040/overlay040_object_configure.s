.text
/* Exact fallback; see overlay040_scene_lifecycle.c for portable C. */
    .extern GraphicsSpriteState_SetAnimationIndex
    .global func_ov040_021fd858
func_ov040_021fd858:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    ldrb r1, [sp, #0x14]
    ldr r0, [r6, #0xc]
    mov r5, r2
    mov r4, r3
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r12, [r6, #0xc]
    ldr r2, [sp, #0x10]
    ldrh r3, [r12, #0x24]
    mov r1, #0x100
    mov r0, #0x0
    orr r3, r3, #0x2
    strh r3, [r12, #0x24]
    str r5, [r6, #0x30]
    str r4, [r6, #0x34]
    str r2, [r6, #0x38]
    strh r1, [r6, #0x3c]
    strh r1, [r6, #0x3e]
    strh r0, [r6, #0x40]
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov040_021fd858, .-func_ov040_021fd858
