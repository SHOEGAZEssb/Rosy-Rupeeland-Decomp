; Matching retail form; see src/game/rising_sprite_swarm_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Heap_Free
.extern gRisingSpriteSwarmControllerListNodeAllocationTag
.extern data_020d6358
.extern data_020d6398
.extern gRisingSpriteSwarmControllerAllocationTag
.extern data_020f4e14
.extern data_020f4e18
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Add
.extern VecFx32Object_InitSum
.extern FieldEffect_Init
.extern FieldEffect_DestroyBase
.extern RisingSpriteMotionController_Init
.extern RisingSpriteMotionController_Destroy
.extern RisingSpriteMotionController_Update
.extern RisingSpriteMotionController_SetState
.extern RisingSpriteControllerList_Init
.extern RisingSpriteControllerList_Clear
.extern RisingSpriteControllerList_RemoveNode
.extern RisingSpriteSwarmPresentation_SpawnController
.extern RisingSpriteSwarmPresentation_SetControllerState
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_Destroy
.extern func_02071ee0
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern gDebugFont
.extern gGameWork
.extern gHeapContext

.global RisingSpriteControllerList_RemoveNode
    .type RisingSpriteControllerList_RemoveNode, @function
RisingSpriteControllerList_RemoveNode: ; 0x02020a54
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
    beq .L_02020aa0
    mov r0, r1
    bl Heap_Free
.L_02020aa0:
    ldr r0, [r4, #0xc]
    subs r0, r0, #0x1
    str r0, [r4, #0xc]
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl RisingSpriteControllerList_Clear
    ldmia sp!, {r4, pc}
    .size RisingSpriteControllerList_RemoveNode, .-RisingSpriteControllerList_RemoveNode

