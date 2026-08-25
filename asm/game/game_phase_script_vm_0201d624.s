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
.global OverlayTransitionScene_NotifyRuntimeAndObject
OverlayTransitionScene_NotifyRuntimeAndObject: ; 0x0201d624
    stmdb sp!, {r4, lr}
    ldr r1, L_0201d660
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_0201d658
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
L_0201d658:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201d660: .word gGamePhaseRuntime


.size OverlayTransitionScene_NotifyRuntimeAndObject, . - OverlayTransitionScene_NotifyRuntimeAndObject
