; Matching retail form; see src/game/presentation_backed_actor_targeting.c.
.extern data_021052fc
.extern gActorRuntimeCollection
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern Actor_UpdatePresentation
.extern ActorContactState_AddContact
.text
    .global PresentationBackedActor_ForwardPairInteraction

PresentationBackedActor_ForwardPairInteraction: ; 0x0204ded4
    ldr ip, .L_0204dedc
    bx ip
.L_0204dedc: .word ActorContactState_AddContact
.size PresentationBackedActor_ForwardPairInteraction, . - PresentationBackedActor_ForwardPairInteraction

    .global PresentationBackedActor_BuildTargetTransform

PresentationBackedActor_BuildTargetTransform: ; 0x0204dee0
    ldr ip, .L_0204dee8
    bx ip
.L_0204dee8: .word Actor_UpdatePresentation
.size PresentationBackedActor_BuildTargetTransform, . - PresentationBackedActor_BuildTargetTransform

    .global PresentationBackedActor_CanAcquireTarget

PresentationBackedActor_CanAcquireTarget: ; 0x0204deec
    stmdb sp!, {r3, lr}
    add r0, r0, #0x100
    ldrh r0, [r0, #0xec]
    cmp r0, #0x1
    bne .L_0204df30
    ldr r0, .L_0204df38
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0204df30
    ldr r0, .L_0204df3c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0xd0]
    tst r0, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_0204df30:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_0204df38: .word gActorRuntimeCollection
.L_0204df3c: .word data_021052fc
.size PresentationBackedActor_CanAcquireTarget, . - PresentationBackedActor_CanAcquireTarget

