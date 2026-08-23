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
.global RuntimePresentationManager_DestroyAllEffects
RuntimePresentationManager_DestroyAllEffects: ; 0x0201df64
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x4]
    b L_0201df9c
L_0201df74:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0201df8c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201df8c:
    mov r0, r5
    mov r1, r4
    bl FieldEffectList_RemoveNode
    ldr r4, [r4, #0x0]
L_0201df9c:
    cmp r4, #0x0
    bne L_0201df74
    mov r0, r5
    bl FieldEffectList_Clear
    ldr r4, [r5, #0x14]
    b L_0201dfdc
L_0201dfb4:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0201dfcc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201dfcc:
    mov r1, r4
    add r0, r5, #0x10
    bl FieldEffectList_RemoveNode
    ldr r4, [r4, #0x0]
L_0201dfdc:
    cmp r4, #0x0
    bne L_0201dfb4
    add r0, r5, #0x10
    bl FieldEffectList_Clear
    ldmia sp!, {r3, r4, r5, pc}


.size RuntimePresentationManager_DestroyAllEffects, . - RuntimePresentationManager_DestroyAllEffects
