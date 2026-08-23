; Matching retail form; see src/game/actor_collection_descriptor_helpers.c.
.text

    .global ActorCollection_FindActorByRuntimeId
    .type ActorCollection_FindActorByRuntimeId, @function
ActorCollection_FindActorByRuntimeId: ; 0x02030ad4
    stmdb sp!, {r3, lr}
    add r2, r0, #0x2000
    ldr ip, [r2, #0xe74]
    mov lr, #0x0
    b .L_02030b08
.L_02030ae8:
    ldr r3, [r0, lr, lsl #0x2]
    cmp r3, #0x0
    beq .L_02030b04
    ldrsh r2, [r3, #0xe4]
    cmp r1, r2
    moveq r0, r3
    ldmeqia sp!, {r3, pc}
.L_02030b04:
    add lr, lr, #0x1
.L_02030b08:
    cmp lr, ip
    blt .L_02030ae8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size ActorCollection_FindActorByRuntimeId, . - ActorCollection_FindActorByRuntimeId

