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
.global RuntimePresentationManager_AppendSecondListEffect
RuntimePresentationManager_AppendSecondListEffect: ; 0x0201df44
    ldr ip, L_0201df50
    add r0, r0, #0x10
    bx ip
L_0201df50: .word FieldEffectList_Append


.size RuntimePresentationManager_AppendSecondListEffect, . - RuntimePresentationManager_AppendSecondListEffect
