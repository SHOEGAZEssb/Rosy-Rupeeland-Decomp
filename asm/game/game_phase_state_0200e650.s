; Matching retail form; see src/game/game_phase_state_configuration.c.
.text
.extern GX_DisableBankForLCDC
.extern GX_SetBankForBG
.extern GX_SetGraphicsMode
.extern GamePhaseState_ApplyConfiguration
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern ActorCollection_CreateSpriteGroupForDisplayMode
.extern ActorCollection_SetEnabled
.extern Graphics3dPresentation_Disable
.extern Graphics3dPresentation_Enable
.extern func_020ae740

    .global GamePhaseState_ConfigureForPhase
GamePhaseState_ConfigureForPhase: ; 0x0200e650
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r1, #0x40]
    mov r0, r0, lsl #0x8
    movs r0, r0, asr #0x1f
    beq L_0200e6a4
    mov r0, #0x10
    bl GX_SetBankForBG
    bl GX_DisableBankForLCDC
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl GX_SetGraphicsMode
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x1
    mov r2, r1
    bl Graphics3dPresentation_Enable
    b L_0200e6ec
L_0200e6a4:
    bl func_020ae740
    mov r0, #0x2
    bl GX_SetBankForBG
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x1
    mov r2, #0x0
    bl Graphics3dPresentation_Disable
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r1, #0x0]
L_0200e6ec:
    add r0, r4, #0x4
    mov r1, #0x1
    bl ActorCollection_CreateSpriteGroupForDisplayMode
    add r0, r4, #0x4
    mov r1, #0x0
    bl ActorCollection_SetEnabled
    ldr r1, [r4, #0x0]
    mov r0, r4
    bl GamePhaseState_ApplyConfiguration
    ldmia sp!, {r4, pc}
    .size GamePhaseState_ConfigureForPhase, . - GamePhaseState_ConfigureForPhase

