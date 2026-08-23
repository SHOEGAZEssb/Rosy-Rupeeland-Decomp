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
.global RuntimePresentationManager_AppendSecondListEffect
RuntimePresentationManager_AppendSecondListEffect: ; 0x0201df44
    ldr ip, L_0201df50
    add r0, r0, #0x10
    bx ip
L_0201df50: .word FieldEffectList_Append


.size RuntimePresentationManager_AppendSecondListEffect, . - RuntimePresentationManager_AppendSecondListEffect
