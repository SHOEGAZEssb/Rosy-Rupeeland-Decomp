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
.global FieldEffectList_Clear
FieldEffectList_Clear: ; 0x0201dc58
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b L_0201dc7c
L_0201dc68:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq L_0201dc78
    bl Heap_Free
L_0201dc78:
    mov r0, r4
L_0201dc7c:
    cmp r0, #0x0
    bne L_0201dc68
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}


.size FieldEffectList_Clear, . - FieldEffectList_Clear
