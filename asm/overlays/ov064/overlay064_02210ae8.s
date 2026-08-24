.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern gGamePhaseRuntime
.extern VecFx32Object_Destroy
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseRuntime_SynchronizeActorPlacement
.extern GamePhaseRuntime_BuildSecondaryTransform
.extern GamePhaseRuntime_UpdateDualScreenUiPresentation
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_Update
.extern RuntimePresentationManager_UpdatePresentations
.extern ActorCollection_DispatchEventToActors
.extern ActorCollection_GetSpriteGroup
.extern ActorFeedback_UpdatePresentations
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern gGamePhaseCurrencyHud

.global Overlay064Scene_Update
Overlay064Scene_Update:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x70]
    tst r0, #0x1
    add r0, r5, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r5, #0x6c]
    ldrne r1, [r2, r1]
    ldreq r1, [r5, #0x6c]
    blx r1
    ldrb r1, [r5, #0x77]
    mov r4, r0
    cmp r1, #0x3
    beq .L_02210c10
    ldr r0, .L_02210c54
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    bl ActorFeedback_UpdatePresentations
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    ldr r1, .L_02210c54
    mov r6, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    mov r0, r6
    bl ActorCollection_DispatchEventToActors
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r1, .L_02210c54
    add r0, sp, #0x0
    ldr r1, [r1, #0x0]
    bl GamePhaseRuntime_BuildSecondaryTransform
    ldr r0, .L_02210c54
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r1, sp, #0x0
    bl ActorCollection_DispatchEventToActors
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r0, .L_02210c54
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_UpdatePresentations
    ldr r0, .L_02210c58
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_Update
    ldr r0, .L_02210c54
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateDualScreenUiPresentation
    b .L_02210c20
.L_02210c10:
    ldr r0, [r5, #0x3c]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r5, #0x40]
    bl GraphicsSpriteGroup_AdvanceAnimations
.L_02210c20:
    cmp r4, #0x0
    beq .L_02210c48
    cmp r5, #0x0
    beq .L_02210c40
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210c40:
    mov r0, #0x1
    b .L_02210c4c
.L_02210c48:
    mov r0, #0x0
.L_02210c4c:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02210c54: .word gGamePhaseRuntime
.L_02210c58: .word gGamePhaseCurrencyHud
.size Overlay064Scene_Update, . - Overlay064Scene_Update
