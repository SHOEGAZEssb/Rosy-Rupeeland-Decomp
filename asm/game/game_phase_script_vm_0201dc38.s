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
.global FieldEffectList_Destroy
FieldEffectList_Destroy: ; 0x0201dc38
    stmdb sp!, {r4, lr}
    ldr r1, L_0201dc54
    mov r4, r0
    str r1, [r4, #0x0]
    bl FieldEffectList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201dc54: .word gFieldEffectListVtable


.size FieldEffectList_Destroy, . - FieldEffectList_Destroy
