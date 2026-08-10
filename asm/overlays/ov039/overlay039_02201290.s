.text
/* Exact fallback; see overlay039_scene_lifecycle.c for portable C. */
    .extern GraphicsSpriteState_SetAnimationIndex
    .global func_ov039_02201290
func_ov039_02201290:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r0, [r5, #0xc]
    mov r1, r2
    mov r4, r3
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0xc]
    strb r4, [r0, #0x3a]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov039_02201290, .-func_ov039_02201290

