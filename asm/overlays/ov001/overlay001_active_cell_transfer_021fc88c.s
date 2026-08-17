    .text
    .extern InventoryRecord_GetMetadata
    .extern InventoryRecordCollection_FindIdAlternate
    .extern ActorDescriptor_SetQuantity
    .extern func_ov001_021fc460
    .extern func_ov001_021fc404
    .extern func_ov001_021fc068
    .global func_ov001_021fc88c
func_ov001_021fc88c: ; 0x021fc88c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r1, [r5, #0x20c]
    ldr r0, [r5, #0x1ac]
    add r0, r1, r0, lsl #0x5
    ldr r4, [r0, #0xc]
    mov r0, r4
    bl InventoryRecord_GetMetadata
    ldrb r0, [r0, #0x2]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r4, #0x4]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r4, #0x0]
    ldr r0, [r5, #0x208]
    bl InventoryRecordCollection_FindIdAlternate
    cmp r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r5, #0x208]
    ldrh r6, [r4, #0x4]
    ldr r2, [r1, #0x4]
    mov r1, #0x24
    mla r7, r0, r1, r2
    mov r0, r4
    mov r1, r6
    bl ActorDescriptor_SetQuantity
    ldrh r1, [r7, #0x4]
    mov r0, r7
    add r1, r6, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl ActorDescriptor_SetQuantity
    ldr r1, [r5, #0x1c]
    cmp r1, #0x0
    movne r0, #0x100
    strneh r0, [r1, #0x32]
    movne r0, #0x0
    strne r0, [r5, #0x1c]
    ldr r1, [r5, #0x1ac]
    mov r0, r5
    bl func_ov001_021fc460
    ldr r1, [r5, #0x1ac]
    mov r0, r5
    mov r2, #0x0
    bl func_ov001_021fc404
    mov r0, r5
    bl func_ov001_021fc068
    ldr r1, [r5, #0x20c]
    ldr r0, [r5, #0x1ac]
    add r0, r1, r0, lsl #0x5
    ldr r0, [r0, #0x10]
    str r0, [r5, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_ov001_021fc88c, .-func_ov001_021fc88c
