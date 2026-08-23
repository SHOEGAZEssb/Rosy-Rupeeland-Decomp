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
.extern func_02008378
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

.global RisingSpriteSwarmPresentation_SetControllerState
    .type RisingSpriteSwarmPresentation_SetControllerState, @function
RisingSpriteSwarmPresentation_SetControllerState: ; 0x02020d48
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r4, [r0, #0x10]
    b .L_02020d68
.L_02020d58:
    ldr r0, [r4, #0x8]
    mov r1, r5
    bl RisingSpriteMotionController_SetState
    ldr r4, [r4, #0x0]
.L_02020d68:
    cmp r4, #0x0
    bne .L_02020d58
    ldmia sp!, {r3, r4, r5, pc}
    .size RisingSpriteSwarmPresentation_SetControllerState, .-RisingSpriteSwarmPresentation_SetControllerState

