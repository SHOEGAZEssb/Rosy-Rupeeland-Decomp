; Matching retail form; see src/game/actor_auxiliary_collision_resource.c.
.text
.extern Heap_Alloc
.extern gActorInteractionIconAllocationTag
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern ActorInteractionIcon_Init
.extern gHeapContext

    .global Actor_EnsureInteractionIcon
    .type Actor_EnsureInteractionIcon, @function
Actor_EnsureInteractionIcon: ; 0x020342ac
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x1e0]
    cmp r0, #0x0
    bne .L_020342fc
    ldr r1, .L_02034318
    ldr r3, .L_0203431c
    mov r0, #0x2c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020342f8
    mov r0, r5
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r1, r0
    mov r0, r4
    bl ActorInteractionIcon_Init
    mov r4, r0
.L_020342f8:
    str r4, [r5, #0x1e0]
.L_020342fc:
    ldrsh r2, [r5, #0x6a]
    ldr r1, [r5, #0x1e0]
    mov r0, #0x0
    str r0, [r1, #0x18]
    mov r0, r2, lsl #0xc
    str r0, [r1, #0x1c]
    ldmia sp!, {r3, r4, r5, pc}
.L_02034318: .word gActorInteractionIconAllocationTag
.L_0203431c: .word gHeapContext
    .size Actor_EnsureInteractionIcon, . - Actor_EnsureInteractionIcon

    .global Actor_DestroyInteractionIcon
