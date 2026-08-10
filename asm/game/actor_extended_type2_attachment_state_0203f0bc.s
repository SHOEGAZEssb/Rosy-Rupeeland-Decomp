; Matching retail form; see src/game/actor_extended_type2_attachment_state.c.
.text
.extern data_020df9e8
.extern data_020dfab0
.extern data_020e6adc
.extern data_020e6b74
.extern data_020e6c0c
.extern data_020e6ca4
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_02072b68
.extern func_020740c8
    .global ActorExtendedType2_ApplyAttachmentState
    .type ActorExtendedType2_ApplyAttachmentState, @function
ActorExtendedType2_ApplyAttachmentState: ; 0x0203f0bc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldrsh r1, [r7, #0xd6]
    mov r0, #0x0
    mov r5, r0
    mov r6, r0
    cmp r1, #0x16
    mov r4, #0x100
    addls pc, pc, r1, lsl #0x2
    b .L_0203f254
.L_0203f0e8: ; jump table
    b .L_0203f254 ; case 0
    b .L_0203f1e0 ; case 1
    b .L_0203f1cc ; case 2
    b .L_0203f1cc ; case 3
    b .L_0203f1cc ; case 4
    b .L_0203f164 ; case 5
    b .L_0203f164 ; case 6
    b .L_0203f144 ; case 7
    b .L_0203f1c4 ; case 8
    b .L_0203f1c4 ; case 9
    b .L_0203f254 ; case 10
    b .L_0203f240 ; case 11
    b .L_0203f254 ; case 12
    b .L_0203f248 ; case 13
    b .L_0203f254 ; case 14
    b .L_0203f254 ; case 15
    b .L_0203f254 ; case 16
    b .L_0203f1f4 ; case 17
    b .L_0203f210 ; case 18
    b .L_0203f21c ; case 19
    b .L_0203f1f0 ; case 20
    b .L_0203f254 ; case 21
    b .L_0203f1d8 ; case 22
.L_0203f144:
    ldrh r2, [r7, #0x4e]
    ldr r1, .L_0203f2d4
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    ldrneb r1, [r7, #0xd4]
    movne r6, #0x1
    addne r5, r1, #0x15
    bne .L_0203f254
.L_0203f164:
    ldr r1, .L_0203f2d8
    ldr r3, [r7, #0x218]
    ldr r1, [r1, #0xc8]
    mov r5, #0x0
    cmp r3, r1
    mov ip, #0x1
    ldr r1, .L_0203f2dc
    bne .L_0203f198
    ldr r2, [r7, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0203f198:
    cmp ip, #0x0
    bne .L_0203f1b4
    ldrh r2, [r7, #0x4e]
    ldr r1, .L_0203f2e0
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    movne r5, #0x1
.L_0203f1b4:
    cmp r5, #0x0
    movne r0, #0x1
    ldrb r5, [r7, #0xd4]
    b .L_0203f254
.L_0203f1c4:
    ldrb r5, [r7, #0xd4]
    b .L_0203f254
.L_0203f1cc:
    ldrb r1, [r7, #0xd4]
    add r5, r1, #0x8
    b .L_0203f254
.L_0203f1d8:
    mov r5, #0x11
    b .L_0203f254
.L_0203f1e0:
    ldrb r1, [r7, #0xd4]
    mov r4, r0
    mov r6, #0x1
    add r5, r1, #0x8
.L_0203f1f0:
    b .L_0203f254
.L_0203f1f4:
    ldrh r2, [r7, #0x4e]
    ldr r1, .L_0203f2e4
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    movne r5, #0x15
    movne r6, #0x1
    b .L_0203f254
.L_0203f210:
    mov r5, #0x10
    mov r6, #0x1
    b .L_0203f254
.L_0203f21c:
    ldrh r2, [r7, #0x4e]
    ldr r1, .L_0203f2e8
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    ldreqb r1, [r7, #0xd4]
    movne r5, #0x14
    movne r6, #0x1
    addeq r5, r1, #0x8
    b .L_0203f254
.L_0203f240:
    mov r5, #0x12
    b .L_0203f254
.L_0203f248:
    ldrb r1, [r7, #0xd4]
    mov r6, #0x1
    add r5, r1, #0x16
.L_0203f254:
    add r0, r7, r0, lsl #0x2
    ldr r8, [r0, #0x208]
    mov r0, r7
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r8, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x54]
    ldmib r8, {r2, r3}
    bl func_020740c8
    ldr r0, [r7, #0x54]
    and r1, r5, #0xff
    bl func_02072b68
    ldr r0, [r7, #0x54]
    mov r1, #0x0
    strh r4, [r0, #0x36]
    ldr r0, [r7, #0x54]
    cmp r6, #0x0
    strh r1, [r0, #0x30]
    ldr r1, [r7, #0x54]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x3
    bne .L_0203f2c8
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
.L_0203f2c8:
    strh r0, [r1, #0x24]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0203f2d4: .word data_020e6c0c
.L_0203f2d8: .word data_020df9e8
.L_0203f2dc: .word data_020dfab0
.L_0203f2e0: .word data_020e6ca4
.L_0203f2e4: .word data_020e6b74
.L_0203f2e8: .word data_020e6adc
    .size ActorExtendedType2_ApplyAttachmentState, . - ActorExtendedType2_ApplyAttachmentState

