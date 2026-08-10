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
.global func_0201cfd0
func_0201cfd0: ; 0x0201cfd0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Scene_Init
    ldr r1, L_0201d030
    ldr r0, L_0201d034
    str r1, [r5, #0x0]
    str r4, [r5, #0x24]
    mov r2, #0x0
    mov r1, #0x1
    str r2, [r5, #0x28]
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x8
    bl DisplayBrightness_StartTransition
    bl OverlayManager_GetGlobal
    mov r1, #0x0
    ldr r2, L_0201d038
    bl OverlayManager_LoadOverlay
    mov r0, r5
    bl Scene_SetFlags03
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_0201d030: .word data_020d5d24
L_0201d034: .word data_020f4dc8
L_0201d038: .word 0x34


.size func_0201cfd0, . - func_0201cfd0
