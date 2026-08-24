.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.
.extern data_020c9670
.extern gGamePhaseRuntime
.extern data_ov093_022187f0
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Actor_UpdatePresentation
.extern Graphics3dPresentation_CreatePreset31VariantRegionSpriteEffectAt

.global func_ov093_02218514
func_ov093_02218514:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r1
    bl Actor_UpdatePresentation
    mov r0, #0x4
    str r0, [sp, #0x0]
    add r0, r10, #0x200
    ldrh r1, [r0, #0x3c]
    ldr r0, .L_022186b0
    ldr r3, [r10, #0x24c]
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r2, [r0, r1]
    ldr r0, [r10, #0x204]
    mov r1, #0x180000
    add r2, r2, r2, lsl #0x1
    add r2, r3, r2
    add r2, r2, #0x240000
    mov r3, #0x0
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r0, [r10, #0x204]
    mov r1, #0x2
    strb r1, [r0, #0x3a]
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x208]
    mov r1, #0x180000
    mov r2, #0x198000
    mov r3, #0x0
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r1, [r10, #0x244]
    mov r3, #0x0
    cmp r1, #0x80000
    ldrlt r0, [r10, #0x248]
    sublt r0, r0, r1
    addlt r4, r0, #0x80000
    ldrge r4, [r10, #0x248]
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x210]
    mov r2, r4
    mov r1, #0x180000
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r0, .L_022186b4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    ldr r1, [r10, #0x210]
    mov r6, r0
    ldrb r1, [r1, #0x38]
    cmp r1, #0x1
    bne .L_02218610
    add r1, r10, #0x100
    ldrh r1, [r1, #0xfe]
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1e
    adds r1, r2, r1, ror #0x1e
    bne .L_02218610
    mov r1, r4, asr #0xc
    sub r3, r1, #0xc
    mov r1, #0x0
    mov r2, #0x180
    bl Graphics3dPresentation_CreatePreset31VariantRegionSpriteEffectAt
.L_02218610:
    ldr r5, .L_022186b8
    mov r7, #0x0
    add r4, r10, #0x100
    mov r11, #0x4
.L_02218620:
    add r3, r10, r7, lsl #0x2
    ldr r0, [r3, #0x214]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x10
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    bne .L_022186a0
    ldr r2, [r10, #0x244]
    cmp r2, #0x80000
    ldrlt r1, [r3, #0x228]
    sublt r1, r1, r2
    addlt r9, r1, #0x80000
    mov r1, #0x14
    mul r1, r7, r1
    ldrge r9, [r3, #0x228]
    ldr r8, [r5, r1]
    mov r2, r9
    mov r1, r8
    str r11, [sp, #0x0]
    mov r3, #0x0
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldrh r0, [r4, #0xfe]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r0, r1, r0, ror #0x1d
    bne .L_022186a0
    mov r3, r9, asr #0xc
    mov r0, r6
    mov r1, #0x0
    mov r2, r8, asr #0xc
    sub r3, r3, #0xc
    bl Graphics3dPresentation_CreatePreset31VariantRegionSpriteEffectAt
.L_022186a0:
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_02218620
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022186b0: .word data_020c9670
.L_022186b4: .word gGamePhaseRuntime
.L_022186b8: .word data_ov093_022187f0
.size func_ov093_02218514, . - func_ov093_02218514
