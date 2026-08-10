; Matching retail form; see src/game/actor_extended_link_source_callbacks.c.
.text
.extern ActorExtendedType2_ApplyContactResponse
.global ActorExtendedLinkSource_GetConstant20000
.type ActorExtendedLinkSource_GetConstant20000, @function
.global ActorExtendedLinkSource_ApplyContactResponse
.type ActorExtendedLinkSource_ApplyContactResponse, @function
.global ActorExtendedLinkSource_LinkPartner
.type ActorExtendedLinkSource_LinkPartner, @function
.global ActorExtendedLinkSource_ClearPartnerLinkedFlag
.type ActorExtendedLinkSource_ClearPartnerLinkedFlag, @function
.global ActorExtendedLinkSource_ClearRuntimeFlag2
.type ActorExtendedLinkSource_ClearRuntimeFlag2, @function
.global ActorExtendedLinkSource_IsPartnerLinkAvailable
.type ActorExtendedLinkSource_IsPartnerLinkAvailable, @function
ActorExtendedLinkSource_GetConstant20000: ; 0x02044044
    mov r0, #0x20000
    bx lr

.size ActorExtendedLinkSource_GetConstant20000, . - ActorExtendedLinkSource_GetConstant20000
ActorExtendedLinkSource_ApplyContactResponse: ; 0x0204404c
    ldr ip, .L_02044054
    bx ip
.L_02044054: .word ActorExtendedType2_ApplyContactResponse

.size ActorExtendedLinkSource_ApplyContactResponse, . - ActorExtendedLinkSource_ApplyContactResponse
ActorExtendedLinkSource_LinkPartner: ; 0x02044058
    str r1, [r0, #0x298]
    ldr r2, [r0, #0x29c]
    mov r1, #0x100
    orr r2, r2, #0x1
    str r2, [r0, #0x29c]
    ldr r2, [r0, #0xd0]
    bic r2, r2, #0x100
    str r2, [r0, #0xd0]
    ldr r0, [r0, #0x54]
    strh r1, [r0, #0x32]
    strh r1, [r0, #0x34]
    bx lr

.size ActorExtendedLinkSource_LinkPartner, . - ActorExtendedLinkSource_LinkPartner
ActorExtendedLinkSource_ClearPartnerLinkedFlag: ; 0x02044088
    ldr r1, [r0, #0x29c]
    bic r1, r1, #0x1
    str r1, [r0, #0x29c]
    bx lr

.size ActorExtendedLinkSource_ClearPartnerLinkedFlag, . - ActorExtendedLinkSource_ClearPartnerLinkedFlag
ActorExtendedLinkSource_ClearRuntimeFlag2: ; 0x02044098
    ldr r1, [r0, #0x29c]
    bic r1, r1, #0x2
    str r1, [r0, #0x29c]
    bx lr

.size ActorExtendedLinkSource_ClearRuntimeFlag2, . - ActorExtendedLinkSource_ClearRuntimeFlag2
ActorExtendedLinkSource_IsPartnerLinkAvailable: ; 0x020440a8
    ldrsh r1, [r0, #0xd6]
    cmp r1, #0x10
    beq .L_020440c4
    ldr r0, [r0, #0x29c]
    tst r0, #0x1
    moveq r0, #0x1
    bxeq lr
.L_020440c4:
    mov r0, #0x0
    bx lr
.size ActorExtendedLinkSource_IsPartnerLinkAvailable, . - ActorExtendedLinkSource_IsPartnerLinkAvailable
