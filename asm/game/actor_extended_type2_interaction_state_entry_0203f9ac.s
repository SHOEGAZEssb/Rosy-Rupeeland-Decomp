; Matching retail form; see src/game/actor_extended_type2_interaction_state_entry.c.
.text
.extern data_020df9e8
.extern data_020e7318
.extern VecFx32Object_Assign
.extern Actor_PlayHorizontalSpatialSound
    .global ActorExtendedType2_EnterTargetInteractionState7
    .type ActorExtendedType2_EnterTargetInteractionState7, @function
ActorExtendedType2_EnterTargetInteractionState7: ; 0x0203f9ac
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r3, r5, #0x200
    mov r2, #0x0
    strh r2, [r3, #0x5e]
    strh r2, [r3, #0x5a]
    ldrh ip, [r5, #0x4e]
    ldr r3, .L_0203fa60
    mov r4, r1
    mov r1, ip, lsl #0x1
    ldrh r1, [r3, r1]
    ldr r3, .L_0203fa64
    cmp r1, r3
    beq .L_0203f9e8
    bl Actor_PlayHorizontalSpatialSound
.L_0203f9e8:
    ldr r1, [r5, #0x260]
    ldr r0, .L_0203fa68
    bic r1, r1, #0x1
    str r1, [r5, #0x260]
    str r4, [r5, #0x228]
    ldr r2, [r0, #0x30]
    ldr r0, [r0, #0x34]
    mov r1, #0x7
    str r2, [r5, #0x218]
    str r0, [r5, #0x21c]
    strh r1, [r5, #0xd6]
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r4, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    ldr r0, [r5, #0x26c]
    cmp r0, #0x0
    add r0, r5, #0x23c
    bne .L_0203fa44
    add r1, r5, #0x22c
    bl VecFx32Object_Assign
    b .L_0203fa4c
.L_0203fa44:
    add r1, r5, #0x18
    bl VecFx32Object_Assign
.L_0203fa4c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd8]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.L_0203fa60: .word data_020e7318
.L_0203fa64: .word 0xffff
.L_0203fa68: .word data_020df9e8
    .size ActorExtendedType2_EnterTargetInteractionState7, . - ActorExtendedType2_EnterTargetInteractionState7

    .global ActorExtendedType2_InteractionNoOp
    .type ActorExtendedType2_InteractionNoOp, @function

ActorExtendedType2_InteractionNoOp: ; 0x0203fa6c
    bx lr
    .size ActorExtendedType2_InteractionNoOp, . - ActorExtendedType2_InteractionNoOp

    .global ActorExtendedType2_SetTargetCallbackPairC0
    .type ActorExtendedType2_SetTargetCallbackPairC0, @function

ActorExtendedType2_SetTargetCallbackPairC0: ; 0x0203fa70
    add r2, r0, #0x200
    mov r3, #0x0
    strh r3, [r2, #0x5a]
    ldr r3, [r0, #0x260]
    ldr r2, .L_0203faa4
    bic r3, r3, #0x1
    str r3, [r0, #0x260]
    str r1, [r0, #0x228]
    ldr r3, [r2, #0xc0]
    ldr r1, [r2, #0xc4]
    str r3, [r0, #0x218]
    str r1, [r0, #0x21c]
    bx lr
.L_0203faa4: .word data_020df9e8
    .size ActorExtendedType2_SetTargetCallbackPairC0, . - ActorExtendedType2_SetTargetCallbackPairC0

    .global ActorExtendedType2_SetTargetCallbackPair48
    .type ActorExtendedType2_SetTargetCallbackPair48, @function

ActorExtendedType2_SetTargetCallbackPair48: ; 0x0203faa8
    add r2, r0, #0x200
    mov r3, #0x0
    strh r3, [r2, #0x5a]
    ldr r3, [r0, #0x260]
    ldr r2, .L_0203fadc
    bic r3, r3, #0x1
    str r3, [r0, #0x260]
    str r1, [r0, #0x228]
    ldr r3, [r2, #0x48]
    ldr r1, [r2, #0x4c]
    str r3, [r0, #0x218]
    str r1, [r0, #0x21c]
    bx lr
.L_0203fadc: .word data_020df9e8
    .size ActorExtendedType2_SetTargetCallbackPair48, . - ActorExtendedType2_SetTargetCallbackPair48

    .global ActorExtendedType2_SetTargetCallbackPair40AndResetCounters
    .type ActorExtendedType2_SetTargetCallbackPair40AndResetCounters, @function

ActorExtendedType2_SetTargetCallbackPair40AndResetCounters: ; 0x0203fae0
    stmdb sp!, {r3, lr}
    add r2, r0, #0x200
    mov lr, #0x0
    strh lr, [r2, #0x5e]
    ldr ip, [r0, #0x260]
    ldr r3, .L_0203fb20
    bic ip, ip, #0x1
    str ip, [r0, #0x260]
    strh lr, [r2, #0x56]
    str r1, [r0, #0x228]
    ldr ip, [r3, #0x40]
    ldr r1, [r3, #0x44]
    str ip, [r0, #0x218]
    str r1, [r0, #0x21c]
    strh lr, [r2, #0x5a]
    ldmia sp!, {r3, pc}
.L_0203fb20: .word data_020df9e8
    .size ActorExtendedType2_SetTargetCallbackPair40AndResetCounters, . - ActorExtendedType2_SetTargetCallbackPair40AndResetCounters

