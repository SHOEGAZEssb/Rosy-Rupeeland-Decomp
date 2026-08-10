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

.global RisingSpriteControllerList_DestroyAndFree
    .type RisingSpriteControllerList_DestroyAndFree, @function
RisingSpriteControllerList_DestroyAndFree: ; 0x02020d74
    stmdb sp!, {r4, lr}
    ldr r1, .L_02020d98
    mov r4, r0
    str r1, [r4, #0x0]
    bl RisingSpriteControllerList_Clear
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02020d98: .word data_020d6358
    .size RisingSpriteControllerList_DestroyAndFree, .-RisingSpriteControllerList_DestroyAndFree

