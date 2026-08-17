.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern DebugText_BeginFrame
.extern Sound_Play
.extern gDisplayBrightnessPair
.extern data_ov064_02211de4
.extern DisplayBrightness_StartTransition
.extern DisplayBrightnessPair_GetScreen
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern func_02058ce0
.extern func_02059604
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_020a7c4c
.extern func_020befec
.extern Overlay064VecFx32_Add
.extern Overlay064VecFx32Path_Init
.extern Overlay064VecFx32_Subtract
.extern Overlay064VecFx32_Divide
.extern Overlay064VecFx32_Set
.extern gDebugFont
.extern gSoundContext

.global Overlay064Scene_UpdateMode3
Overlay064Scene_UpdateMode3:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x150
    mov r5, r0
    bl DebugText_BeginFrame
    ldr r0, .L_02211aa4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr lr, .L_02211aa8
    add ip, sp, #0x110
    mov r4, #0x4
.L_02211584:
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_02211584
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_022115b4
    cmp r0, #0x1
    beq .L_02211990
    cmp r0, #0x2
    beq .L_02211a38
    b .L_02211a98
.L_022115b4:
    ldr r0, .L_02211aac
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0xa4]
    sub r0, r0, #0x1
    cmp r0, #0x7f
    movgt r0, #0x7f
    bgt .L_022115d8
    cmp r0, #0x0
    movlt r0, #0x0
