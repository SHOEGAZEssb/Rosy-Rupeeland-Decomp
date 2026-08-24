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
.extern func_02092c8c
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
.extern data_020d5d58
.extern data_020d5d8c
.extern data_020d5d94
.extern gGamePhaseRuntime
.extern gGamePhaseCurrencyHud
.extern gDebugFont
.extern gHeapContext
.global func_0201d664
func_0201d664: ; 0x0201d664
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq L_0201d680
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
L_0201d680:
    mov r0, #0x0
    ldmia sp!, {r3, pc}


.size func_0201d664, . - func_0201d664
