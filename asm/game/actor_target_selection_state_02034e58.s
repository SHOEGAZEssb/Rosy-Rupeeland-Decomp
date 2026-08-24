; Matching retail form; see src/game/actor_target_selection_state.c.
.text
.extern gGamePhaseRuntime
.extern gActorTargetSelectionMetadata
.extern gActorTargetSelectionCandidates

    .global ActorTargetSelection_Reset
    .type ActorTargetSelection_Reset, @function
ActorTargetSelection_Reset: ; 0x02034e58
    mov r1, #0x0
    ldr r0, .L_02034e9c
    mov r3, r1
.L_02034e64:
    str r3, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0xa
    blt .L_02034e64
    ldr r1, .L_02034ea0
    mvn r2, #0x0
    strh r3, [r1, #0x2]
    ldr r0, .L_02034ea4
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r3, [r0, #0x278]
    bx lr
.L_02034e9c: .word gActorTargetSelectionCandidates
.L_02034ea0: .word gActorTargetSelectionMetadata
.L_02034ea4: .word gGamePhaseRuntime
    .size ActorTargetSelection_Reset, . - ActorTargetSelection_Reset

    .global ActorTargetSelection_ClearCandidates

