; Matching retail form; see src/game/runtime_presentation_dispatch.c.
.text
.extern Heap_Free
.extern FieldEffectList_Clear
.extern FieldEffectList_RemoveNode
.extern func_020a2324
.extern func_020a2348
.extern func_020a23a8
.extern GX_SetGraphicsMode
.extern gFieldEffectListVtable
.extern data_021052fc
.global FieldEffect_ScreenModeChangedCallbackNoOp
FieldEffect_ScreenModeChangedCallbackNoOp: ; 0x0201e050
    bx lr


.size FieldEffect_ScreenModeChangedCallbackNoOp, . - FieldEffect_ScreenModeChangedCallbackNoOp
