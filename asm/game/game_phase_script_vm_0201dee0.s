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
.global FieldEffectList_Append
FieldEffectList_Append: ; 0x0201dee0
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    ldr r1, L_0201df3c
    ldr r3, L_0201df40
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r4}
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    strne r0, [r1, #0x0]
    ldrne r1, [r5, #0x8]
    strne r1, [r0, #0x4]
    streq r0, [r5, #0x4]
    str r0, [r5, #0x8]
    ldr r1, [r5, #0xc]
    add r1, r1, #0x1
    str r1, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
L_0201df3c: .word gFieldEffectListNodeAllocationTag
L_0201df40: .word gHeapContext


.size FieldEffectList_Append, . - FieldEffectList_Append
