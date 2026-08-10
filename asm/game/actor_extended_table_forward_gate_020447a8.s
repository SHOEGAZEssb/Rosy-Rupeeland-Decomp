; Matching retail form; see src/game/actor_extended_table_descriptor_gates.c.
.text
.extern ActorExtendedType2_AccumulateProximityInteraction
.extern ActorExtendedType2_GetDescriptorValue2C
.extern ActorExtendedTable_MatchesCallbackPair00
.global ActorExtendedTable_ForwardProximityInteraction
.type ActorExtendedTable_ForwardProximityInteraction, @function
ActorExtendedTable_ForwardProximityInteraction: ; 0x020447a8
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl ActorExtendedType2_GetDescriptorValue2C
    cmp r0, #0x0
    bne .L_020447d8
    mov r0, r6
    bl ActorExtendedTable_MatchesCallbackPair00
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_020447d8:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorExtendedType2_AccumulateProximityInteraction
    ldmia sp!, {r4, r5, r6, pc}
.size ActorExtendedTable_ForwardProximityInteraction, . - ActorExtendedTable_ForwardProximityInteraction
