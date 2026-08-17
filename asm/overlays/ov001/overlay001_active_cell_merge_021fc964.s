    .text
    .extern InventoryRecord_GetMetadata
    .extern ActorDescriptor_SetQuantity
    .extern ActorDescriptor_GetSubtype
    .extern ActorDescriptor_Init
    .extern func_ov001_021fc460
    .extern func_ov001_021fc404
    .extern func_ov001_021fc068
    .global func_ov001_021fc964
func_ov001_021fc964: ; 0x021fc964
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldr r3, [r7, #0x20c]
    ldr r0, [r7, #0x1ac]
    mov r6, r1
    add r0, r3, r0, lsl #0x5
    ldr r4, [r0, #0xc]
    mov r5, r2
    mov r0, r4
    bl InventoryRecord_GetMetadata
    ldrb r0, [r0, #0x2]
    cmp r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r5, #0x4]
    mov r0, r5
    sub r1, r1, r6
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl ActorDescriptor_SetQuantity
    mov r0, r4
    ldrh r8, [r5, #0x0]
    bl ActorDescriptor_GetSubtype
    ldrh r2, [r4, #0x4]
    mov r5, r0
    mov r0, r4
    add r3, r6, r2
    mov r2, r5, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r1, r8
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl ActorDescriptor_Init
    ldr r1, [r7, #0x1c]
    cmp r1, #0x0
    movne r0, #0x100
    strneh r0, [r1, #0x32]
    movne r0, #0x0
    strne r0, [r7, #0x1c]
    ldr r1, [r7, #0x1ac]
    mov r0, r7
    bl func_ov001_021fc460
    ldr r1, [r7, #0x1ac]
    mov r0, r7
    mov r2, #0x0
    bl func_ov001_021fc404
    mov r0, r7
    bl func_ov001_021fc068
    ldr r1, [r7, #0x20c]
    ldr r0, [r7, #0x1ac]
    add r0, r1, r0, lsl #0x5
    ldr r0, [r0, #0x10]
    str r0, [r7, #0x1c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size func_ov001_021fc964, .-func_ov001_021fc964
