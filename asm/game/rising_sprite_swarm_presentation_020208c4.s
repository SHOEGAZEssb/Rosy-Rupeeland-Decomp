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
.extern func_0201e250
.extern func_0201e28c
.extern RisingSpriteMotionController_Init
.extern RisingSpriteMotionController_Destroy
.extern RisingSpriteMotionController_Update
.extern RisingSpriteMotionController_SetState
.extern RisingSpriteControllerList_Init
.extern RisingSpriteControllerList_Clear
.extern RisingSpriteControllerList_RemoveNode
.extern RisingSpriteSwarmPresentation_SpawnController
.extern RisingSpriteSwarmPresentation_SetControllerState
.extern func_02071ea4
.extern func_02071eb8
.extern func_02071ee0
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern gDebugFont
.extern gGameWork
.extern gHeapContext

.global RisingSpriteControllerList_Destroy
    .type RisingSpriteControllerList_Destroy, @function
RisingSpriteControllerList_Destroy: ; 0x020208c4
    stmdb sp!, {r4, lr}
    ldr r1, .L_020208e0
    mov r4, r0
    str r1, [r4, #0x0]
    bl RisingSpriteControllerList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020208e0: .word data_020d6358
    .size RisingSpriteControllerList_Destroy, .-RisingSpriteControllerList_Destroy

