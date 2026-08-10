.text
/* Exact fallback; see overlay039_mode_score.c for portable C. */
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern GraphicsSpriteState_SetFrameIndex

    .global func_ov039_021ff330
func_ov039_021ff330:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x80]
    mov r4, r1
    ldr r0, [r0, #0xc]
    and r1, r4, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x84]
    and r1, r4, #0xff
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x88]
    and r1, r4, #0xff
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x8c]
    and r1, r4, #0xff
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x88]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetFrameIndex
    ldr r0, [r5, #0x8c]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetFrameIndex
    ldr r0, [r5, #0x88]
    and r1, r4, #0xff
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r5, #0x8c]
    ldr r2, [r0, #0xc]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r5, #0x90]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x94]
    and r1, r4, #0xff
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x90]
    mov r1, #0x4
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetFrameIndex
    ldr r0, [r5, #0x94]
    mov r1, #0x4
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetFrameIndex
    ldr r1, [r5, #0x90]
    mov r0, #0x6
    ldr r1, [r1, #0xc]
    sub r2, r0, #0x1
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x94]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
L_021ff434:
    add r0, r5, r2, lsl #0x2
    ldr r0, [r0, #0x80]
    subs r2, r2, #0x1
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    bpl L_021ff434
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov039_021ff330, .-func_ov039_021ff330

