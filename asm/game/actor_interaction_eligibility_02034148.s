; Matching retail form; see src/game/actor_interaction_eligibility.c.
.text
.extern ActorInteractionIcon_IsActive

    .global Actor_PollInteractionIconState
    .type Actor_PollInteractionIconState, @function
Actor_PollInteractionIconState: ; 0x02034148
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x1e0]
    cmp r0, #0x0
    beq .L_0203415c
    bl ActorInteractionIcon_IsActive
.L_0203415c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size Actor_PollInteractionIconState, . - Actor_PollInteractionIconState

    .global Actor_UpdateTimedResourceState

