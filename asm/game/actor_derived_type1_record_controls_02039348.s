; Matching retail form; see src/game/actor_derived_type1_record_controls.c.
.text
.extern Actor_ApplyMotionImpulse
.extern ActorDerivedType1_TeardownActiveRecord

    .global ActorDerivedType1_TeardownRecordAndApplyMotionImpulse
    .type ActorDerivedType1_TeardownRecordAndApplyMotionImpulse, @function
ActorDerivedType1_TeardownRecordAndApplyMotionImpulse: ; 0x02039348
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorDerivedType1_TeardownActiveRecord
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl Actor_ApplyMotionImpulse
    ldmia sp!, {r3, r4, r5, pc}
    .size ActorDerivedType1_TeardownRecordAndApplyMotionImpulse, . - ActorDerivedType1_TeardownRecordAndApplyMotionImpulse
