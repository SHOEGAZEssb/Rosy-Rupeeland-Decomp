; Matching retail form; see src/game/overlay_prompt_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d653c
.extern gOverlayPromptWorkerAllocationTag
.extern DisplayBrightness_IsSubTransitionComplete
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern OverlaySlot_LoadOverlay
.extern OverlaySlot_UnloadOverlay
.extern GamePhaseCurrencyHud_SetVisible
.extern TimedSpritePresentation_InitBase
.extern func_0201e28c
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern SceneInputBase_Update
.extern func_02092c8c
.extern func_ov001_021fbe6c
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gLupyContext

.global func_02022558
    .type func_02022558, @function
func_02022558: ; 0x02022558
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    cmp r1, #0x0
    ldrne r0, [r0, #0xc]
    cmpne r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    ldmia sp!, {r3, pc}
    .size func_02022558, .-func_02022558

