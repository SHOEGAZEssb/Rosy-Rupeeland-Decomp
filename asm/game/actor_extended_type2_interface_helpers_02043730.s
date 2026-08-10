; Matching retail form; see src/game/actor_extended_type2_interface_helpers.c.
.text
.extern AttachmentController_SetEnabled
.global ActorExtendedType2_GetConstant16
.type ActorExtendedType2_GetConstant16, @function
ActorExtendedType2_GetConstant16: ; 0x02043730
    mov r0, #0x10
    bx lr

.size ActorExtendedType2_GetConstant16, . - ActorExtendedType2_GetConstant16

.global ActorExtendedType2_ForwardVirtual108
.type ActorExtendedType2_ForwardVirtual108, @function
ActorExtendedType2_ForwardVirtual108: ; 0x02043738
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x108]
    blx r3
    ldmia sp!, {r3, pc}

.size ActorExtendedType2_ForwardVirtual108, . - ActorExtendedType2_ForwardVirtual108

.global ActorExtendedType2_ForwardVirtual108Duplicate
.type ActorExtendedType2_ForwardVirtual108Duplicate, @function
ActorExtendedType2_ForwardVirtual108Duplicate: ; 0x02043750
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x108]
    blx r3
    ldmia sp!, {r3, pc}

.size ActorExtendedType2_ForwardVirtual108Duplicate, . - ActorExtendedType2_ForwardVirtual108Duplicate

.global ActorExtendedType2_ReturnZero
.type ActorExtendedType2_ReturnZero, @function
ActorExtendedType2_ReturnZero: ; 0x02043768
    mov r0, #0x0
    bx lr

.size ActorExtendedType2_ReturnZero, . - ActorExtendedType2_ReturnZero

.global ActorExtendedType2_SetRuntimeFlag10
.type ActorExtendedType2_SetRuntimeFlag10, @function
ActorExtendedType2_SetRuntimeFlag10: ; 0x02043770
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x10
    str r1, [r0, #0x260]
    bx lr

.size ActorExtendedType2_SetRuntimeFlag10, . - ActorExtendedType2_SetRuntimeFlag10

.global ActorExtendedType2_IsMode8
.type ActorExtendedType2_IsMode8, @function
ActorExtendedType2_IsMode8: ; 0x02043780
    ldrb r0, [r0, #0x24c]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    bx lr

.size ActorExtendedType2_IsMode8, . - ActorExtendedType2_IsMode8

.global ActorExtendedType2_IsCurrentState5Or6
.type ActorExtendedType2_IsCurrentState5Or6, @function
ActorExtendedType2_IsCurrentState5Or6: ; 0x02043794
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x5
    cmpne r1, #0x6
    movne r0, #0x0
    bx lr

.size ActorExtendedType2_IsCurrentState5Or6, . - ActorExtendedType2_IsCurrentState5Or6

.global ActorExtendedType2_IsPreviousState9Or10
.type ActorExtendedType2_IsPreviousState9Or10, @function
ActorExtendedType2_IsPreviousState9Or10: ; 0x020437ac
    ldrsh r1, [r0, #0xd8]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr

.size ActorExtendedType2_IsPreviousState9Or10, . - ActorExtendedType2_IsPreviousState9Or10

.global ActorExtendedType2_IsCurrentState9Or10
.type ActorExtendedType2_IsCurrentState9Or10, @function
ActorExtendedType2_IsCurrentState9Or10: ; 0x020437c4
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr

.size ActorExtendedType2_IsCurrentState9Or10, . - ActorExtendedType2_IsCurrentState9Or10

.global ActorExtendedType2_EnableAttachmentController
.type ActorExtendedType2_EnableAttachmentController, @function
ActorExtendedType2_EnableAttachmentController: ; 0x020437dc
    ldr ip, .L_020437e8
    add r0, r0, #0x284
    bx ip
.L_020437e8: .word AttachmentController_SetEnabled

.size ActorExtendedType2_EnableAttachmentController, . - ActorExtendedType2_EnableAttachmentController

.global ActorExtendedType2_GetConstant20000
.type ActorExtendedType2_GetConstant20000, @function
ActorExtendedType2_GetConstant20000: ; 0x020437ec
    mov r0, #0x20000
    bx lr
.size ActorExtendedType2_GetConstant20000, . - ActorExtendedType2_GetConstant20000
