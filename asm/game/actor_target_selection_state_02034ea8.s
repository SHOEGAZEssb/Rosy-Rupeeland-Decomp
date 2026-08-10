; Matching retail form; see src/game/actor_target_selection_state.c.
.text
.extern gActorTargetSelectionCandidates

    .global ActorTargetSelection_ClearCandidates
    .type ActorTargetSelection_ClearCandidates, @function
ActorTargetSelection_ClearCandidates: ; 0x02034ea8
    mov r2, #0x0
    ldr r0, .L_02034ec8
    mov r1, r2
.L_02034eb4:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0xa
    blt .L_02034eb4
    bx lr
.L_02034ec8: .word gActorTargetSelectionCandidates
    .size ActorTargetSelection_ClearCandidates, . - ActorTargetSelection_ClearCandidates

    .global ActorTargetSelection_Populate

