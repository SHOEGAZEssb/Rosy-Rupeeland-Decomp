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
.global FieldEffectList_RemoveNode
FieldEffectList_RemoveNode: ; 0x0201dde4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r1, r0
    ldreq r0, [r1, #0x0]
    streq r0, [r4, #0x4]
    ldrne r2, [r1, #0x0]
    ldrne r0, [r1, #0x4]
    strne r2, [r0, #0x0]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    ldreq r0, [r1, #0x4]
    streq r0, [r4, #0x8]
    ldmneia r1, {r0, r2}
    strne r2, [r0, #0x4]
    cmp r1, #0x0
    beq L_0201de30
    mov r0, r1
    bl Heap_Free
L_0201de30:
    ldr r0, [r4, #0xc]
    subs r0, r0, #0x1
    str r0, [r4, #0xc]
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl FieldEffectList_Clear
    ldmia sp!, {r4, pc}


.size FieldEffectList_RemoveNode, . - FieldEffectList_RemoveNode
