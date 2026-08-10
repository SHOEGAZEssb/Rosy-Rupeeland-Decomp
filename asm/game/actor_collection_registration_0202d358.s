; Matching retail form; see src/game/actor_collection_registration.c.
.text
.extern ActorCollection_UnregisterActor

    .global ActorCollection_UnregisterAndDestroyActor
    .type ActorCollection_UnregisterAndDestroyActor, @function
ActorCollection_UnregisterAndDestroyActor: ; 0x0202d358
    stmdb sp!, {r4, lr}
    mov r4, r1
    bl ActorCollection_UnregisterActor
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldmia sp!, {r4, pc}
    .size ActorCollection_UnregisterAndDestroyActor, . - ActorCollection_UnregisterAndDestroyActor
