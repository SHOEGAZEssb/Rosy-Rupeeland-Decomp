.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_021052fc
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Triple_Set
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Graphics3dPresentation_CreatePreset30ColoredRegionSpriteEffectAt
.extern func_020befec
.extern func_ov095_0221b6d8
.extern func_ov095_0221bed0

.global Overlay095Actor_UpdateHopPositionTransition
Overlay095Actor_UpdateHopPositionTransition:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x54
    mov r4, r0
    ldrsh r0, [r4, #0xac]
    cmp r0, #0xff
    moveq r0, #0x0
    streqh r0, [r4, #0xda]
    beq .L_0221ba28
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x1
    bne .L_0221b810
    ldr r1, [r4, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    moveq r0, #0x1
    beq .L_0221ba28
.L_0221b810:
    cmp r0, #0x3
    bne .L_0221b834
    ldr r1, [r4, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    moveq r0, #0x1
    beq .L_0221ba28
.L_0221b834:
    ldrsh r1, [r4, #0xae]
    cmp r1, #0x0
    ble .L_0221b9b0
    sub r1, r1, #0x1
    add r0, sp, #0x44
    strh r1, [r4, #0xae]
    bl VecFx32Object_Init
    ldr r2, [r4, #0x2a0]
    ldr r1, [r4, #0xb4]
    mov r0, r4
    sub r1, r1, r2
    add r1, r1, r1, lsr #0x1f
    add r1, r2, r1, asr #0x1
    str r1, [sp, #0x48]
    bl func_ov095_0221b6d8
    cmp r0, #0x0
    beq .L_0221b8ec
    ldr r0, [r4, #0x2a4]
    str r0, [sp, #0x4c]
    ldr r0, [r4, #0x2a8]
    add r0, r0, #0x50000
    str r0, [sp, #0x50]
    ldrsh r0, [r4, #0xae]
    cmp r0, #0x1a
    ble .L_0221b910
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    bne .L_0221b910
    ldr r0, .L_0221ba30
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    ldr r2, .L_0221ba34
    mov r1, #0x0
    str r2, [sp, #0x0]
    ldr r2, [r4, #0x24]
    ldr ip, [r4, #0x1c]
    ldr r3, [r4, #0x20]
    mov r2, r2, asr #0xc
    rsb r3, r2, r3, asr #0xc
    mov r2, ip, asr #0xc
    sub r3, r3, #0x20
    bl Graphics3dPresentation_CreatePreset30ColoredRegionSpriteEffectAt
    b .L_0221b910
.L_0221b8ec:
    ldr r1, [r4, #0x2a4]
    ldr r0, [r4, #0xb8]
    sub r0, r0, r1
    add r0, r0, r0, lsr #0x1f
    add r0, r1, r0, asr #0x1
    str r0, [sp, #0x4c]
    ldr r0, [r4, #0x2a8]
    add r0, r0, #0x30000
    str r0, [sp, #0x50]
.L_0221b910:
    add r5, sp, #0x14
    mov r0, r5
    bl VecFx32Object_Init
    add r0, sp, #0x24
    bl VecFx32Object_Init
    add r0, r5, #0x20
    bl VecFx32Object_Init
    mov r0, r5
    add r1, r4, #0x29c
    add r2, r4, #0xb0
    add r3, sp, #0x44
    bl VecFx32Triple_Set
    add r0, r4, #0x200
    ldrh r1, [r0, #0x9a]
    ldrsh r0, [r4, #0xae]
    sub r0, r1, r0
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x4
    mov r1, r5
    bl VecFx32Bezier_Evaluate3D
    add r0, r4, #0x18
    add r1, sp, #0x4
    bl VecFx32Object_Assign
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    mov r0, #0x2
    strh r0, [r4, #0xda]
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    ldrne r0, [r4, #0x260]
    orrne r0, r0, #0x20
    strne r0, [r4, #0x260]
    add r0, sp, #0x14
    bl VecFx32Triple_Destroy
    add r0, sp, #0x44
    bl VecFx32Object_Destroy
    mov r0, #0x1
    b .L_0221ba28
.L_0221b9b0:
    add r1, r4, #0x200
    ldrh r2, [r1, #0x98]
    cmp r2, #0x0
    beq .L_0221b9e8
    cmp r0, #0x3
    movne r0, #0x3
    strneh r0, [r4, #0xda]
    movne r0, #0x1
    bne .L_0221ba28
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x54]
    bl func_ov095_0221bed0
    b .L_0221b9f4
.L_0221b9e8:
    add r0, r4, #0x23c
    add r1, r4, #0x18
    bl VecFx32Object_Assign
.L_0221b9f4:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x40]
    blx r1
    ldr r1, [r4, #0x260]
    add r0, r4, #0x18
    bic r2, r1, #0x20
    add r1, r4, #0xb0
    str r2, [r4, #0x260]
    bl VecFx32Object_Assign
    mov r0, #0x0
    strh r0, [r4, #0xda]
    mov r0, #0x2
.L_0221ba28:
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, pc}
.L_0221ba30: .word data_021052fc
.L_0221ba34: .word 0x7fff
.size Overlay095Actor_UpdateHopPositionTransition, . - Overlay095Actor_UpdateHopPositionTransition
