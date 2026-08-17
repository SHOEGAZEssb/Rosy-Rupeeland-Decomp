; Matching retail form; see src/game/game_phase_touch_prompt_states.c.
.text
.extern GameWork_TestFlag
.extern SceneManager_GetCurrent
.extern SceneManager_SetUpdateEnabled
.extern TouchPanelManager_GetPoint
.extern data_020c3630
.extern data_021052fc
.extern ActorDerivedType1_TeardownActiveRecord
.extern ActorDerivedType1_IsActiveRecordType69
.extern ActorDerivedType1_IsActiveRecordType6A
.extern ActorDerivedType1_IsIdleEligible
.extern GraphicsSpriteState_TestTouchPoint
.extern Presentation_SetScript
.extern Presentation_IsScriptComplete
.extern Presentation_IsScriptSuspended
.extern SpritePresentation_Show
.extern SpritePresentation_Hide
.extern gGameWork
.extern gSceneManager
.extern gTouchPanelManager

    .global GamePhaseTouchPrompt_UpdateInteraction
GamePhaseTouchPrompt_UpdateInteraction: ; 0x0201054c
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr r1, L_02010710
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x3ec
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldr r0, [r4, #0x1c]
    beq L_020106f4
    bl SpritePresentation_Show
    ldr r0, [r4, #0x28]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_020106f8
L_02010588: ; jump table
    b L_0201059c ; case 0
    b L_020105c4 ; case 1
    b L_020106b4 ; case 2
    b L_020106c0 ; case 3
    b L_020106d8 ; case 4
L_0201059c:
    ldr r0, [r4, #0x1c]
    bl Presentation_IsScriptSuspended
    cmp r0, #0x0
    beq L_020106f8
    ldr r0, [r4, #0x1c]
    mov r1, #0x0
    str r1, [r0, #0x90]
    mov r0, #0x1
    str r0, [r4, #0x28]
    b L_020106f8
L_020105c4:
    ldr r0, L_02010714
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0x4]
    cmp r0, #0x1
    bne L_020106f8
    ldr r2, L_02010718
    add r0, sp, #0x0
    ldr r2, [r2, #0x0]
    add r2, r2, #0x2000
    ldr r5, [r2, #0xea4]
    bl TouchPanelManager_GetPoint
    ldr r0, [r4, #0x1c]
    add r1, sp, #0x0
    ldr r0, [r0, #0x9c]
    bl GraphicsSpriteState_TestTouchPoint
    cmp r0, #0x0
    beq L_020106f8
    ldr r0, [r5, #0x230]
    tst r0, #0x800
    beq L_02010640
    mov r0, r5
    bl ActorDerivedType1_IsActiveRecordType69
    cmp r0, #0x0
    bne L_02010634
    mov r0, r5
    bl ActorDerivedType1_IsActiveRecordType6A
    cmp r0, #0x0
    beq L_020106a0
L_02010634:
    mov r0, r5
    bl ActorDerivedType1_TeardownActiveRecord
    b L_020106a0
L_02010640:
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_02010674
    ldr r0, L_0201071c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r2, [r0, #0x0]
    mov r1, #0x64
    ldr r2, [r2, #0x20]
    blx r2
    b L_020106a0
L_02010674:
    mov r0, r5
    bl ActorDerivedType1_IsIdleEligible
    cmp r0, #0x0
    beq L_020106a0
    ldr r0, L_0201071c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r2, [r0, #0x0]
    mov r1, #0x64
    ldr r2, [r2, #0x20]
    blx r2
L_020106a0:
    ldr r0, L_0201071c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl SceneManager_SetUpdateEnabled
    b L_02010708
L_020106b4:
    ldr r0, [r4, #0x2c]
    str r0, [r4, #0x28]
    b L_020106f8
L_020106c0:
    ldr r0, [r4, #0x1c]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    movne r0, #0x4
    strne r0, [r4, #0x28]
    b L_020106f8
L_020106d8:
    ldr r0, [r4, #0x1c]
    ldr r1, L_02010720
    mov r2, #0x0
    bl Presentation_SetScript
    mov r0, #0x0
    str r0, [r4, #0x28]
    b L_020106f8
L_020106f4:
    bl SpritePresentation_Hide
L_020106f8:
    ldr r0, L_0201071c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl SceneManager_SetUpdateEnabled
L_02010708:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_02010710: .word gGameWork
L_02010714: .word gTouchPanelManager
L_02010718: .word data_021052fc
L_0201071c: .word gSceneManager
L_02010720: .word data_020c3630
    .size GamePhaseTouchPrompt_UpdateInteraction, . - GamePhaseTouchPrompt_UpdateInteraction

