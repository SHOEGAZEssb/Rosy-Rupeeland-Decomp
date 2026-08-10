; Matching retail form; see src/game/tracked_resource_actor_flag_update.c.
.text
    .global TrackedResourceActor_UpdateDelayedFlag
TrackedResourceActor_UpdateDelayedFlag:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0xd0]
    blx r1
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x100
    ldrsh r0, [r0, #0xf8]
    cmp r0, #0x14
    ldrgt r0, [r4, #0x10]
    bicgt r0, r0, #0x40000
    strgt r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.size TrackedResourceActor_UpdateDelayedFlag, . - TrackedResourceActor_UpdateDelayedFlag

