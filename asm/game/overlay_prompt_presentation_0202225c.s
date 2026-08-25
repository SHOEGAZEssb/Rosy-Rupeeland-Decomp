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
.extern FieldEffect_Init
.extern FieldEffect_DestroyBase
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern SceneInputBase_Update
.extern func_02092c8c
.extern func_ov001_021fbe6c
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gGamePhaseCurrencyHud

.global OverlayPromptPresentation_Init
    .type OverlayPromptPresentation_Init, @function
OverlayPromptPresentation_Init: ; 0x0202225c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_Init
    ldr r1, .L_020222cc
    add r0, r4, #0x10
    str r1, [r4, #0x0]
    bl OverlaySlot_Init
    mov r1, #0x0
    str r1, [r4, #0xc]
    str r1, [r4, #0x20]
    ldr r0, .L_020222d0
    str r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    ldrh r0, [r0, #0xb0]
    tst r0, #0x1
    moveq r1, #0x1
    str r1, [r4, #0x1c]
    ldr r1, [r4, #0x4]
    ldr r0, .L_020222d4
    orr r2, r1, #0x2
    bic r1, r2, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    ldr r1, .L_020222d8
    bl GameWork_ClearFlag
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020222cc: .word data_020d653c
.L_020222d0: .word gGamePhaseCurrencyHud
.L_020222d4: .word gGameWork
.L_020222d8: .word 0x408
    .size OverlayPromptPresentation_Init, .-OverlayPromptPresentation_Init
