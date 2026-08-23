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
.global RuntimePresentationManager_Init
RuntimePresentationManager_Init: ; 0x0201dbc8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffectList_Init
    add r0, r4, #0x10
    bl FieldEffectList_Init
    ldr r0, L_0201dc0c
    ldr r1, L_0201dc10
    ldr r3, L_0201dc14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201dc00
    mov r1, #0x1
    bl func_020a1f80
L_0201dc00:
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201dc0c: .word 0x50c
L_0201dc10: .word gGraphics3dPresentationAllocationTag
L_0201dc14: .word gHeapContext


.size RuntimePresentationManager_Init, . - RuntimePresentationManager_Init