.L_022115d8:
    cmp r0, #0x7f
    movge r0, #0x7f
    str r0, [r1, #0xa4]
    bl func_020a7c4c
    ldrsh r0, [r5, #0x74]
    cmp r0, #0x78
    bgt .L_02211840
    add r0, sp, #0x100
    mov r1, #0x100000
    mov r2, #0x20000
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0xf0
    mov r1, #0xc8000
    mov r2, #0x70000
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x60
    add r1, sp, #0xf0
    add r2, sp, #0x100
    bl Overlay064VecFx32_Subtract
    add r0, sp, #0x50
    add r1, sp, #0x60
    mov r2, #0x2000
    bl Overlay064VecFx32_Divide
    add r0, sp, #0xe0
    add r1, sp, #0x100
    add r2, sp, #0x50
    bl Overlay064VecFx32_Add
    add r0, sp, #0x50
    bl VecFx32Object_Destroy
    add r0, sp, #0x60
    bl VecFx32Object_Destroy
    add r0, sp, #0xb0
    add r1, sp, #0x100
    add r2, sp, #0xf0
    add r3, sp, #0xe0
    bl Overlay064VecFx32Path_Init
    ldrsh r0, [r5, #0x74]
    mov r1, #0x78
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r4, r0
    add r0, sp, #0xa0
    add r1, sp, #0xb0
    mov r2, r4
    bl VecFx32Bezier_Evaluate3D
    ldr r0, [sp, #0xa8]
    ldr r1, [r5, #0x68]
    mov r2, r0, asr #0xc
    ldr r0, [sp, #0xa4]
    mov r0, r0, asr #0xc
    strh r0, [r1, #0x2c]
    strh r2, [r1, #0x2e]
    ldr r0, [r5, #0x68]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02211700
    ldrb r1, [r0, #0x38]
    cmp r1, #0x1
    bne .L_02211738
    mov r1, #0x2
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x68]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x68]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02211738
.L_02211700:
    ldrsh r1, [r5, #0x74]
    cmp r1, #0xa
    bne .L_02211728
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x68]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02211738
.L_02211728:
    cmp r1, #0x74
    bne .L_02211738
    mov r1, #0x3
    bl GraphicsSpriteState_SetAnimationIndex
.L_02211738:
    ldrsh r1, [r5, #0x7c]
    ldrsh r2, [r5, #0x7e]
    add r0, sp, #0x100
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl Overlay064VecFx32_Set
    mov r1, #0x0
    add r0, sp, #0xf0
    mov r3, r1
    mov r2, #0x14000
    bl Overlay064VecFx32_Set
    add r0, sp, #0x40
    add r1, sp, #0xf0
    add r2, sp, #0x100
    bl Overlay064VecFx32_Subtract
    add r0, sp, #0x30
    add r1, sp, #0x40
    mov r2, #0x2000
    bl Overlay064VecFx32_Divide
    add r0, sp, #0x20
    add r1, sp, #0x100
    add r2, sp, #0x30
    bl Overlay064VecFx32_Add
    add r0, sp, #0xe0
    add r1, sp, #0x20
    bl VecFx32Object_Assign
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
    add r0, sp, #0x40
    bl VecFx32Object_Destroy
    add r0, sp, #0x70
    add r1, sp, #0x100
    add r2, sp, #0xf0
    add r3, sp, #0xe0
    bl Overlay064VecFx32Path_Init
    mov r2, r4
    add r0, sp, #0x10
    add r1, sp, #0x70
    bl VecFx32Bezier_Evaluate3D
    add r0, sp, #0xa0
    add r1, sp, #0x10
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    ldr r1, [sp, #0xa4]
    ldr r0, [sp, #0xa8]
    ldr r2, [r5, #0x3c]
    mov r1, r1, asr #0xc
    mov r3, r0, asr #0xc
    str r1, [r2, #0x18]
    add r0, sp, #0x70
    str r3, [r2, #0x1c]
    bl VecFx32Triple_Destroy
    add r0, sp, #0xa0
    bl VecFx32Object_Destroy
    add r0, sp, #0xb0
    bl VecFx32Triple_Destroy
    add r0, sp, #0xe0
    bl VecFx32Object_Destroy
    add r0, sp, #0xf0
    bl VecFx32Object_Destroy
    add r0, sp, #0x100
    bl VecFx32Object_Destroy
.L_02211840:
    ldrsh r0, [r5, #0x74]
    add r0, r0, #0x1
    strh r0, [r5, #0x74]
    ldrsh r0, [r5, #0x74]
    cmp r0, #0xb4
    blt .L_02211a98
    ldr r0, [r5, #0x8]
    mov r1, #0x4000000
    add r0, r0, #0x1
    str r0, [r5, #0x8]
    ldr r0, [r1, #0x0]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r1, #0x0]
    ldr r1, [r2, #0x0]
    mov r0, #0x0
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    ldr r2, [r5, #0x30]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x10
    strh r1, [r2, #0x24]
    ldr r2, [r5, #0x34]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x10
    strh r1, [r2, #0x24]
    ldr r2, [r5, #0x38]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x10
    strh r1, [r2, #0x24]
    ldr r2, [r5, #0x68]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x10
    strh r1, [r2, #0x24]
.L_022118d0:
    add r1, r5, r0, lsl #0x2
    ldr r2, [r1, #0x48]
    add r0, r0, #0x1
    ldrh r1, [r2, #0x24]
    cmp r0, #0x8
    bic r1, r1, #0x10
    strh r1, [r2, #0x24]
    blt .L_022118d0
    ldr r3, [r5, #0x44]
    mov r1, #0x0
    ldrh r2, [r3, #0x24]
    ldr r0, .L_02211aac
    bic r2, r2, #0x10
    strh r2, [r3, #0x24]
    strh r1, [r5, #0x74]
    ldr r0, [r0, #0x0]
    bl func_02058ce0
    mvn r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    ldr r0, .L_02211aac
    str r3, [sp, #0xc]
    ldr r0, [r0, #0x0]
    ldr r2, .L_02211ab0
    add r1, r3, #0x1000
    bl func_02059604
    ldr r1, .L_02211aac
    mov r0, #0x7f
    ldr r1, [r1, #0x0]
    str r0, [r1, #0xa4]
    bl func_020a7c4c
    ldr r0, .L_02211aac
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x44
    bl Sound_Play
    ldr r0, .L_02211aac
    ldr r1, .L_02211ab4
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, .L_02211aac
    ldr r1, .L_02211ab4
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    b .L_02211a98
.L_02211990:
    ldrsh r0, [r5, #0x74]
    add r0, r0, #0x1
    strh r0, [r5, #0x74]
    ldrsh r0, [r5, #0x74]
    cmp r0, #0x3c
    ble .L_022119f0
    ldr r1, [r5, #0x8]
    ldr r0, .L_02211ab8
    add r1, r1, #0x1
    str r1, [r5, #0x8]
    mov r1, #0x0
    strh r1, [r5, #0x74]
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x5a
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02211ab8
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x5a
    bl DisplayBrightness_StartTransition
.L_022119f0:
    mov lr, #0x0
    add r3, sp, #0x110
.L_022119f8:
    add ip, r5, lr, lsl #0x2
    ldr r4, [ip, #0x48]
    ldr r2, [r3, lr, lsl #0x3]
    ldrsh r1, [r4, #0x2c]
    add r0, r3, lr, lsl #0x3
    add lr, lr, #0x1
    add r1, r2, r1
    strh r1, [r4, #0x2c]
    ldr r2, [ip, #0x48]
    ldr r1, [r0, #0x4]
    ldrsh r0, [r2, #0x2e]
    cmp lr, #0x8
    add r0, r1, r0
    strh r0, [r2, #0x2e]
    blt .L_022119f8
    b .L_02211a98
.L_02211a38:
    mov lr, #0x0
    add r3, sp, #0x110
.L_02211a40:
    add ip, r5, lr, lsl #0x2
    ldr r4, [ip, #0x48]
    ldr r2, [r3, lr, lsl #0x3]
    ldrsh r1, [r4, #0x2c]
    add r0, r3, lr, lsl #0x3
    add lr, lr, #0x1
    add r1, r2, r1
    strh r1, [r4, #0x2c]
    ldr r2, [ip, #0x48]
    ldr r1, [r0, #0x4]
    ldrsh r0, [r2, #0x2e]
    cmp lr, #0x8
    add r0, r1, r0
    strh r0, [r2, #0x2e]
    blt .L_02211a40
    ldrsh r0, [r5, #0x74]
    add r0, r0, #0x1
    strh r0, [r5, #0x74]
    ldrsh r0, [r5, #0x74]
    cmp r0, #0x5a
    movgt r0, #0x1
    bgt .L_02211a9c
.L_02211a98:
    mov r0, #0x0
.L_02211a9c:
    add sp, sp, #0x150
    ldmia sp!, {r3, r4, r5, pc}
.L_02211aa4: .word gDebugFont
.L_02211aa8: .word data_ov064_02211de4
.L_02211aac: .word gSoundContext
.L_02211ab0: .word 0x20a
.L_02211ab4: .word 0x167
.L_02211ab8: .word gDisplayBrightnessPair
.size Overlay064Scene_UpdateMode3, . - Overlay064Scene_UpdateMode3
