; Matching retail form; see src/game/runtime_presentation_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern Graphics3dPresentation_Init
.extern Graphics3dPresentation_Destroy
.extern Graphics3dPresentation_UpdateFrame
.extern ActorMotionAreaFollower_GetPosition
.extern FieldEffectList_Init
.extern FieldEffectList_Clear
.extern FieldEffectList_RemoveNode
.extern FieldEffectList_Append
.extern RuntimePresentationManager_DestroyAllEffects
.extern gFieldEffectListVtable
.extern gFieldEffectListNodeAllocationTag
.extern gGraphics3dPresentationAllocationTag
.extern data_021052fc
.extern gHeapContext
.global RuntimePresentationManager_GetSecondListNodeEffect
RuntimePresentationManager_GetSecondListNodeEffect: ; 0x0201df5c
    ldr r0, [r1, #0x8]
    bx lr


.size RuntimePresentationManager_GetSecondListNodeEffect, . - RuntimePresentationManager_GetSecondListNodeEffect
