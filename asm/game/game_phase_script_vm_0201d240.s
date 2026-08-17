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
.extern data_021052fc
.extern gLupyContext
.extern gDebugFont
.extern gHeapContext
.global func_0201d240
func_0201d240: ; 0x0201d240
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl Scene_Init
    ldr r1, L_0201d2a8
    add r0, r4, #0x2c
    str r1, [r4, #0x0]
    bl OverlaySlot_Init
    str r6, [r4, #0x38]
    str r5, [r4, #0x3c]
    mov r1, #0x0
    str r1, [r4, #0x40]
    ldr r0, L_0201d2ac
    str r1, [r4, #0x24]
    ldr r0, [r0, #0x0]
    ldrh r0, [r0, #0xb0]
    tst r0, #0x1
    moveq r1, #0x1
    mov r0, r1, lsl #0x10
    mov r1, r0, asr #0x10
    mov r0, r4
    str r1, [r4, #0x28]
    bl Scene_SetFlags03
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_0201d2a8: .word data_020d5d58
L_0201d2ac: .word gLupyContext


.size func_0201d240, . - func_0201d240
