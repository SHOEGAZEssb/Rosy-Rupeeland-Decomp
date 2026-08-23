; Matching retail form; see src/game/presentation_backed_actor_targeting.c.
.extern data_021052fc
.extern gActorRuntimeCollection
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern Actor_UpdatePresentation
.extern ActorContactState_AddContact
.extern Type7Actor_GetStateCode
.extern PresentationBackedActor_CanAcquireTarget
.extern PresentationBackedActor_HandleInteraction
.extern func_020adcac
.text
    .global PresentationBackedActor_AcquireNearbyTarget

PresentationBackedActor_AcquireNearbyTarget: ; 0x0204de18
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl PresentationBackedActor_CanAcquireTarget
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, .L_0204ded0
    adds r1, r4, #0x18
    ldr r0, [r0, #0x0]
    addne r1, r1, #0x4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    add r0, r0, #0x18
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, #0x10000
    bge .L_0204de78
    ldr r1, .L_0204ded0
    mov r0, r4
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    bl PresentationBackedActor_HandleInteraction
    ldmia sp!, {r3, r4, r5, pc}
.L_0204de78:
    ldr r0, .L_0204ded0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea8]
    cmp r5, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl Type7Actor_GetStateCode
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    adds r1, r4, #0x18
    add r0, r5, #0x18
    addne r1, r1, #0x4
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, #0x18000
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, r5
    bl PresentationBackedActor_HandleInteraction
    ldmia sp!, {r3, r4, r5, pc}
.L_0204ded0: .word data_021052fc
.size PresentationBackedActor_AcquireNearbyTarget, . - PresentationBackedActor_AcquireNearbyTarget
