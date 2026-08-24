; Matching retail form; see src/game/runtime_presentation_dispatch.c.
.text
.extern Heap_Free
.extern FieldEffectList_Clear
.extern FieldEffectList_RemoveNode
.extern Graphics3dPresentation_Clear
.extern Graphics3dPresentation_Disable
.extern Graphics3dPresentation_Enable
.extern GX_SetGraphicsMode
.extern gFieldEffectListVtable
.extern gGamePhaseRuntime
.global RuntimePresentationManager_GetGraphics3dPresentation
RuntimePresentationManager_GetGraphics3dPresentation: ; 0x0201e0ec
    ldr r0, [r0, #0x20]
    bx lr


.size RuntimePresentationManager_GetGraphics3dPresentation, . - RuntimePresentationManager_GetGraphics3dPresentation
