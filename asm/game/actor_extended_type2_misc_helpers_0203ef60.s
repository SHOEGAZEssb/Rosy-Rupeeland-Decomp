; Matching retail form; see src/game/actor_extended_type2_misc_helpers.c.
.text
.extern Actor_ClearTransientContactState
    .global ActorExtendedType2_IsStateNot16
    .type ActorExtendedType2_IsStateNot16, @function
ActorExtendedType2_IsStateNot16: ; 0x0203ef60
    ldrsh r0, [r0, #0xd6]
    cmp r0, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    .size ActorExtendedType2_IsStateNot16, . - ActorExtendedType2_IsStateNot16

    .global ActorExtendedType2_GetConstant800
    .type ActorExtendedType2_GetConstant800, @function

ActorExtendedType2_GetConstant800: ; 0x0203ef80
    mov r0, #0x800
    bx lr
    .size ActorExtendedType2_GetConstant800, . - ActorExtendedType2_GetConstant800

    .global ActorExtendedType2_GetConstant800Duplicate
    .type ActorExtendedType2_GetConstant800Duplicate, @function

ActorExtendedType2_GetConstant800Duplicate: ; 0x0203ef88
    mov r0, #0x800
    bx lr
    .size ActorExtendedType2_GetConstant800Duplicate, . - ActorExtendedType2_GetConstant800Duplicate

    .global ActorExtendedType2_ClearTransientInteractionState
    .type ActorExtendedType2_ClearTransientInteractionState, @function

ActorExtendedType2_ClearTransientInteractionState: ; 0x0203ef90
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_ClearTransientContactState
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x190
    str r0, [r4, #0x260]
    ldmia sp!, {r4, pc}
    .size ActorExtendedType2_ClearTransientInteractionState, . - ActorExtendedType2_ClearTransientInteractionState

