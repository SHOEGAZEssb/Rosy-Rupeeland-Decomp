; Matching retail form; see src/game/actor_auxiliary_collision_resource.c.
.text
.extern Heap_Free
.extern ActorInteractionIcon_Destroy

    .global Actor_DestroyInteractionIcon
    .type Actor_DestroyInteractionIcon, @function
Actor_DestroyInteractionIcon: ; 0x02034320
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x1e0]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    beq .L_02034348
    mov r0, r4
    bl ActorInteractionIcon_Destroy
    mov r0, r4
    bl Heap_Free
.L_02034348:
    mov r0, #0x0
    str r0, [r5, #0x1e0]
    ldmia sp!, {r3, r4, r5, pc}
    .size Actor_DestroyInteractionIcon, . - Actor_DestroyInteractionIcon

    .global Actor_GetInteractionIcon
