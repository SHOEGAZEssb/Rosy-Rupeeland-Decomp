; Matching retail form; see src/game/game_phase_touch_prompt_runtime.c.
.text
.extern SceneManager_GetCurrent
.extern gGamePhaseRuntime
.extern GamePhaseTouchPrompt_UpdateInteraction
.extern GamePhaseTouchPrompt_UpdateHideSequence
.extern GamePhaseTouchPrompt_UpdateAlternateHideSequence
.extern ActorDerivedType1_IsActiveRecordType69
.extern ActorDerivedType1_IsActiveRecordType6A
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern SpritePresentation_SetAnimation
.extern SpritePresentation_GetAnimation
.extern gSceneManager
.global GamePhaseTouchPrompt_Update
GamePhaseTouchPrompt_Update:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq L_02010510
    ldr r1, L_02010518
    ldr r0, L_0201051c
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r5, [r1, #0xea4]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x9
    bgt L_02010434
    bge L_02010468
    cmp r0, #0x2
    bgt L_02010468
    cmp r0, #0x1
    blt L_02010468
    beq L_0201043c
    cmp r0, #0x2
    b L_02010468
L_02010434:
    cmp r0, #0x12
    b L_02010468
L_0201043c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    mov r0, r4
    beq L_02010460
    bl GamePhaseTouchPrompt_UpdateAlternateHideSequence
    b L_02010470
L_02010460:
    bl GamePhaseTouchPrompt_UpdateInteraction
    b L_02010470
L_02010468:
    mov r0, r4
    bl GamePhaseTouchPrompt_UpdateHideSequence
L_02010470:
    ldr r0, [r4, #0x1c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x18]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r5, #0x230]
    tst r0, #0x800
    beq L_020104f4
    mov r0, r5
    bl ActorDerivedType1_IsActiveRecordType69
    cmp r0, #0x0
    beq L_020104c4
    ldr r0, [r4, #0x1c]
    bl SpritePresentation_GetAnimation
    cmp r0, #0x3
    beq L_02010510
    ldr r0, [r4, #0x1c]
    mov r1, #0x3
    bl SpritePresentation_SetAnimation
    b L_02010510
L_020104c4:
    mov r0, r5
    bl ActorDerivedType1_IsActiveRecordType6A
    cmp r0, #0x0
    beq L_02010510
    ldr r0, [r4, #0x1c]
    bl SpritePresentation_GetAnimation
    cmp r0, #0x1
    beq L_02010510
    ldr r0, [r4, #0x1c]
    mov r1, #0x1
    bl SpritePresentation_SetAnimation
    b L_02010510
L_020104f4:
    ldr r0, [r4, #0x1c]
    bl SpritePresentation_GetAnimation
    cmp r0, #0x0
    beq L_02010510
    ldr r0, [r4, #0x1c]
    mov r1, #0x0
    bl SpritePresentation_SetAnimation
L_02010510:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02010518: .word gGamePhaseRuntime
L_0201051c: .word gSceneManager
    .size GamePhaseTouchPrompt_Update, . - GamePhaseTouchPrompt_Update

