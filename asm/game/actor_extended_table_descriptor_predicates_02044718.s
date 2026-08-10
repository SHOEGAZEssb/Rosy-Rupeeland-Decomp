; Matching retail form; see src/game/actor_extended_table_descriptor_gates.c.
.text
.extern data_020e0ac8
.extern data_020e0ae0
.global ActorExtendedTable_MatchesCallbackPair18
.type ActorExtendedTable_MatchesCallbackPair18, @function
.global ActorExtendedTable_MatchesCallbackPair00
.type ActorExtendedTable_MatchesCallbackPair00, @function
ActorExtendedTable_MatchesCallbackPair18: ; 0x02044718
    ldr r1, .L_02044758
    ldr r2, [r0, #0x218]
    ldr r1, [r1, #0x18]
    mov ip, #0x1
    cmp r2, r1
    ldr r3, .L_0204475c
    bne .L_02044748
    ldr r1, [r0, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_02044748:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_02044758: .word data_020e0ac8
.L_0204475c: .word data_020e0ae0
.size ActorExtendedTable_MatchesCallbackPair18, . - ActorExtendedTable_MatchesCallbackPair18
ActorExtendedTable_MatchesCallbackPair00: ; 0x02044760
    ldr r1, .L_020447a0
    ldr r2, [r0, #0x218]
    ldr r1, [r1, #0x0]
    mov ip, #0x1
    cmp r2, r1
    ldr r3, .L_020447a4
    bne .L_02044790
    ldr r1, [r0, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_02044790:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_020447a0: .word data_020e0ac8
.L_020447a4: .word data_020e0ac8
.size ActorExtendedTable_MatchesCallbackPair00, . - ActorExtendedTable_MatchesCallbackPair00
