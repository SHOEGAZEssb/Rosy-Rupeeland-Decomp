; Matching retail form; see src/game/actor_extended_type2_interaction_accumulate.c.
.text
.extern data_020df9e8
.extern ActorExtendedRecordArray_ContainsPoint
.extern ActorExtendedType2_IsDirectionToActorAccepted
.extern func_020be334
.global ActorExtendedType2_AccumulateProximityInteraction
.type ActorExtendedType2_AccumulateProximityInteraction, @function
ActorExtendedType2_AccumulateProximityInteraction: ; 0x0203fea0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    ldr r1, [r6, #0xd0]
    mov r7, r0
    tst r1, #0x100
    mov r5, r2
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r5, #0x1e]
    mov r2, r6
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x1e
    bl ActorExtendedType2_IsDirectionToActorAccepted
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x1a]
    tst r0, #0x100
    bne .L_0203ff08
    ldr r1, [r7, #0x24]
    ldr r0, [r6, #0x24]
    sub r0, r1, r0
    bl func_020be334
    cmp r0, #0x28000
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
.L_0203ff08:
    ldr r0, [r7, #0x278]
    mov r4, #0x0
    cmp r0, #0x0
    beq .L_0203ff30
    ldr r1, [r6, #0x1c]
    ldr r2, [r6, #0x20]
    bl ActorExtendedRecordArray_ContainsPoint
    cmp r0, #0x0
    movne r4, #0x1
    b .L_0203ff80
.L_0203ff30:
    ldr r2, [r7, #0x1c]
    ldr r1, [r6, #0x1c]
    ldr r0, [r7, #0x260]
    sub r3, r2, r1
    ldr r2, [r7, #0x20]
    ldr r1, [r6, #0x20]
    tst r0, #0x40000
    sub r0, r2, r1
    mov ip, r0, asr #0xc
    ldrne r1, [r7, #0x24]
    ldrne r0, [r6, #0x24]
    ldrsh r2, [r5, #0xa]
    subne r0, r1, r0
    subne ip, ip, r0, asr #0xc
    mul r0, ip, ip
    mov r3, r3, asr #0xc
    mla r1, r3, r3, r0
    mul r0, r2, r2
    cmp r1, r0
    movlt r4, #0x1
.L_0203ff80:
    cmp r4, #0x0
    add r0, r7, #0x200
    beq .L_0203ffe8
    ldrh r3, [r0, #0x5e]
    ldrsh r2, [r5, #0x16]
    ldr r1, .L_0203fff8
    add r2, r3, r2
    strh r2, [r0, #0x5e]
    ldrh r0, [r0, #0x5e]
    cmp r0, r1
    blo .L_0203ffdc
    mov r0, r7
    ldr r2, [r0, #0x0]
    mov r1, r6
    ldr r2, [r2, #0xd4]
    blx r2
    ldr r1, .L_0203fffc
    mov r0, #0x1
    ldr r2, [r1, #0x20]
    ldr r1, [r1, #0x24]
    str r2, [r7, #0x220]
    str r1, [r7, #0x224]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0203ffdc:
    mov r0, #0x6
    strb r0, [r7, #0x24c]
    b .L_0203fff0
.L_0203ffe8:
    mov r1, #0x0
    strh r1, [r0, #0x5e]
.L_0203fff0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0203fff8: .word 0x1770
.L_0203fffc: .word data_020df9e8
.size ActorExtendedType2_AccumulateProximityInteraction, . - ActorExtendedType2_AccumulateProximityInteraction

