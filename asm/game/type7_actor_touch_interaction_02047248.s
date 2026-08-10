; Matching retail form; see src/game/type7_actor_touch_interaction.c.
.text
.extern TouchPoint_Init
.extern data_020e16b0
.extern data_020e16e0
.extern data_020e1730
.extern data_020e1790
.extern data_020e1870
.extern data_020e18f8
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern Actor_SetInteractionFlag2000
.extern Actor_TestQueryPoint
.extern ActorDerivedType1_TrySetStateVector
.extern ActorDerivedRuntime_AcceptInteractionQuery
.extern Type7Actor_HasSpecialCallbackPair
.extern Type7Actor_SetCallbackPair
.extern func_020486a8
.extern func_0204b7bc
.extern func_0204c74c
.extern func_020ada8c
.extern genrand_int32
.global Type7Actor_HandleTouchInteraction
.type Type7Actor_HandleTouchInteraction, @function
Type7Actor_HandleTouchInteraction: ; 0x02047248
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x38
    mov r5, r0
    ldr r2, [r5, #0x10]
    mov r4, r1
    tst r2, #0x1000000
    beq .L_02047270
    bl ActorDerivedRuntime_AcceptInteractionQuery
    mov r0, #0x1
    b .L_0204765c
.L_02047270:
    add r2, r5, #0x200
    ldrh r2, [r2, #0xa6]
    cmp r2, #0x0
    movne r0, #0x1
    bne .L_0204765c
    bl Actor_SetInteractionFlag2000
    bl func_0204c74c
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_0204765c
    ldr r0, [r5, #0x280]
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_0204765c
    ldr r0, [r5, #0x29c]
    ldrh r0, [r0, #0x38]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    moveq r0, #0x1
    beq .L_0204765c
    ldr r1, [r5, #0x268]
    tst r1, #0x8000
    moveq r0, #0x1
    beq .L_0204765c
    ldr r0, [r5, #0x234]
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_0204765c
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x46]
    cmp r0, #0x0
    movgt r0, #0x1
    bgt .L_0204765c
    orr r0, r1, #0x100
    str r0, [r5, #0x268]
    ldr r0, .L_02047664
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x30]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02047668
    bne .L_0204732c
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_0204732c:
    cmp r3, #0x0
    mov r0, #0x1
    beq .L_0204765c
    ldr r1, .L_02047664
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x1c0]
    mov ip, r0
    cmp r3, r1
    ldr r1, .L_0204766c
    bne .L_02047368
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02047368:
    cmp ip, #0x0
    beq .L_020473a8
    ldr r1, .L_02047664
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0xe0]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02047670
    bne .L_020473a0
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_020473a0:
    cmp ip, #0x0
    movne r0, #0x0
.L_020473a8:
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_0204765c
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x50]
    cmp r0, #0x0
    movlt r0, #0x1
    blt .L_0204765c
    ldr r0, [r5, #0x268]
    tst r0, #0x68
    movne r0, #0x1
    bne .L_0204765c
    mov r0, r5
    bl Type7Actor_HasSpecialCallbackPair
    cmp r0, #0x0
    beq .L_02047500
    ldr r0, [r5, #0x210]
    cmp r0, #0x0
    beq .L_020474f8
    ldrb r0, [r0, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_020474f8
    ldr r0, [r5, #0x268]
    tst r0, #0x4000
    beq .L_0204743c
    mov r1, #0xb4
    add r2, r5, #0x200
    mov r0, r5
    strh r1, [r2, #0xa0]
    sub r3, r1, #0xc8
    mov r1, #0x4
    strh r3, [r2, #0x64]
    bl func_0204b7bc
    b .L_0204745c
.L_0204743c:
    ldr r1, .L_02047674
    mov r0, r5
    mov r3, #0x3c
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa2]
.L_0204745c:
    ldr r0, [r5, #0x280]
    ldrb r0, [r0, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020474f8
    ldr r0, [r5, #0x24]
    ldr r1, [r5, #0x20]
    mov r0, r0, asr #0xc
    rsb r2, r0, r1, asr #0xc
    ldr r3, [r4, #0x8]
    ldr lr, [r4, #0x4]
    ldr ip, [r5, #0x1c]
    add r0, sp, #0x2c
    sub r1, lr, ip, asr #0xc
    sub r2, r3, r2
    bl TouchPoint_Init
    add r0, sp, #0x1c
    add r1, r5, #0x18
    bl func_02005030
    ldr r3, [sp, #0x20]
    ldr r2, [sp, #0x30]
    ldr r1, [sp, #0x24]
    add r2, r3, r2, lsl #0xc
    ldr r0, [sp, #0x34]
    str r2, [sp, #0x20]
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x24]
    ldr r0, [r5, #0x280]
    add r1, sp, #0x1c
    mov r2, #0x14
    mov r3, #0x0
    bl ActorDerivedType1_TrySetStateVector
    add r0, sp, #0x1c
    add r1, r5, #0x200
    mvn r2, #0x9
    strh r2, [r1, #0x50]
    bl func_02005058
.L_020474f8:
    mov r0, #0x1
    b .L_0204765c
.L_02047500:
    ldr r0, [r5, #0x10]
    tst r0, #0x2000
    moveq r0, #0x1
    beq .L_0204765c
    ldr r0, [r5, #0x268]
    tst r0, #0x4
    bne .L_02047658
    mov r0, r5
    mov r1, r4
    bl Actor_TestQueryPoint
    cmp r0, #0x0
    beq .L_020475c8
    mov r0, r5
    bl func_020486a8
    cmp r0, #0x0
    beq .L_020475c8
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x66]
    ldr r0, [r5, #0x268]
    ldr r1, .L_02047678
    orr r0, r0, #0x4
    bic r0, r0, #0xa0
    str r0, [r5, #0x268]
    mov r0, r5
    mov r3, #0x14
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    add r0, r5, #0x224
    add r1, r5, #0x18
    bl func_020050a4
    add r0, r5, #0x200
    mov r1, #0x5a
    strh r1, [r0, #0x50]
    ldr r0, [r5, #0x29c]
    ldrb r0, [r0, #0x54]
    cmp r0, #0x2
    bne .L_020475b4
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x78
    bl func_020ada8c
    add r1, r0, #0x5a
    add r0, r5, #0x200
    strh r1, [r0, #0x4e]
.L_020475b4:
    mov r2, #0x0
    mov r0, r5
    mov r1, #0x4
    str r2, [r5, #0x210]
    bl func_0204b7bc
.L_020475c8:
    ldr r0, [r5, #0x24]
    ldr r1, [r5, #0x20]
    mov r0, r0, asr #0xc
    rsb r2, r0, r1, asr #0xc
    ldr r3, [r4, #0x8]
    ldr lr, [r4, #0x4]
    ldr ip, [r5, #0x1c]
    add r0, sp, #0x10
    sub r1, lr, ip, asr #0xc
    sub r2, r3, r2
    bl TouchPoint_Init
    ldr r0, [r5, #0x280]
    ldrb r0, [r0, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02047658
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl func_02005030
    ldr r3, [sp, #0x4]
    ldr r2, [sp, #0x14]
    ldr r1, [sp, #0x8]
    add r2, r3, r2, lsl #0xc
    ldr r0, [sp, #0x18]
    str r2, [sp, #0x4]
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x280]
    add r1, sp, #0x0
    mov r2, #0x14
    mov r3, #0x0
    bl ActorDerivedType1_TrySetStateVector
    add r0, sp, #0x0
    bl func_02005058
.L_02047658:
    mov r0, #0x1
.L_0204765c:
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, pc}
.L_02047664: .word data_020e16b0
.L_02047668: .word data_020e16e0
.L_0204766c: .word data_020e1870
.L_02047670: .word data_020e1790
.L_02047674: .word data_020e1730
.L_02047678: .word data_020e18f8
.size Type7Actor_HandleTouchInteraction, . - Type7Actor_HandleTouchInteraction
