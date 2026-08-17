.text

/* Exact fallback; see src/overlays/ov037/overlay037_actor_controller.c for documented portable C. */

    .extern AlternateSpritePresentation_SyncTransformVariant
    .extern func_ov037_021fd6c0
    .extern GraphicsAnimationInstance_SetAnimation

    .global func_ov037_021fd600
func_ov037_021fd600:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl AlternateSpritePresentation_SyncTransformVariant
    ldr r2, [r4, #0x9c]
    ldr r0, [r4, #0xac]
    ldr r3, [r2, #0x28]
    ldr r1, [r2, #0x20]
    ldr r2, [r2, #0x24]
    add r3, r3, #0x10
    bl func_ov037_021fd6c0
    ldr r0, [r4, #0x9c]
    ldr r1, [r4, #0xac]
    ldr r0, [r0, #0x34]
    str r0, [r1, #0x38]
    str r0, [r1, #0x34]
    ldrh r0, [r4, #0x98]
    tst r0, #0x1
    beq L_021fd660
    bic r0, r0, #0x1
    strh r0, [r4, #0x98]
    ldr r0, [r4, #0xac]
    mov r1, #0x1
    bl GraphicsAnimationInstance_SetAnimation
    ldmia sp!, {r4, pc}
L_021fd660:
    tst r0, #0x2
    beq L_021fd680
    bic r0, r0, #0x2
    strh r0, [r4, #0x98]
    ldr r0, [r4, #0xac]
    mov r1, #0x2
    bl GraphicsAnimationInstance_SetAnimation
    ldmia sp!, {r4, pc}
L_021fd680:
    tst r0, #0x4
    beq L_021fd6a0
    bic r0, r0, #0x4
    strh r0, [r4, #0x98]
    ldr r0, [r4, #0xac]
    mov r1, #0x3
    bl GraphicsAnimationInstance_SetAnimation
    ldmia sp!, {r4, pc}
L_021fd6a0:
    tst r0, #0x8
    ldmeqia sp!, {r4, pc}
    bic r0, r0, #0x8
    strh r0, [r4, #0x98]
    ldr r0, [r4, #0xac]
    mov r1, #0x4
    bl GraphicsAnimationInstance_SetAnimation
    ldmia sp!, {r4, pc}
    .size func_ov037_021fd600, .-func_ov037_021fd600
