; Matching retail form; see src/game/actor_base_defaults.c.
.text
.extern gActorInteractionDirectionIndex

    .global ActorInteraction_SetDirectionAndMagnitude
    .type ActorInteraction_SetDirectionAndMagnitude, @function
ActorInteraction_SetDirectionAndMagnitude: ; 0x02030f84
    ldr r2, .L_02030f94
    strh r0, [r2, #0x0]
    strh r1, [r2, #0x2]
    bx lr
.L_02030f94: .word gActorInteractionDirectionIndex
    .size ActorInteraction_SetDirectionAndMagnitude, . - ActorInteraction_SetDirectionAndMagnitude
