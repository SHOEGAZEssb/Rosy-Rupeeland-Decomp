; Matching retail form; see src/game/type7_actor_drag_start.c.
.text
.extern TouchPoint_Init
.extern data_020e16b0
.extern data_020e17c8
.extern data_020e1910
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern Actor_TestQueryPointAndClearFlag2000
.extern ActorDerivedType1_TrySetStateVector
.extern ActorDerivedRuntime_TestInteractionQuery
.extern Type7Actor_HasSpecialCallbackPair
.extern Type7Actor_SetMotionTarget
.extern Type7Actor_IsInteractionSceneActive
.global Type7Actor_HandleDragStart
.type Type7Actor_HandleDragStart, @function
Type7Actor_HandleDragStart: ; 0x0204767c
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x1c
    mov r5, r0
    ldr r2, [r5, #0x10]
    mov r4, r1
    tst r2, #0x1000000
    beq .L_020476a0
    bl ActorDerivedRuntime_TestInteractionQuery
    b .L_0204789c
.L_020476a0:
    bl Type7Actor_IsInteractionSceneActive
    cmp r0, #0x0
    beq .L_0204789c
    add r0, r5, #0x200
    ldrh r0, [r0, #0xa6]
    cmp r0, #0x0
    bne .L_0204789c
    mov r0, r5
    mov r1, r4
    bl Actor_TestQueryPointAndClearFlag2000
    ldr r0, [r5, #0x29c]
    ldrh r0, [r0, #0x38]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_0204789c
    ldr r0, [r5, #0x268]
    tst r0, #0x8000
    beq .L_0204789c
    ldr r0, .L_020478a4
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x260]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_020478a8
    bne .L_02047718
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02047718:
    cmp r3, #0x0
    beq .L_0204789c
    ldr r0, [r5, #0x234]
    cmp r0, #0x0
    bne .L_0204789c
    ldr r1, [r5, #0x268]
    mov r0, #0x0
    orr r1, r1, #0x100
    str r1, [r5, #0x268]
    ldr r1, [r5, #0x280]
    cmp r1, #0x0
    beq .L_020477a4
    ldr r1, [r5, #0x268]
    tst r1, #0x4
    beq .L_020477a4
    ldr r1, .L_020478a4
    mov ip, #0x1
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x118]
    mov lr, ip
    cmp r3, r1
    ldr r1, .L_020478ac
    bne .L_02047788
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq lr, #0x0
.L_02047788:
    cmp lr, #0x0
    bne .L_0204779c
    ldr r1, [r5, #0x10]
    tst r1, #0x2000
    moveq ip, #0x0
.L_0204779c:
    cmp ip, #0x0
    movne r0, #0x1
.L_020477a4:
    cmp r0, #0x0
    beq .L_0204789c
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x50]
    cmp r0, #0x0
    blt .L_0204789c
    ldr r0, [r5, #0x268]
    tst r0, #0x40
    bne .L_0204789c
    tst r0, #0x8
    bne .L_0204789c
    mov r0, r5
    bl Type7Actor_HasSpecialCallbackPair
    cmp r0, #0x0
    bne .L_0204789c
    ldr r1, [r5, #0x268]
    add r0, sp, #0x10
    orr r1, r1, #0x800
    str r1, [r5, #0x268]
    ldr r1, [r5, #0x24]
    ldr r2, [r5, #0x20]
    mov r1, r1, asr #0xc
    ldr lr, [r4, #0x4]
    ldr ip, [r5, #0x1c]
    rsb r2, r1, r2, asr #0xc
    ldr r3, [r4, #0x8]
    sub r1, lr, ip, asr #0xc
    sub r2, r3, r2
    bl TouchPoint_Init
    ldr r2, [sp, #0x18]
    ldr r1, [sp, #0x14]
    mul r0, r2, r2
    mla r0, r1, r1, r0
    cmp r0, #0x100
    ble .L_0204789c
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldr r3, [sp, #0x4]
    ldr r2, [sp, #0x14]
    ldr r1, [sp, #0x8]
    add r3, r3, r2, lsl #0xc
    ldr r0, [sp, #0x18]
    str r3, [sp, #0x4]
    add r2, r1, r0, lsl #0xc
    add r1, sp, #0x0
    mov r0, r5
    str r2, [sp, #0x8]
    bl Type7Actor_SetMotionTarget
    ldr r0, [r5, #0x280]
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02047894
    add r1, sp, #0x0
    mov r2, #0x14
    mov r3, #0x0
    bl ActorDerivedType1_TrySetStateVector
.L_02047894:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_0204789c:
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, pc}
.L_020478a4: .word data_020e16b0
.L_020478a8: .word data_020e1910
.L_020478ac: .word data_020e17c8

.size Type7Actor_HandleDragStart, . - Type7Actor_HandleDragStart

