; Matching retail form; see src/game/overlay_prompt_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d653c
.extern data_020d65ac
.extern DisplayBrightness_IsSubTransitionComplete
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern OverlaySlot_LoadOverlay
.extern OverlaySlot_UnloadOverlay
.extern func_0201140c
.extern func_0201e250
.extern func_0201e28c
.extern func_020755bc
.extern func_02091fb0
.extern func_02092c8c
.extern func_ov001_021fbe6c
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gLupyContext

.global func_02022530
    .type func_02022530, @function
func_02022530: ; 0x02022530
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    cmp r1, #0x0
    ldrne r0, [r0, #0xc]
    cmpne r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldmia sp!, {r3, pc}
    .size func_02022530, .-func_02022530

