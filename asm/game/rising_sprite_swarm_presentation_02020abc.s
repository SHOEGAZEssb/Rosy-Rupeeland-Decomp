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

.global RisingSpriteSwarmPresentation_Update
    .type RisingSpriteSwarmPresentation_Update, @function
RisingSpriteSwarmPresentation_Update: ; 0x02020abc
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_02020bc4
.L_02020ad4: ; jump table
    b .L_02020ae8 ; case 0
    b .L_02020af4 ; case 1
    b .L_02020b40 ; case 2
    b .L_02020b6c ; case 3
    b .L_02020ba0 ; case 4
.L_02020ae8:
    add r0, r1, #0x1
    str r0, [r4, #0x1c]
    b .L_02020bc4
.L_02020af4:
    ldr r1, [r4, #0x20]
    sub r1, r1, #0x1
    str r1, [r4, #0x20]
    cmp r1, #0x0
    bgt .L_02020bc4
    bl RisingSpriteSwarmPresentation_SpawnController
    mov r0, #0x23
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x18]
    cmp r0, #0x4
    movlt r0, #0x0
    strlt r0, [r4, #0x1c]
    blt .L_02020bc4
    mov r0, #0x5
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    b .L_02020bc4
.L_02020b40:
    ldr r1, [r4, #0x20]
    sub r1, r1, #0x1
    str r1, [r4, #0x20]
    cmp r1, #0x0
    bgt .L_02020bc4
    mov r1, #0x1
    bl RisingSpriteSwarmPresentation_SetControllerState
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    b .L_02020bc4
.L_02020b6c:
    ldr r0, .L_02020c2c
    ldr r1, .L_02020c30
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02020bc4
    mov r0, r4
    mov r1, #0x2
    bl RisingSpriteSwarmPresentation_SetControllerState
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    b .L_02020bc4
.L_02020ba0:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02020bc4
    ldr r0, .L_02020c2c
    ldr r1, .L_02020c34
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_02020bc4:
    ldr r5, [r4, #0x10]
    b .L_02020c0c
.L_02020bcc:
    ldr r6, [r5, #0x8]
    ldr r1, [r4, #0x8]
    mov r0, r6
    bl RisingSpriteMotionController_Update
    cmp r0, #0x0
    beq .L_02020c08
    mov r1, r5
    add r0, r4, #0xc
    bl RisingSpriteControllerList_RemoveNode
    cmp r6, #0x0
    beq .L_02020c08
    mov r0, r6
    bl RisingSpriteMotionController_Destroy
    mov r0, r6
    bl Heap_Free
.L_02020c08:
    ldr r5, [r5, #0x0]
.L_02020c0c:
    cmp r5, #0x0
    bne .L_02020bcc
    ldr r0, [r4, #0x24]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x28]
    bl GraphicsSpriteGroup_AdvanceAnimations
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_02020c2c: .word gGameWork
.L_02020c30: .word 0x408
.L_02020c34: .word 0x409
    .size RisingSpriteSwarmPresentation_Update, .-RisingSpriteSwarmPresentation_Update

