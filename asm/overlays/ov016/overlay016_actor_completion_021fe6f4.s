    .text
    .extern Overlay016_HasActorReachedLimit

/* Exact fallbacks for group completion; see src/overlays/ov016/overlay016_actor_runtime.c. */
    .global Overlay016_HasActorGroupCompleted

Overlay016_HasActorGroupCompleted:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0xcc]
    cmp r1, #0x0
    beq L_021fe710
    mov r0, r1
    bl Overlay016_HasActorReachedLimit
    ldmia sp!, {r3, pc}
L_021fe710:
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl Overlay016_HasActorReachedLimit
    ldmia sp!, {r3, pc}

    .size Overlay016_HasActorGroupCompleted, . - Overlay016_HasActorGroupCompleted
