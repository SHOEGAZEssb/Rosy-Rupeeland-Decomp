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
.extern gGamePhaseRuntime
.extern gHeapContext
.global RuntimePresentationManager_AppendFirstListEffect
RuntimePresentationManager_AppendFirstListEffect: ; 0x0201ded4
    ldr ip, L_0201dedc
    bx ip
L_0201dedc: .word FieldEffectList_Append


.size RuntimePresentationManager_AppendFirstListEffect, . - RuntimePresentationManager_AppendFirstListEffect
