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
.extern func_020755bc
.extern Heap_Alloc
.extern func_ov052_0220d618
.extern func_ov052_0220e14c
.extern func_ov052_0220da54
.extern func_ov052_0220e178
.extern Sound_Play
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern GamePhaseState_UpdateRenderHelpers
.extern data_020d5d24
.extern data_020d5d84
.extern data_020f4dc8
.extern gDebugFont
.extern gHeapContext
.extern gSoundContext
.extern data_021052fc
.global func_0201d220
func_0201d220: ; 0x0201d220
    stmdb sp!, {r3, lr}
    ldr r0, L_0201d23c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0201d23c: .word data_021052fc


.size func_0201d220, . - func_0201d220
