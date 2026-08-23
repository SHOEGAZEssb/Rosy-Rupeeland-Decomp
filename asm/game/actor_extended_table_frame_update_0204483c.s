; Matching retail form; see src/game/actor_extended_table_frame_update.c.
.text
.extern data_020e0ac8
.extern data_020e0ad0
.extern data_020e0ad8
.extern Actor_TurnTowardVector
.extern ActorExtendedType2_UpdateFrame
.extern ActorExtendedType2_GetDescriptorValue2C
.extern ActorExtendedTable_MatchesCallbackPair18
.extern ActorExtendedTable_MatchesCallbackPair00
.global ActorExtendedTable_UpdateFrame
.type ActorExtendedTable_UpdateFrame, @function
ActorExtendedTable_UpdateFrame: ; 0x0204483c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue2C
    cmp r0, #0x0
    bne .L_02044958
    mov r0, r4
    bl ActorExtendedTable_MatchesCallbackPair18
    cmp r0, #0x0
    bne .L_02044948
    mov r0, r4
    bl ActorExtendedTable_MatchesCallbackPair00
    cmp r0, #0x0
    bne .L_02044948
    ldr r0, .L_02044970
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x10]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02044974
    bne .L_020448bc
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_020448bc:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02044948
    ldr r0, .L_02044970
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0x8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02044978
    bne .L_02044900
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02044900:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02044948
    ldr r1, [r4, #0x260]
    mov r0, r4
    orr r1, r1, #0x400
    str r1, [r4, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x140]
    blx r1
    mov r3, r0
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1000
    bl Actor_TurnTowardVector
    b .L_02044964
.L_02044948:
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x400
    str r0, [r4, #0x260]
    b .L_02044964
.L_02044958:
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x400
    str r0, [r4, #0x260]
.L_02044964:
    mov r0, r4
    bl ActorExtendedType2_UpdateFrame
    ldmia sp!, {r4, pc}
.L_02044970: .word data_020e0ac8
.L_02044974: .word data_020e0ad8
.L_02044978: .word data_020e0ad0
.size ActorExtendedTable_UpdateFrame, . - ActorExtendedTable_UpdateFrame
