; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text

    .global Actor_RestoreSavedFlags
    .type Actor_RestoreSavedFlags, @function
Actor_RestoreSavedFlags: ; 0x02033efc
    ldr r1, [r0, #0xd0]
    tst r1, #0x400
    bicne r1, r1, #0x400
    strne r1, [r0, #0xd0]
    ldrne r1, [r0, #0xc]
    strne r1, [r0, #0x14]
    bx lr
    .size Actor_RestoreSavedFlags, . - Actor_RestoreSavedFlags

    .global Actor_SetScale

