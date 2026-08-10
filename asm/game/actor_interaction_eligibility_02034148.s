; Matching retail form; see src/game/actor_interaction_eligibility.c.
.text
.extern func_020573e4

    .global Actor_PollInteractionResource
    .type Actor_PollInteractionResource, @function
Actor_PollInteractionResource: ; 0x02034148
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x1e0]
    cmp r0, #0x0
    beq .L_0203415c
    bl func_020573e4
.L_0203415c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size Actor_PollInteractionResource, . - Actor_PollInteractionResource

    .global func_02034164

