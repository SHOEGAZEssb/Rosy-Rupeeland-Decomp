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
.global Overlay52Scene_DestroyAndFree
Overlay52Scene_DestroyAndFree: ; 0x0201d094
    stmdb sp!, {r4, lr}
    ldr r1, L_0201d0f0
    mov r4, r0
    str r1, [r4, #0x0]
    bl Scene_ClearFlags03
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq L_0201d0c0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201d0c0:
    bl OverlayManager_GetGlobal
    mov r1, #0x0
    bl OverlayManager_UnloadOverlay
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201d0f0: .word gOverlay52SceneVTable


.size Overlay52Scene_DestroyAndFree, . - Overlay52Scene_DestroyAndFree
