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
.global FieldEffect_ScreenModeChangedCallbackNoOp
FieldEffect_ScreenModeChangedCallbackNoOp: ; 0x0201e050
    bx lr


.size FieldEffect_ScreenModeChangedCallbackNoOp, . - FieldEffect_ScreenModeChangedCallbackNoOp
