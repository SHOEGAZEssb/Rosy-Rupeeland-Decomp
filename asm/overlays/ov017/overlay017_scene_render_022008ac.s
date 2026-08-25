    .text
/* Exact fallback; see src/overlays/ov017/overlay017_scene_render.c. */
    .extern data_ov017_022016e0
    .extern Graphics3DResourceOwner_RenderManagers
    .extern Graphics3DLight_Apply
    .extern Graphics3DSceneState_Apply
    .extern Graphics3DRenderObject_Draw
    .extern func_020b0558
    .extern Overlay017_RenderGridGeometry
    .extern Overlay017_WritePolygonAttributes
    .extern Overlay017_ClearTextureParameters
    .extern Overlay017Transform_SubmitGeometry
    .extern Overlay017_ResolveEffectResourceEntry
    .extern Overlay017_ExportEffectTransform
    .extern func_ov017_02200a8c
.global func_ov017_022008ac
func_ov017_022008ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_020b0558
    ldr r0, [r5, #0x2bc]
    bl Graphics3DRenderObject_Draw
    add r0, r5, #0x310
    bl Graphics3DSceneState_Apply
    mov r6, #0x0
    add r4, r5, #0x2d0
L_022008d4:
    mov r1, r6
    add r0, r4, r6, lsl #0x4
    bl Graphics3DLight_Apply
    add r6, r6, #0x1
    cmp r6, #0x4
    blt L_022008d4
    ldr r1, L_02200a74
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r1, #0x1f
    str r1, [sp, #0x0]
    mov r1, r0
    mov r3, r0
    mov r2, #0x2
    str r0, [sp, #0x4]
    bl Overlay017_WritePolygonAttributes
    bl Overlay017_ClearTextureParameters
    ldr r1, L_02200a78
    mov r2, #0x0
    add r0, r5, #0x264
    str r2, [r1, #0x0]
    bl Overlay017Transform_SubmitGeometry
    ldr r1, L_02200a7c
    add r0, r5, #0x264
    ldr r1, [r1, #0xc]
    bl Overlay017_ResolveEffectResourceEntry
    ldr r1, L_02200a80
    mov r2, #0x1
    str r2, [r1, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x2
    mov r3, #0x20
    str r0, [sp, #0x4]
    bl Overlay017_WritePolygonAttributes
    ldr r1, L_02200a84
    ldr r2, L_02200a88
    mov r10, #0x0
    ldr r0, L_02200a7c
    str r2, [r1, #0x0]
    ldr r4, [r0, #0x78]
    sub r9, r1, #0x7c
    sub r6, r1, #0x78
    mov r8, r10
    mov r7, #0x1
    b L_022009b4
L_02200994:
    add r0, r4, #0xbc
    str r10, [r9, #0x0]
    bl Overlay017Transform_SubmitGeometry
    mov r1, r8
    add r0, r4, #0xbc
    bl Overlay017_ResolveEffectResourceEntry
    str r7, [r6, #0x0]
    ldr r4, [r4, #0x8]
L_022009b4:
    cmp r4, #0x0
    bne L_02200994
    mov r1, #0x1f
    mov r0, #0x2
    str r1, [sp, #0x0]
    mov r1, #0x0
    mov r2, r0
    mov r3, #0x4
    str r1, [sp, #0x4]
    bl Overlay017_WritePolygonAttributes
    add r1, r5, #0x400
    ldrh r0, [r1, #0x3a]
    ldrh r1, [r1, #0x3c]
    mov r2, #0x1
    bl func_ov017_02200a8c
    ldr r8, [r5, #0x3f0]
    mov r7, #0x0
    ldr r6, L_02200a78
    mov r4, #0x1
    b L_02200a1c
L_02200a04:
    mov r0, r8
    str r7, [r6, #0x0]
    add r1, r5, #0x290
    bl Overlay017_ExportEffectTransform
    str r4, [r6, #0x4]
    ldr r8, [r8, #0x8]
L_02200a1c:
    cmp r8, #0x0
    bne L_02200a04
    add r0, r5, #0x400
    ldrh r0, [r0, #0x38]
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov017_02200a8c
    ldr r0, [r5, #0x2c0]
    bl Overlay017_RenderGridGeometry
    ldr r0, L_02200a78
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r5, #0x240]
    add r1, r5, #0x368
    bl Graphics3DResourceOwner_RenderManagers
    ldr r1, L_02200a80
    mov r0, #0x1
    str r0, [r1, #0x0]
    mov r0, #0x0
    str r0, [r1, #0xf8]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_02200a74: .word 0x40004c4
L_02200a78: .word 0x4000444
L_02200a7c: .word data_ov017_022016e0
L_02200a80: .word 0x4000448
L_02200a84: .word 0x40004c0
L_02200a88: .word 0x2108ffff

    .size func_ov017_022008ac, . - func_ov017_022008ac
