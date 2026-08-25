    .text
    .extern data_020f4e18
    .extern ActorDescriptor_GetComponent
    .extern ActorDescriptorComponent_GetCharacterResourceId
    .extern ActorDescriptorComponent_GetPaletteResourceId
    .extern ActorDescriptorComponent_GetCellResourceId
    .extern ActorDescriptorComponent_GetAnimation
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteState_ApplyRenderConfig
    .global Overlay001_CreateRowResources
Overlay001_CreateRowResources: ; 0x021fc4b4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r6, r1, r1, lsl #0x2
    mov r7, #0x0
    mov r11, #0x2
    b L_021fc5c8
L_021fc4d0:
    add r1, r6, r7
    ldr r0, [r10, #0x1a4]
    cmp r1, r0
    bge L_021fc5d0
    ldr r0, [r10, #0x20c]
    add r8, r0, r1, lsl #0x5
    ldr r9, [r8, #0xc]
    cmp r9, #0x0
    beq L_021fc5c4
    ldr r0, [r8, #0x10]
    cmp r0, #0x0
    bne L_021fc5c4
    mov r0, r9
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCharacterResourceId
    mov r5, r0
    mov r0, r9
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetPaletteResourceId
    mov r4, r0
    mov r0, r9
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCellResourceId
    str r0, [sp, #0x0]
    ldr r1, L_021fc5d8
    mov r2, r5
    ldr r1, [r1, #0x0]
    mov r3, r4
    mov r0, r8
    bl AnimationResourceState_ReplaceResources
    ldr r0, [r10, #0x8]
    mov r1, r8
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    mov r0, r9
    str r4, [r8, #0x10]
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetAnimation
    str r11, [sp, #0x0]
    mov r1, #0x3000
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r2, [r8, #0x14]
    ldr r3, [r8, #0x18]
    mov r0, r4
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r8, #0xc]
    cmp r0, #0x0
    ldrne r0, [r0, #0x20]
    andne r0, r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    movne r0, #0x1
    strneh r0, [r4, #0x2a]
L_021fc5c4:
    add r7, r7, #0x1
L_021fc5c8:
    cmp r7, #0x5
    blt L_021fc4d0
L_021fc5d0:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fc5d8: .word data_020f4e18
    .size Overlay001_CreateRowResources, .-Overlay001_CreateRowResources
