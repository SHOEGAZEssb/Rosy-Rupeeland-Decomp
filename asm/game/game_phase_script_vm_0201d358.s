; Matching retail form; see src/game/overlay_transition_scene.c.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern Scene_Destroy
.extern Heap_Free
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern OverlaySlot_LoadOverlay
.extern OverlaySlot_UnloadOverlay
.extern DisplayBrightness_StartMaskedTransitions
.extern DisplayBrightness_IsSubTransitionComplete
.extern GamePhaseAreaScene_SetEnabled
.extern GamePhaseCurrencyHud_SetVisible
.extern GamePhaseRuntime_SetPlacementMode
.extern GamePhaseRuntime_ApplyScreenMode
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern SceneInputBase_Update
.extern Heap_Alloc
.extern func_ov029_021fd95c
.extern func_ov046_0220c7d8
.extern gOverlayTransitionSceneVTable
.extern gOverlayTransitionKind0AllocationTag
.extern gOverlayTransitionKind1AllocationTag
.extern gGamePhaseRuntime
.extern gGamePhaseCurrencyHud
.extern gDebugFont
.extern gHeapContext
.global OverlayTransitionScene_Update
OverlayTransitionScene_Update: ; 0x0201d358
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x40]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b L_0201d5ec
L_0201d370: ; jump table
    b L_0201d388 ; case 0
    b L_0201d3ac ; case 1
    b L_0201d4b0 ; case 2
    b L_0201d4d4 ; case 3
    b L_0201d504 ; case 4
    b L_0201d5c0 ; case 5
L_0201d388:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl DisplayBrightness_StartMaskedTransitions
    mov r0, #0x2
    sub r1, r0, #0x12
    bl DisplayBrightness_StartMaskedTransitions
    ldr r0, [r4, #0x40]
    add r0, r0, #0x1
    str r0, [r4, #0x40]
L_0201d3ac:
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_0201d5ec
    ldr r0, L_0201d604
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    cmp r0, #0x0
    beq L_0201d3d8
    mov r1, #0x0
    bl GamePhaseAreaScene_SetEnabled
L_0201d3d8:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq L_0201d3f4
    ldr r0, L_0201d608
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
L_0201d3f4:
    ldr r0, L_0201d604
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_SetPlacementMode
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq L_0201d420
    cmp r0, #0x1
    beq L_0201d458
    b L_0201d494
L_0201d420:
    ldr r1, L_0201d60c
    add r0, r4, #0x2c
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0201d610
    ldr r3, L_0201d614
    mov r0, #0x550
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201d450
    ldr r1, [r4, #0x3c]
    bl func_ov029_021fd95c ; func_ov031_021fd95c
L_0201d450:
    str r0, [r4, #0x24]
    b L_0201d494
L_0201d458:
    ldr r1, L_0201d618
    add r0, r4, #0x2c
    bl OverlaySlot_LoadOverlay
    ldr r1, L_0201d61c
    ldr r3, L_0201d614
    mov r0, #0x7c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201d490
    ldr r1, [r4, #0x3c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov046_0220c7d8
L_0201d490:
    str r0, [r4, #0x24]
L_0201d494:
    mov r0, #0x2
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r0, [r4, #0x40]
    add r0, r0, #0x1
    str r0, [r4, #0x40]
    b L_0201d5ec
L_0201d4b0:
    ldr r0, [r4, #0x24]
    mov r1, #0x0
    bl SceneInputBase_Update
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    ldrne r0, [r4, #0x40]
    addne r0, r0, #0x1
    strne r0, [r4, #0x40]
    b L_0201d5ec
L_0201d4d4:
    ldr r0, [r4, #0x24]
    mov r1, #0x1
    bl SceneInputBase_Update
    cmp r0, #0x0
    beq L_0201d5ec
    mov r0, #0x2
    sub r1, r0, #0x12
    bl DisplayBrightness_StartMaskedTransitions
    ldr r0, [r4, #0x40]
    add r0, r0, #0x1
    str r0, [r4, #0x40]
    b L_0201d5ec
L_0201d504:
    ldr r0, [r4, #0x24]
    mov r1, #0x0
    bl SceneInputBase_Update
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_0201d5ec
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_0201d534
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_0201d534:
    mov r1, #0x0
    add r0, r4, #0x2c
    str r1, [r4, #0x24]
    bl OverlaySlot_UnloadOverlay
    ldr r0, L_0201d620
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_0201d604
    ldr r0, [r0, #0x0]
    add r1, r0, #0x2000
    ldr r1, [r1, #0xfb8]
    cmp r1, #0x0
    beq L_0201d588
    mov r1, #0x1
    mov r2, r1
    bl GamePhaseRuntime_ApplyScreenMode
    ldr r0, L_0201d604
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl GamePhaseRuntime_SetPlacementMode
L_0201d588:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq L_0201d5a4
    ldr r0, L_0201d608
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
L_0201d5a4:
    mov r0, #0x3
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r0, [r4, #0x40]
    add r0, r0, #0x1
    str r0, [r4, #0x40]
    b L_0201d5ec
L_0201d5c0:
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_0201d5ec
    cmp r4, #0x0
    beq L_0201d5e4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201d5e4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0201d5ec:
    ldr r0, L_0201d604
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateActorPresentationState
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201d604: .word gGamePhaseRuntime
L_0201d608: .word gGamePhaseCurrencyHud
L_0201d60c: .word 0x1f
L_0201d610: .word gOverlayTransitionKind0AllocationTag
L_0201d614: .word gHeapContext
L_0201d618: .word 0x2e
L_0201d61c: .word gOverlayTransitionKind1AllocationTag
L_0201d620: .word gDebugFont


.size OverlayTransitionScene_Update, . - OverlayTransitionScene_Update
