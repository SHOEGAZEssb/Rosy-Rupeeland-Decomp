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
.extern func_02074058
.extern func_020740a4
.extern func_020742cc
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

