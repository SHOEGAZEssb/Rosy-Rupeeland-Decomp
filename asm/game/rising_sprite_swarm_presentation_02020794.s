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
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern gDebugFont
.extern gGameWork
.extern gHeapContext

.global RisingSpriteSwarmPresentation_Init
    .type RisingSpriteSwarmPresentation_Init, @function
RisingSpriteSwarmPresentation_Init: ; 0x02020794
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl FieldEffect_Init
    ldr r1, .L_02020884
    add r0, r4, #0xc
    str r1, [r4, #0x0]
    str r7, [r4, #0x8]
    bl RisingSpriteControllerList_Init
    mov r0, #0x0
    str r0, [r4, #0x1c]
    str r0, [r4, #0x20]
    str r0, [r4, #0x24]
    str r0, [r4, #0x28]
    add r0, r4, #0x2c
    bl AnimationResourceState_InitEmbedded
    add r1, r6, #0x18
    add r0, r4, #0x38
    bl VecFx32Object_InitCopy
    mov r1, #0x0
    mov r3, r5, lsl #0xc
    add r0, sp, #0x4
    mov r2, r1
    str r1, [r4, #0x48]
    bl VecFx32Object_InitComponents
    add r0, r4, #0x38
    add r1, sp, #0x4
    bl VecFx32Object_Add
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    ldr r0, .L_02020888
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x24]
    ldr r0, .L_0202088c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r3, .L_02020890
    str r0, [r4, #0x28]
    ldr r1, .L_02020894
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r4, #0x2c
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r0, .L_02020898
    ldr r1, .L_0202089c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02020898
    ldr r1, .L_020208a0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02020884: .word data_020d6398
.L_02020888: .word data_020f4e14
.L_0202088c: .word gDebugFont
.L_02020890: .word 0x165a
.L_02020894: .word data_020f4e18
.L_02020898: .word gGameWork
.L_0202089c: .word 0x408
.L_020208a0: .word 0x409
    .size RisingSpriteSwarmPresentation_Init, .-RisingSpriteSwarmPresentation_Init

