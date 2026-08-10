; Matching retail form; see src/game/actor_extended_type2_transition_control.c.
.text
.extern data_020df9e8
.extern data_020e6adc
.extern Actor_RestoreSavedFlags
.extern func_020919e8
.global ActorExtendedType2_TransitionNoOp
.type ActorExtendedType2_TransitionNoOp, @function
ActorExtendedType2_TransitionNoOp: ; 0x02040a58
    bx lr
.size ActorExtendedType2_TransitionNoOp, . - ActorExtendedType2_TransitionNoOp
.global ActorExtendedType2_UpdateAttachmentScaleTransition
.type ActorExtendedType2_UpdateAttachmentScaleTransition, @function
ActorExtendedType2_UpdateAttachmentScaleTransition: ; 0x02040a5c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x54]
    mov r2, #0x0
    strh r2, [r1, #0x30]
    ldr ip, [r4, #0x54]
    ldr r1, .L_02040bd0
    ldrh r3, [ip, #0x24]
    ldr r2, .L_02040bd4
    bic r3, r3, #0x4
    strh r3, [ip, #0x24]
    ldr r3, [r4, #0x260]
    and r1, r3, r1
    str r1, [r4, #0x260]
    ldrh r1, [r4, #0x4e]
    ldrb r1, [r2, r1]
    cmp r1, #0x0
    beq .L_02040b28
    ldr r2, [r4, #0x54]
    mov r1, #0x100
    strh r1, [r2, #0x32]
    strh r1, [r2, #0x34]
    ldr r1, [r4, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    moveq r0, #0x13
    streqh r0, [r4, #0xd6]
    beq .L_02040bc8
    ldr r1, .L_02040bd8
    ldr r2, [r1, #0x2c8]
    ldr r1, [r1, #0x2cc]
    str r2, [r4, #0x218]
    str r1, [r4, #0x21c]
    bl Actor_RestoreSavedFlags
    ldr r1, [r4, #0x10]
    mov r0, #0x2
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    ldr r1, [r4, #0x260]
    orr r1, r1, #0x4
    str r1, [r4, #0x260]
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x100
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x3
    str r0, [r4, #0x260]
    b .L_02040bc8
.L_02040b28:
    add r1, r4, #0x200
    ldrh r2, [r1, #0x4e]
    add r2, r2, #0x1
    strh r2, [r1, #0x4e]
    ldrh r3, [r1, #0x4e]
    cmp r3, #0x14
    blo .L_02040b9c
    ldr r3, [r4, #0x54]
    mov r2, #0x100
    strh r2, [r3, #0x32]
    ldr r1, .L_02040bd8
    strh r2, [r3, #0x34]
    ldr r2, [r1, #0x2c0]
    ldr r1, [r1, #0x2c4]
    str r2, [r4, #0x218]
    str r1, [r4, #0x21c]
    bl Actor_RestoreSavedFlags
    ldr r1, [r4, #0x10]
    mov r0, #0x2
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x3
    str r0, [r4, #0x260]
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x100
    str r0, [r4, #0xd0]
    b .L_02040bc8
.L_02040b9c:
    mov r0, #0x20
    mov r1, #0x100
    mov r2, #0x14
    bl func_020919e8
    mov r0, r0, lsl #0x10
    ldr r1, [r4, #0x54]
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    mov r0, #0x13
    strh r0, [r4, #0xd6]
.L_02040bc8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02040bd0: .word 0xffffbffc
.L_02040bd4: .word data_020e6adc
.L_02040bd8: .word data_020df9e8
.size ActorExtendedType2_UpdateAttachmentScaleTransition, . - ActorExtendedType2_UpdateAttachmentScaleTransition
