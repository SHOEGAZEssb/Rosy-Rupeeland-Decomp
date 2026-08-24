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
.global RuntimePresentationManager_Destroy
RuntimePresentationManager_Destroy: ; 0x0201dc98
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl RuntimePresentationManager_DestroyAllEffects
    ldr r4, [r5, #0x20]
    cmp r4, #0x0
    beq L_0201dcc0
    mov r0, r4
    bl Graphics3dPresentation_Destroy
    mov r0, r4
    bl Heap_Free
L_0201dcc0:
    ldr r1, L_0201dce8
    add r0, r5, #0x10
    str r1, [r5, #0x10]
    bl FieldEffectList_Clear
    ldr r1, L_0201dce8
    mov r0, r5
    str r1, [r5, #0x0]
    bl FieldEffectList_Clear
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_0201dce8: .word gFieldEffectListVtable


.size RuntimePresentationManager_Destroy, . - RuntimePresentationManager_Destroy
