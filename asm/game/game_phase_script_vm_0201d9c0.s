; Matching retail form; see src/game/overlay33_runtime_scene.c.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern Scene_Destroy
.extern Heap_Alloc
.extern Heap_Free
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern OverlaySlot_LoadOverlay
.extern OverlaySlot_UnloadOverlay
.extern func_ov033_021fd070
.extern func_ov030_021fd260
.extern Overlay014_UpdatePresentationEnabled
.extern func_ov033_021fd37c
.extern func_ov033_021fd324
.extern GamePhaseRuntime_UpdateDualScreenUiPresentation
.extern GamePhaseRuntime_PrepareActorCollections
.extern GamePhaseRuntime_FinalizeActorCollections
.extern GamePhaseRuntime_SynchronizeActorPlacement
.extern RuntimePresentationManager_UpdatePresentations
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_Update
.extern gOverlay33RuntimeSceneVTable
.extern gOverlay33RuntimeSceneChildAllocationTag
.extern data_020d36e1
.extern gGamePhaseRuntime
.extern gGamePhaseCurrencyHud
.extern gHeapContext
.global GamePhaseRuntime_InvokeRootMethod0C
GamePhaseRuntime_InvokeRootMethod0C: ; 0x0201d9c0
    stmdb sp!, {r3, lr}
    ldr r0, L_0201d9e0
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0201d9e0: .word gGamePhaseRuntime


.size GamePhaseRuntime_InvokeRootMethod0C, . - GamePhaseRuntime_InvokeRootMethod0C
