; Matching retail form; see src/game/actor_derived_type1_record_controls.c.
.text
.extern ActorDerivedType1_StartRecord

    .global ActorDerivedType1_StartRecordOrHandleType6D66
    .type ActorDerivedType1_StartRecordOrHandleType6D66, @function
ActorDerivedType1_StartRecordOrHandleType6D66: ; 0x02039240
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x27c]
    cmp r2, #0x0
    beq .L_02039270
    ldrb r1, [r2, #0x8]
    cmp r1, #0x6d
    ldreqsh r1, [r2, #0x0]
    cmpeq r1, #0x66
    addeq r0, r0, #0x200
    moveq r1, #0x6
    streqh r1, [r0, #0x82]
    ldmia sp!, {r3, pc}
.L_02039270:
    bl ActorDerivedType1_StartRecord
    ldmia sp!, {r3, pc}
    .size ActorDerivedType1_StartRecordOrHandleType6D66, . - ActorDerivedType1_StartRecordOrHandleType6D66
