    .text
    .extern ActorDescriptor_GetComponent
    .extern ActorDescriptorComponent_GetCharacterResourceId
    .extern ActorDescriptorComponent_GetPaletteResourceId
    .extern ActorDescriptorComponent_GetCellResourceId
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern ActorDescriptorComponent_GetAnimation
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern func_ov000_021fc834
    .extern data_020f4e18
    .global func_ov000_021fc84c
func_ov000_021fc84c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r6, r1, r1, lsl #0x2
    mov r7, #0x0
    mov r11, #0x2
    b L_021fc958
L_021fc868:
    add r1, r6, r7
    ldr r0, [r10, #0x254]
    cmp r1, r0
    bge L_021fc960
    ldr r0, [r10, #0x250]
    add r8, r0, r1, lsl #0x5
    ldr r9, [r8, #0xc]
    cmp r9, #0x0
    beq L_021fc954
    ldr r0, [r8, #0x10]
    cmp r0, #0x0
    bne L_021fc954
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
    ldr r1, L_021fc968
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
    mov r0, r8
    mov r1, #0x1
    str r4, [r8, #0x10]
    bl func_ov000_021fc834
    cmp r0, #0x0
    movne r0, #0x1
    strneh r0, [r4, #0x2a]
L_021fc954:
    add r7, r7, #0x1
L_021fc958:
    cmp r7, #0x5
    blt L_021fc868
L_021fc960:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fc968:
    .word data_020f4e18
    .size func_ov000_021fc84c, .-func_ov000_021fc84c
