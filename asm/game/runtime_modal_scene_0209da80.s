.text
; Matching fallback for the portable implementation in src/game/runtime_modal_scene.c.
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_GetCurrent
.extern DisplayBrightness_StartTransition
.extern GamePhaseRuntime_StageAreaRequest
.extern GamePhaseState_ApplyPlacementState
.extern GameWork_SetFlag
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern RuntimePresentationManager_UpdatePresentations
.extern Scene_ClearFlags03
.extern Sound_StopAllArchiveEffects
.extern Sound_StopAllDirectSequences
.extern VecFx32Object_Destroy
.extern data_020f4e14
.extern func_0209de34
.extern func_0209e3d4
.extern func_0209ed08
.extern func_020befec
.extern gDisplayBrightnessPair
.extern gGamePhaseRuntime
.extern gGameWork
.extern gSoundContext

.global func_0209da80
func_0209da80:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    ldr r1, .L_0209de18
    mov r7, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r7, #0x24]
    bl func_0209e3d4
    ldr r0, [r7, #0x24]
    bl func_0209ed08
    ldr r0, [r7, #0x28]
    cmp r0, #0x0
    beq .L_0209db5c
    ldr r1, [r7, #0x24]
    add r0, sp, #0x8
    bl func_0209de34
    ldr r0, .L_0209de1c
    ldr r2, [sp, #0xc]
    ldr r0, [r0, #0x0]
    cmp r2, #0x0
    add r1, r0, #0x2000
    ldr r3, [r1, #0xed4]
    movlt r1, #0x0
    strlt r1, [sp, #0xc]
    blt .L_0209db00
    ldr r1, [r3, #0x20]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0xc
    sub r1, r1, #0x100
    cmp r2, r1, lsl #0xc
    mov r1, r1, lsl #0xc
    strgt r1, [sp, #0xc]
.L_0209db00:
    ldr r2, [sp, #0x10]
    cmp r2, #0x0
    movlt r1, #0x0
    strlt r1, [sp, #0x10]
    blt .L_0209db30
    ldr r1, [r3, #0x20]
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x4
    sub r1, r1, #0xc0
    cmp r2, r1, lsl #0xc
    mov r1, r1, lsl #0xc
    strgt r1, [sp, #0x10]
.L_0209db30:
    add r1, sp, #0x8
    add r0, r0, #0x24
    bl GamePhaseState_ApplyPlacementState
    ldr r0, .L_0209de1c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_UpdatePresentations
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
.L_0209db5c:
    ldr r1, [r7, #0x24]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq .L_0209db78
    add r0, r0, #0x1c00
    ldrh r0, [r0, #0xac]
    b .L_0209db84
.L_0209db78:
    ldr r0, [r1, #0x18]
    add r0, r0, #0x1c00
    ldrh r0, [r0, #0xa8]
.L_0209db84:
    cmp r0, #0x1
    moveq r6, #0x1
    movne r6, #0x0
    cmp r6, #0x0
    bne .L_0209dbb4
    ldr r0, [r1, #0x8]
    ldrsh r0, [r0, #0xb8]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0209dde4
.L_0209dbb4:
    ldr r0, .L_0209de20
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    bl DisplayBrightness_GetCurrent
    cmp r0, #0x0
    bne .L_0209dc6c
    cmp r6, #0x0
    mov r1, #0x0
    beq .L_0209dc34
    ldr r0, .L_0209de20
    bl DisplayBrightnessPair_GetScreen
    ldr r1, [r7, #0x24]
    mov r4, r0
    ldr r0, [r1, #0x8]
    mov r1, #0x12
    ldrsh r0, [r0, #0xbe]
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    mov r0, r4
    add r1, r1, #0x1
    mov r2, #0x10
    mov r3, #0x1e
    bl DisplayBrightness_StartTransition
    ldr r0, .L_0209de20
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x1e
    bl DisplayBrightness_StartTransition
    b .L_0209dddc
.L_0209dc34:
    ldr r0, .L_0209de20
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x40
    bl DisplayBrightness_StartTransition
    ldr r0, .L_0209de20
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x40
    bl DisplayBrightness_StartTransition
    b .L_0209dddc
.L_0209dc6c:
    cmp r0, #0x10
    mvnne r1, #0xf
    cmpne r0, r1
    bne .L_0209dddc
    mov r0, r7
    bl Scene_ClearFlags03
    ldr r1, [r7, #0x24]
    ldr r0, [r7, #0x28]
    ldr r1, [r1, #0x90]
    cmp r0, #0x1
    moveq r0, #0xa
    muleq r4, r1, r0
    movne r0, #0x190
    mulne r4, r1, r0
    ldr r0, .L_0209de24
    moveq r5, #0x1
    ldr r1, .L_0209de28
    ldr r0, [r0, #0x0]
    movne r5, #0x0
    bl GameWork_SetFlag
    cmp r7, #0x0
    beq .L_0209dcd4
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0209dcd4:
    cmp r6, #0x0
    mov r1, #0x0
    beq .L_0209dd5c
    cmp r5, #0x0
    str r1, [sp, #0x0]
    beq .L_0209dd0c
    ldr r0, .L_0209de1c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x15
    mov r2, #0x80
    mov r3, #0x120
    bl GamePhaseRuntime_StageAreaRequest
    b .L_0209dd28
.L_0209dd0c:
    ldr r0, .L_0209de1c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    ldr r2, .L_0209de2c
    mov r1, #0xc0
    mov r3, #0x70
    bl GamePhaseRuntime_StageAreaRequest
.L_0209dd28:
    ldr r1, .L_0209de24
    mov r2, #0x1
    ldr r0, [r1, #0x0]
    cmp r5, #0x0
    add r0, r0, #0x100
    strh r2, [r0, #0xe4]
    ldr r0, [r1, #0x0]
    str r4, [r0, #0x7d8]
    beq .L_0209ddb8
    ldr r0, [r1, #0x0]
    add r1, r2, #0x14c
    bl GameWork_SetFlag
    b .L_0209ddb8
.L_0209dd5c:
    cmp r5, #0x0
    str r1, [sp, #0x0]
    beq .L_0209dd88
    ldr r0, .L_0209de1c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x15
    mov r2, #0x80
    mov r3, #0x120
    bl GamePhaseRuntime_StageAreaRequest
    b .L_0209dda4
.L_0209dd88:
    ldr r0, .L_0209de1c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    ldr r2, .L_0209de2c
    mov r1, #0xc0
    mov r3, #0x70
    bl GamePhaseRuntime_StageAreaRequest
.L_0209dda4:
    ldr r0, .L_0209de24
    mvn r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x100
    strh r1, [r0, #0xe4]
.L_0209ddb8:
    ldr r0, .L_0209de30
    ldr r0, [r0, #0x0]
    bl Sound_StopAllArchiveEffects
    ldr r0, .L_0209de30
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_StopAllDirectSequences
    mov r0, #0x1
    b .L_0209de10
.L_0209dddc:
    mov r0, #0x0
    b .L_0209de10
.L_0209dde4:
    ldr r1, [r7, #0x34]
    ldr r0, [r1, #0x8]
    cmp r0, #0x1
    moveq r0, #0x0
    streq r0, [r1, #0x8]
    ldr r1, [r7, #0x34]
    ldr r0, [r1, #0x8]
    cmp r0, #0x2
    moveq r0, #0x0
    streq r0, [r1, #0x8]
    mov r0, #0x0
.L_0209de10:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0209de18: .word data_020f4e14
.L_0209de1c: .word gGamePhaseRuntime
.L_0209de20: .word gDisplayBrightnessPair
.L_0209de24: .word gGameWork
.L_0209de28: .word 0x386
.L_0209de2c: .word 0x301
.L_0209de30: .word gSoundContext
.size func_0209da80, . - func_0209da80
