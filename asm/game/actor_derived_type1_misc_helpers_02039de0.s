; Matching retail form; see src/game/actor_derived_type1_misc_helpers.c.
.text
.extern gActorInteractionResourceState
.extern AttachmentController_SetEnabled

    .global ActorDerivedType1_IsInteractionActive
    .type ActorDerivedType1_IsInteractionActive, @function
ActorDerivedType1_IsInteractionActive: ; 0x02039de0
    ldr r1, [r0, #0xd0]
    tst r1, #0x40
    addeq r0, r0, #0x200
    ldreqh r0, [r0, #0xa2]
    cmpeq r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    .size ActorDerivedType1_IsInteractionActive, . - ActorDerivedType1_IsInteractionActive

    .global ActorDerivedType1_IsCurrentState5Or6
    .type ActorDerivedType1_IsCurrentState5Or6, @function
ActorDerivedType1_IsCurrentState5Or6: ; 0x02039e00
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x5
    cmpne r1, #0x6
    movne r0, #0x0
    bx lr
    .size ActorDerivedType1_IsCurrentState5Or6, . - ActorDerivedType1_IsCurrentState5Or6

    .global ActorDerivedType1_IsPreviousState9Or10
    .type ActorDerivedType1_IsPreviousState9Or10, @function
ActorDerivedType1_IsPreviousState9Or10: ; 0x02039e18
    ldrsh r1, [r0, #0xd8]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr
    .size ActorDerivedType1_IsPreviousState9Or10, . - ActorDerivedType1_IsPreviousState9Or10

    .global ActorDerivedType1_IsCurrentState9Or10
    .type ActorDerivedType1_IsCurrentState9Or10, @function
ActorDerivedType1_IsCurrentState9Or10: ; 0x02039e30
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr
    .size ActorDerivedType1_IsCurrentState9Or10, . - ActorDerivedType1_IsCurrentState9Or10

    .global ActorDerivedType1_SetAttachmentControllerEnabled
    .type ActorDerivedType1_SetAttachmentControllerEnabled, @function
ActorDerivedType1_SetAttachmentControllerEnabled: ; 0x02039e48
    ldr ip, .L_02039e54
    add r0, r0, #0x2a8
    bx ip
.L_02039e54: .word AttachmentController_SetEnabled
    .size ActorDerivedType1_SetAttachmentControllerEnabled, . - ActorDerivedType1_SetAttachmentControllerEnabled

    .global ActorDerivedType1_ClearField2A4
    .type ActorDerivedType1_ClearField2A4, @function
ActorDerivedType1_ClearField2A4: ; 0x02039e58
    add r0, r0, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa4]
    bx lr
    .size ActorDerivedType1_ClearField2A4, . - ActorDerivedType1_ClearField2A4

    .global ActorDerivedType1_GetConstant10000
    .type ActorDerivedType1_GetConstant10000, @function
ActorDerivedType1_GetConstant10000: ; 0x02039e68
    mov r0, #0x10000
    bx lr
    .size ActorDerivedType1_GetConstant10000, . - ActorDerivedType1_GetConstant10000

    .global ActorDerivedType1_GetSingletonObject
    .type ActorDerivedType1_GetSingletonObject, @function
ActorDerivedType1_GetSingletonObject: ; 0x02039e70
    ldr r0, .L_02039e7c
    ldr r0, [r0, #0xc]
    bx lr
.L_02039e7c: .word gActorInteractionResourceState
    .size ActorDerivedType1_GetSingletonObject, . - ActorDerivedType1_GetSingletonObject

    .global ActorDerivedType1_SetSingletonFieldE4To20E
    .type ActorDerivedType1_SetSingletonFieldE4To20E, @function
ActorDerivedType1_SetSingletonFieldE4To20E: ; 0x02039e80
    ldr r0, .L_02039e98
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    ldrne r0, .L_02039e9c
    strneh r0, [r1, #0xe4]
    bx lr
.L_02039e98: .word gActorInteractionResourceState
.L_02039e9c: .word 0x20e
    .size ActorDerivedType1_SetSingletonFieldE4To20E, . - ActorDerivedType1_SetSingletonFieldE4To20E
