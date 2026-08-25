; Matching retail form; see src/game/overlay52_scene_lifecycle.c.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern Heap_Free
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_StartTransition
.extern DisplayBrightness_GetCurrent
.extern OverlayManager_GetGlobal
.extern OverlayManager_LoadOverlay
.extern OverlayManager_UnloadOverlay
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern Heap_Alloc
.extern Overlay052Scene_Init
.extern Overlay052Scene_SetMessageById
.extern Overlay052Scene_UpdateMessageMenu
.extern Overlay052Scene_BeginConfirmationFade
.extern Sound_Play
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern GamePhaseState_UpdateRenderHelpers
.extern gOverlay52SceneVTable
.extern gOverlay52ChildAllocationTag
.extern gDisplayBrightnessPair
.extern gDebugFont
.extern gHeapContext
.extern gSoundContext
.extern gGamePhaseRuntime
.global GamePhaseRuntime_UpdateStateRenderHelpers
GamePhaseRuntime_UpdateStateRenderHelpers: ; 0x0201d220
    stmdb sp!, {r3, lr}
    ldr r0, L_0201d23c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0201d23c: .word gGamePhaseRuntime


.size GamePhaseRuntime_UpdateStateRenderHelpers, . - GamePhaseRuntime_UpdateStateRenderHelpers
