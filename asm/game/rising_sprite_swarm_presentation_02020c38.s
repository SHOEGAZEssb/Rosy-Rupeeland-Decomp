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

.global RisingSpriteSwarmPresentation_SpawnController
    .type RisingSpriteSwarmPresentation_SpawnController, @function
RisingSpriteSwarmPresentation_SpawnController: ; 0x02020c38
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x28
    ldr r1, .L_02020d3c
    mov r4, r0
    mov r5, #0x0
    ldr r3, .L_02020d40
    mov r0, #0x64
    mov r2, #0x4
    mov r6, r5
    bl Heap_Alloc
    movs r7, r0
    beq .L_02020cbc
    mov r1, r5
    add r0, sp, #0x18
    mov r2, r1
    mov r3, #0x20000
    bl func_0200500c
    add r0, sp, #0x8
    add r2, sp, #0x18
    add r1, r4, #0x38
    mov r5, #0x1
    bl func_02008378
    add r1, sp, #0x8
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x48]
    mov r0, r7
    str r1, [sp, #0x4]
    ldr r1, [r4, #0x24]
    ldr r2, [r4, #0x28]
    add r3, r4, #0x2c
    mov r6, r5
    bl RisingSpriteMotionController_Init
    mov r7, r0
.L_02020cbc:
    cmp r6, #0x0
    beq .L_02020ccc
    add r0, sp, #0x8
    bl func_02005058
.L_02020ccc:
    cmp r5, #0x0
    beq .L_02020cdc
    add r0, sp, #0x18
    bl func_02005058
.L_02020cdc:
    ldr r1, .L_02020d44
    ldr r3, .L_02020d40
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r7}
    ldr r1, [r4, #0x14]
    cmp r1, #0x0
    strne r0, [r1, #0x0]
    ldrne r1, [r4, #0x14]
    strne r1, [r0, #0x4]
    streq r0, [r4, #0x10]
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x18]
    add r0, r0, #0x1
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x48]
    add r0, r0, #0x1
    str r0, [r4, #0x48]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02020d3c: .word data_020d63b8
.L_02020d40: .word gHeapContext
.L_02020d44: .word data_020d632c
    .size RisingSpriteSwarmPresentation_SpawnController, .-RisingSpriteSwarmPresentation_SpawnController

