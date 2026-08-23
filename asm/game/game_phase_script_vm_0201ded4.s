; Matching retail form; see src/game/runtime_presentation_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern func_020a1f80
.extern func_020a20d4
.extern func_020a214c
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
.global RuntimePresentationManager_AppendFirstListEffect
RuntimePresentationManager_AppendFirstListEffect: ; 0x0201ded4
    ldr ip, L_0201dedc
    bx ip
L_0201dedc: .word FieldEffectList_Append


.size RuntimePresentationManager_AppendFirstListEffect, . - RuntimePresentationManager_AppendFirstListEffect
