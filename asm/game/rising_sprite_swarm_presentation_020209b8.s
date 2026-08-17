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
.extern TimedSpritePresentation_InitBase
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
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_Destroy
.extern func_02071ee0
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern gDebugFont
.extern gGameWork
.extern gHeapContext

.global RisingSpriteSwarmPresentation_DestroyAndFree
    .type RisingSpriteSwarmPresentation_DestroyAndFree, @function
RisingSpriteSwarmPresentation_DestroyAndFree: ; 0x020209b8
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_02020a4c
    mov r6, r0
    str r1, [r6, #0x0]
    ldr r4, [r6, #0x10]
    b .L_020209fc
.L_020209d0:
    ldr r5, [r4, #0x8]
    cmp r5, #0x0
    beq .L_020209ec
    mov r0, r5
    bl RisingSpriteMotionController_Destroy
    mov r0, r5
    bl Heap_Free
.L_020209ec:
    mov r1, r4
    add r0, r6, #0xc
    bl RisingSpriteControllerList_RemoveNode
    ldr r4, [r4, #0x0]
.L_020209fc:
    cmp r4, #0x0
    bne .L_020209d0
    ldr r0, [r6, #0x24]
    bl GraphicsSpriteGroup_Clear
    ldr r0, [r6, #0x28]
    bl GraphicsSpriteGroup_Clear
    add r0, r6, #0x38
    bl VecFx32Object_Destroy
    add r0, r6, #0x2c
    bl AnimationResourceState_Destroy
    ldr r1, .L_02020a50
    add r0, r6, #0xc
    str r1, [r6, #0xc]
    bl RisingSpriteControllerList_Clear
    mov r0, r6
    bl func_0201e28c
    mov r0, r6
    bl Heap_Free
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.L_02020a4c: .word data_020d6398
.L_02020a50: .word data_020d6358
    .size RisingSpriteSwarmPresentation_DestroyAndFree, .-RisingSpriteSwarmPresentation_DestroyAndFree

