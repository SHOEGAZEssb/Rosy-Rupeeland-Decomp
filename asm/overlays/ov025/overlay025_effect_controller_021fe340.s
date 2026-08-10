.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_controller.c. */
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov025_021fe174


    .global func_ov025_021fe340
func_ov025_021fe340:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x1
    mov r2, #0xe
    mov r3, #0x2
    bl func_ov025_021fe174
    ldr r2, [r4, #0xec]
    mov r1, #0x0
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0xec]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0xf4]
    mov r1, #0x0
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0xf4]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r4, #0xa8]
    ldmia sp!, {r4, pc}
.size func_ov025_021fe340, .-func_ov025_021fe340

