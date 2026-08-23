; Matching retail form; see src/game/game_phase_state_runtime.c.
.text
.extern GX_SetBankForBG
.extern GX_SetGraphicsMode
.extern GamePhaseVisualEffect_PrepareBackground
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern func_020a2348
.extern func_020a23a8
.extern func_020ae9a4

    .global GamePhaseState_ConfigureMainDisplay
GamePhaseState_ConfigureMainDisplay: ; 0x0200eb58
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020ae9a4
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0x8
    movs r0, r0, asr #0x1f
    beq L_0200eb98
    mov r0, #0x10
    bl GX_SetBankForBG
    mov r0, #0x6
    mov r1, #0x0
    mov r2, #0x1
    bl GX_SetGraphicsMode
    b L_0200ebb0
L_0200eb98:
    mov r0, #0x2
    bl GX_SetBankForBG
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
L_0200ebb0:
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x38000000
    str r0, [r1, #0x0]
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0x8
    movs r0, r0, asr #0x1f
    cmpne r4, #0x0
    add r0, r5, #0x358
    beq L_0200ebf4
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x1
    mov r2, r1
    bl func_020a23a8
    b L_0200ec08
L_0200ebf4:
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x1
    mov r2, #0x0
    bl func_020a2348
L_0200ec08:
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeb0]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x34]
    blx r2
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeb0]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x20]
    blx r2
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeb0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    ldr r0, [r5, #0x0]
    ldrsh r0, [r0, #0x12]
    cmp r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    add r0, r5, #0x2b4
    add r0, r0, #0x2c00
    bl GamePhaseVisualEffect_PrepareBackground
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseState_ConfigureMainDisplay, . - GamePhaseState_ConfigureMainDisplay

