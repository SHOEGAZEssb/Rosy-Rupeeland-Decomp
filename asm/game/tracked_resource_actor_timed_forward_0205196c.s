; Matching retail form; see src/game/tracked_resource_actor_timed_forward.c.
.extern ActorContactState_AddContact
.text
    .global TrackedResourceActorType26_ForwardInteractionCallback
TrackedResourceActorType26_ForwardInteractionCallback:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, [r0, #0x0]
    mov r6, r0
    ldr r3, [r3, #0xc4]
    mov r5, r1
    mov r4, r2
    blx r3
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorContactState_AddContact
    ldmia sp!, {r4, r5, r6, pc}
    .size TrackedResourceActorType26_ForwardInteractionCallback, . - TrackedResourceActorType26_ForwardInteractionCallback
