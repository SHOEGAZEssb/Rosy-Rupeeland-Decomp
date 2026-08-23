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
.global FieldEffect_SetEnabledNoOp
FieldEffect_SetEnabledNoOp: ; 0x0201e0e8
    bx lr


.size FieldEffect_SetEnabledNoOp, . - FieldEffect_SetEnabledNoOp
