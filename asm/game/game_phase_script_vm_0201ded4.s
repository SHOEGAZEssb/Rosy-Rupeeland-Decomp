; Matching retail form; see src/game/runtime_presentation_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern func_020a1f80
.extern func_020a20d4
.extern func_020a214c
.extern ActorMotionAreaFollower_GetPosition
.extern func_0201dc18
.extern func_0201dc58
.extern func_0201dde4
.extern FieldEffectList_Append
.extern func_0201df64
.extern gRuntimePresentationListVTable
.extern gRuntimePresentationListNodeAllocationTag
.extern gRuntimePresentationAuxiliaryAllocationTag
.extern data_021052fc
.extern gHeapContext
.global RuntimePresentationManager_AppendFirstListEffect
RuntimePresentationManager_AppendFirstListEffect: ; 0x0201ded4
    ldr ip, L_0201dedc
    bx ip
L_0201dedc: .word FieldEffectList_Append


.size RuntimePresentationManager_AppendFirstListEffect, . - RuntimePresentationManager_AppendFirstListEffect
