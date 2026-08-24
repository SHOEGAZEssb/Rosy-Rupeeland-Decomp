; Matching retail form; see src/game/actor_extended_type2_interaction_gate.c.
.text
.extern gGamePhaseRuntime
.extern ActorExtendedType2_MatchesInteractionCallbackPairs
.global ActorExtendedType2_TryDescriptorInteraction120
.type ActorExtendedType2_TryDescriptorInteraction120, @function
ActorExtendedType2_TryDescriptorInteraction120: ; 0x020400a4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r2, r5, #0x200
    ldrh r3, [r2, #0x54]
    mov r4, r1
    cmp r3, #0x0
    beq .L_020400dc
    ldr r0, [r5, #0x260]
    bic r0, r0, #0x1
    str r0, [r5, #0x260]
    ldrh r0, [r2, #0x54]
    sub r0, r0, #0x1
    strh r0, [r2, #0x54]
    b .L_02040194
.L_020400dc:
    ldrh r1, [r4, #0x1a]
    tst r1, #0x1
    beq .L_02040194
    ldrsh r1, [r4, #0x16]
    cmp r1, #0x0
    ble .L_02040194
    bl ActorExtendedType2_MatchesInteractionCallbackPairs
    cmp r0, #0x0
    bne .L_02040194
    ldrh r0, [r4, #0x1a]
    tst r0, #0x10
    bne .L_0204013c
    ldr r1, .L_0204019c
    mov r0, r5
    ldr r1, [r1, #0x0]
    ldr r3, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r3, [r3, #0x120]
    mov r2, r4
    blx r3
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_0204013c:
    ldrh r0, [r4, #0x1a]
    tst r0, #0x20
    ldrne r0, .L_0204019c
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r1, [r0, #0xea8]
    cmpne r1, #0x0
    beq .L_02040194
    ldr r0, [r1, #0x268]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02040194
    mov r0, r5
    ldr r3, [r0, #0x0]
    mov r2, r4
    ldr r3, [r3, #0x120]
    blx r3
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_02040194:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_0204019c: .word gGamePhaseRuntime
.size ActorExtendedType2_TryDescriptorInteraction120, . - ActorExtendedType2_TryDescriptorInteraction120

