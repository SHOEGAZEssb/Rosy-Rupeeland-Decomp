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

.global RisingSpriteSwarmPresentation_Init
    .type RisingSpriteSwarmPresentation_Init, @function
RisingSpriteSwarmPresentation_Init: ; 0x02020794
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_0201e250
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
    bl func_02071ea4
    add r1, r6, #0x18
    add r0, r4, #0x38
    bl func_02005030
    mov r1, #0x0
    mov r3, r5, lsl #0xc
    add r0, sp, #0x4
    mov r2, r1
    str r1, [r4, #0x48]
    bl func_0200500c
    add r0, r4, #0x38
    add r1, sp, #0x4
    bl func_020050c8
    add r0, sp, #0x4
    bl func_02005058
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
    bl func_02071ee0
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

