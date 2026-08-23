; Matching retail form; see src/game/actor_derived_runtime_virtual_wrappers.c.
.text
.extern ActorContactState_RemoveContact
.extern Actor_SetInteractionFlag2000
.extern Actor_ClearInteractionFlag2000
.extern Actor_TestQueryPointAndClearFlag2000
.extern Actor_PollInteractionIconState
    .global ActorDerivedRuntime_HandlePairEnded
    .type ActorDerivedRuntime_HandlePairEnded, @function
ActorDerivedRuntime_HandlePairEnded: ; 0x0203baa0
    ldr ip, .L_0203baa8
    bx ip
.L_0203baa8: .word ActorContactState_RemoveContact
    .size ActorDerivedRuntime_HandlePairEnded, . - ActorDerivedRuntime_HandlePairEnded

    .global ActorDerivedRuntime_NoOp
    .type ActorDerivedRuntime_NoOp, @function
ActorDerivedRuntime_NoOp: ; 0x0203baac
    bx lr
    .size ActorDerivedRuntime_NoOp, . - ActorDerivedRuntime_NoOp

    .global ActorDerivedRuntime_AcceptInteractionQuery
    .type ActorDerivedRuntime_AcceptInteractionQuery, @function
ActorDerivedRuntime_AcceptInteractionQuery: ; 0x0203bab0
    stmdb sp!, {r3, lr}
    bl Actor_SetInteractionFlag2000
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size ActorDerivedRuntime_AcceptInteractionQuery, . - ActorDerivedRuntime_AcceptInteractionQuery

    .global ActorDerivedRuntime_ClearInteractionQueryState
    .type ActorDerivedRuntime_ClearInteractionQueryState, @function
ActorDerivedRuntime_ClearInteractionQueryState: ; 0x0203bac0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_ClearInteractionFlag2000
    mov r0, r4
    bl Actor_PollInteractionIconState
    ldmia sp!, {r4, pc}
    .size ActorDerivedRuntime_ClearInteractionQueryState, . - ActorDerivedRuntime_ClearInteractionQueryState

    .global ActorDerivedRuntime_TestInteractionQuery
    .type ActorDerivedRuntime_TestInteractionQuery, @function
ActorDerivedRuntime_TestInteractionQuery: ; 0x0203bad8
    ldr ip, .L_0203bae0
    bx ip
.L_0203bae0: .word Actor_TestQueryPointAndClearFlag2000
    .size ActorDerivedRuntime_TestInteractionQuery, . - ActorDerivedRuntime_TestInteractionQuery


