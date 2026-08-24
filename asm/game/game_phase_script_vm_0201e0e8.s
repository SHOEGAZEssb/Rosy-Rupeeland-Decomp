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
.global FieldEffect_SetEnabledNoOp
FieldEffect_SetEnabledNoOp: ; 0x0201e0e8
    bx lr


.size FieldEffect_SetEnabledNoOp, . - FieldEffect_SetEnabledNoOp
