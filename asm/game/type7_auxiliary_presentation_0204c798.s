; Matching retail form; see src/game/type7_auxiliary_presentation.c.
.extern Heap_Alloc
.extern AnimationResource_Init
.extern Actor_GetCollection
.extern ActorCollection_GetSpriteOwner
.extern func_02073fc4
.extern GraphicsSpriteState_SetAnimationIndex
.extern Type7AuxiliaryPresentation_Reset
.extern func_02073ef8
.extern Heap_Free
.extern Type7AuxiliaryPresentation_Activate
.extern data_020e1ea4
.extern data_020e1eb4
.extern gHeapContext
.text
    .global Type7AuxiliaryPresentation_Init
Type7AuxiliaryPresentation_Init: ; 0x0204c798
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r2, .L_0204c844
    mov r4, r0
    mov r6, r1
    str r2, [r4, #0x0]
    ldr r1, .L_0204c848
    ldr r3, .L_0204c84c
    mov r0, #0x10
    mov r2, #0x4
    str r6, [r4, #0x8]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0204c7e0
    ldr r1, .L_0204c850
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_0204c7e0:
    mov r5, r0
    str r0, [r4, #0xc]
    mov r0, r6
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r5, {r1, r2, r3}
    bl func_02073fc4
    str r0, [r4, #0x4]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    strh r0, [r1, #0x2c]
    strh r0, [r1, #0x2e]
    ldr r2, [r4, #0x4]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
    bl Type7AuxiliaryPresentation_Reset
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0204c844: .word data_020e1ea4
.L_0204c848: .word data_020e1eb4
.L_0204c84c: .word gHeapContext
.L_0204c850: .word 0x1157
.size Type7AuxiliaryPresentation_Init, . - Type7AuxiliaryPresentation_Init

    .global Type7AuxiliaryPresentation_Destroy
Type7AuxiliaryPresentation_Destroy: ; 0x0204c854
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204c88c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    bl func_02073ef8
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0204c884
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204c884:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204c88c: .word data_020e1ea4
.size Type7AuxiliaryPresentation_Destroy, . - Type7AuxiliaryPresentation_Destroy

    .global Type7AuxiliaryPresentation_DestroyAndFree
Type7AuxiliaryPresentation_DestroyAndFree: ; 0x0204c890
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204c8d0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    bl func_02073ef8
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0204c8c0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204c8c0:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204c8d0: .word data_020e1ea4
.size Type7AuxiliaryPresentation_DestroyAndFree, . - Type7AuxiliaryPresentation_DestroyAndFree

    .global Type7AuxiliaryPresentation_Reset
Type7AuxiliaryPresentation_Reset: ; 0x0204c8d4
    mov r1, #0x0
    str r1, [r0, #0x18]
    str r1, [r0, #0x14]
    str r1, [r0, #0x28]
    strh r1, [r0, #0x26]
    strh r1, [r0, #0x24]
    str r1, [r0, #0x20]
    str r1, [r0, #0x1c]
    strb r1, [r0, #0x10]
    strb r1, [r0, #0x13]
    strb r1, [r0, #0x12]
    ldr r3, [r0, #0x4]
    sub r1, r1, #0x1
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x8
    strh r2, [r3, #0x24]
    strb r1, [r0, #0x11]
    bx lr
.size Type7AuxiliaryPresentation_Reset, . - Type7AuxiliaryPresentation_Reset

    .global Type7AuxiliaryPresentation_EnterRaisedState
Type7AuxiliaryPresentation_EnterRaisedState: ; 0x0204c91c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Type7AuxiliaryPresentation_Activate
    ldr r1, [r4, #0x28]
    mov r0, #0x3
    add r1, r1, #0x1e000
    str r1, [r4, #0x18]
    str r1, [r4, #0x14]
    strb r0, [r4, #0x13]
    strb r0, [r4, #0x12]
    ldr r0, [r4, #0x4]
    mov r1, #0x10
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x4]
    mvn r0, #0x0
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x8
    strh r1, [r2, #0x24]
    strb r0, [r4, #0x11]
    ldmia sp!, {r4, pc}
.size Type7AuxiliaryPresentation_EnterRaisedState, . - Type7AuxiliaryPresentation_EnterRaisedState

