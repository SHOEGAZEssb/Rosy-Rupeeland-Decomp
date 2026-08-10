; Matching retail form; see src/game/actor_collection_registration.c.
.text
.extern ActorCollection_UnregisterActor

    .global ActorCollection_UnregisterAndDestroyAllActors
    .type ActorCollection_UnregisterAndDestroyAllActors, @function
ActorCollection_UnregisterAndDestroyAllActors: ; 0x0202d380
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, #0x0
.L_0202d38c:
    ldr r5, [r6, r4, lsl #0x2]
    cmp r5, #0x0
    beq .L_0202d3bc
    mov r0, r6
    mov r1, r5
    bl ActorCollection_UnregisterActor
    cmp r5, #0x0
    beq .L_0202d3bc
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0202d3bc:
    add r4, r4, #0x1
    cmp r4, #0x80
    blt .L_0202d38c
    ldmia sp!, {r4, r5, r6, pc}
    .size ActorCollection_UnregisterAndDestroyAllActors, . - ActorCollection_UnregisterAndDestroyAllActors
