.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern DebugText_BeginFrame
.extern OS_WaitVBlankIntr
.extern Scene_SetFlags03
.extern data_021052fc
.extern data_ov074_02211d34
.extern VecFx32Object_Destroy
.extern SplineMover_Update
.extern SplineMover_Evaluate2D
.extern GamePhaseRuntime_UpdateDualScreenUiPresentation
.extern ActorMotionAreaFollower_RefreshCurrentArea
.extern GamePhaseVisualEffect_SetBlendCoefficients
.extern GamePhaseCurrencyHud_Update
.extern GamePhaseAreaScene_SetEnabled
.extern RuntimePresentationManager_UpdatePresentations
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Type7Actor_ClearBoundaryTransitionFlags
.extern func_020a23a8
.extern func_ov025_021fd2e8
.extern func_ov033_021fd324
.extern func_ov074_022105b4
.extern func_ov074_02210730
.extern func_ov074_022107f8
.extern func_ov074_02211790
.extern func_ov074_022117d0
.extern func_ov074_022119b8
.extern func_ov074_02211a8c
.extern func_ov074_02211b58
.extern gLupyContext

.global func_ov074_022101dc
func_ov074_022101dc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r1, [r4, #0x8]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_02210544
.L_022101f8:
    b .L_02210214
    b .L_02210250
    b .L_022102d0
    b .L_02210394
    b .L_022103c0
    b .L_02210454
    b .L_022104e8
.L_02210214:
    ldr r0, [r4, #0x124]
    cmp r0, #0x0
    beq .L_02210244
    ldr r0, [r4, #0x140]
    tst r0, #0x4
    beq .L_02210244
    add r0, r4, #0x144
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_02210544
.L_02210244:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
.L_02210250:
    ldrh r0, [r4, #0x38]
    cmp r0, #0x2
    blo .L_02210544
    mov r1, #0x0
    mov r2, r1
    add r0, r4, #0x38
    bl func_ov074_022117d0
    bl OS_WaitVBlankIntr
    add r0, r4, #0x38
    mov r1, #0x1
    bl func_ov074_022119b8
    ldr r1, [r4, #0x8]
    ldr r0, .L_022105a8
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_022102a4
    bl Type7Actor_ClearBoundaryTransitionFlags
.L_022102a4:
    bl DebugText_BeginFrame
    ldr r0, .L_022105a8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xe8]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xc]
    blx r3
    b .L_02210544
.L_022102d0:
    ldr r0, [r4, #0x124]
    cmp r0, #0x0
    beq .L_02210314
    add r0, r4, #0xc8
    bl SplineMover_Update
    cmp r0, #0x0
    beq .L_022102fc
    mov r0, r4
    add r1, r4, #0xc8
    bl func_ov074_022107f8
    b .L_02210544
.L_022102fc:
    ldr r0, .L_022105a8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
.L_02210314:
    mov r1, #0x0
    mov r2, r1
    add r0, r4, #0x38
    bl func_ov074_022117d0
    ldr r1, [r4, #0x24]
    mov r0, r4
    add r2, r4, #0x8c
    add r3, r4, #0xc8
    bl func_ov074_022105b4
    ldr r0, .L_022105a8
    mov r5, #0x7
    ldr r1, [r0, #0x0]
    add r0, sp, #0x18
    add r2, r1, #0x2e00
    ldrsh ip, [r2, #0xf6]
    mov r1, #0x0
    mov r3, #0x10
    str ip, [sp, #0x0]
    str r5, [sp, #0x4]
    ldrsh r2, [r2, #0xf4]
    bl func_ov074_02211a8c
    ldr r2, .L_022105ac
    add r1, sp, #0x18
    add r0, r4, #0x15c
    str r2, [sp, #0x18]
    cmp r0, r1
    beq .L_02210384
    bl func_ov074_02211b58
.L_02210384:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_02210544
.L_02210394:
    bl Scene_SetFlags03
    ldr r0, [r4, #0x124]
    cmp r0, #0x0
    beq .L_022103b0
    mov r0, r4
    add r1, r4, #0xc8
    bl func_ov074_022107f8
.L_022103b0:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_02210544
.L_022103c0:
    add r0, r4, #0x50
    bl SplineMover_Update
    add r0, r4, #0x38
    bl func_ov074_02211790
    ldr r0, [r4, #0x140]
    tst r0, #0x4
    beq .L_022103f8
    ldr r0, .L_022105a8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    add r0, r0, #0x2d8
    add r0, r0, #0x2c00
    bl GamePhaseVisualEffect_SetBlendCoefficients
.L_022103f8:
    add r0, r4, #0x8c
    bl SplineMover_Update
    cmp r0, #0x0
    bne .L_02210444
    add r0, r4, #0x38
    mov r1, #0x0
    bl func_ov074_022119b8
    ldr r0, .L_022105a8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_RefreshCurrentArea
    ldr r0, [r4, #0x140]
    orr r0, r0, #0x1
    str r0, [r4, #0x140]
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_02210544
.L_02210444:
    mov r0, r4
    add r1, r4, #0x8c
    bl func_ov074_02210730
    b .L_02210544
.L_02210454:
    ldr r0, [r4, #0x140]
    tst r0, #0x2
    beq .L_02210544
    ldr r0, .L_022105a8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x1
    mov r2, #0x0
    bl func_020a23a8
    ldr r3, .L_022105a8
    mov lr, #0x4000000
    ldr r0, [r3, #0x0]
    mov r1, #0x1
    add r0, r0, #0x3000
    ldrb r5, [r0, #0xcc]
    mov r2, #0x1f
    bic r5, r5, #0x4
    strb r5, [r0, #0xcc]
    ldr ip, [lr, #0x0]
    ldr r0, [lr, #0x0]
    and ip, ip, #0x1f00
    mov r5, ip, lsr #0x8
    bic ip, r0, #0x1f00
    orr r0, r5, #0x1
    orr r0, ip, r0, lsl #0x8
    str r0, [lr, #0x0]
    ldr r0, [r3, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xe8]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xc]
    blx r3
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
.L_022104e8:
    ldr r0, .L_022105a8
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateDualScreenUiPresentation
    ldr r0, [r4, #0x124]
    cmp r0, #0x0
    beq .L_02210524
    ldr r0, [r4, #0x140]
    tst r0, #0x4
    beq .L_02210524
    add r0, r4, #0x15c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_02210544
.L_02210524:
    cmp r4, #0x0
    beq .L_0221053c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221053c:
    mov r0, #0x1
    b .L_022105a0
.L_02210544:
    ldr r0, .L_022105a8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_UpdatePresentations
    ldr r0, [r4, #0x128]
    cmp r0, #0x0
    beq .L_02210590
    add r0, sp, #0x8
    add r1, r4, #0x8c
    bl SplineMover_Evaluate2D
    ldr r0, [r4, #0x128]
    add r1, sp, #0x8
    bl func_ov033_021fd324
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    ldr r0, [r4, #0x128]
    bl func_ov025_021fd2e8
.L_02210590:
    ldr r0, .L_022105b0
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_Update
    mov r0, #0x0
.L_022105a0:
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_022105a8: .word data_021052fc
.L_022105ac: .word data_ov074_02211d34
.L_022105b0: .word gLupyContext
.size func_ov074_022101dc, . - func_ov074_022101dc
