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
.global RuntimePresentationManager_DispatchVBlankCallbacks
RuntimePresentationManager_DispatchVBlankCallbacks: ; 0x0201de4c
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x14]
    b L_0201de7c
L_0201de58:
    ldr r0, [r4, #0x8]
    ldr r1, [r0, #0x4]
    mov r1, r1, lsl #0x1e
    movs r1, r1, asr #0x1f
    beq L_0201de78
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
L_0201de78:
    ldr r4, [r4, #0x0]
L_0201de7c:
    cmp r4, #0x0
    bne L_0201de58
    ldmia sp!, {r4, pc}


.size RuntimePresentationManager_DispatchVBlankCallbacks, . - RuntimePresentationManager_DispatchVBlankCallbacks
