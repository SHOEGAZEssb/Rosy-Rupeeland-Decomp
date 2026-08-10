.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern SceneManager_GetCurrent
.extern data_020c9670
.extern data_021052fc
.extern func_02005058
.extern func_020050a4
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern VecFx32Bezier_Evaluate3D
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern func_02009d78
.extern Actor_RefreshTerrainHeight
.extern func_020befec
.extern gSceneManager

.global func_ov062_022104d0
func_ov062_022104d0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    ldr r1, .L_02210644
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl SceneManager_GetCurrent
    cmp r0, r4
    movne r0, #0x0
    bne .L_0221063c
    ldr r0, .L_02210648
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateActorPresentationState
    ldr r0, [r4, #0x34]
    add r1, r0, #0x1
    str r1, [r4, #0x34]
    ldr r0, [r4, #0x38]
    cmp r1, r0
    strgt r0, [r4, #0x34]
    ldr r0, [r4, #0x34]
    ldr r1, [r4, #0x38]
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    ldr r1, [r4, #0x30]
    add r0, sp, #0x10
    bl VecFx32Bezier_Evaluate3D
    ldr r0, [r4, #0x34]
    ldr r1, [r4, #0x38]
    mov r0, r0, lsl #0xf
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x2
    ldr r0, .L_0221064c
    ldr ip, [sp, #0x1c]
    ldrsh r0, [r0, r2]
    ldr r3, [r4, #0x40]
    add r1, sp, #0x10
    mla r0, r3, r0, ip
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x24]
    add r0, r0, #0x18
    bl func_020050a4
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x28]
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r1, [r4, #0x28]
    ldrh r0, [r1, #0x28]
    sub r0, r0, #0x8
    strh r0, [r1, #0x28]
    ldr r0, [r4, #0x24]
    bl Actor_RefreshTerrainHeight
    ldr r0, .L_02210648
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    ldr r1, [r4, #0x24]
    mov r2, r0
    ldr r3, [r1, #0x0]
    add r0, sp, #0x4
    ldr r3, [r3, #0x58]
    blx r3
    ldr r0, [r4, #0x24]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x34]
    ldr r0, [r4, #0x38]
    cmp r1, r0
    bne .L_02210630
    cmp r4, #0x0
    beq .L_02210620
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210620:
    add r0, sp, #0x10
    bl func_02005058
    mov r0, #0x1
    b .L_0221063c
.L_02210630:
    add r0, sp, #0x10
    bl func_02005058
    mov r0, #0x0
.L_0221063c:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_02210644: .word gSceneManager
.L_02210648: .word data_021052fc
.L_0221064c: .word data_020c9670
.size func_ov062_022104d0, . - func_ov062_022104d0
