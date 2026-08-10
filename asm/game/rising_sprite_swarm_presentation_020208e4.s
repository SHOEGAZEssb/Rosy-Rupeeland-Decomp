; Matching retail form; see src/game/rising_sprite_swarm_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d632c
.extern data_020d6358
.extern data_020d6398
.extern data_020d63b8
.extern data_020f4e14
.extern data_020f4e18
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050c8
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

.global RisingSpriteControllerList_Clear
    .type RisingSpriteControllerList_Clear, @function
RisingSpriteControllerList_Clear: ; 0x020208e4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b .L_02020908
.L_020208f4:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq .L_02020904
    bl Heap_Free
.L_02020904:
    mov r0, r4
.L_02020908:
    cmp r0, #0x0
    bne .L_020208f4
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
    .size RisingSpriteControllerList_Clear, .-RisingSpriteControllerList_Clear

