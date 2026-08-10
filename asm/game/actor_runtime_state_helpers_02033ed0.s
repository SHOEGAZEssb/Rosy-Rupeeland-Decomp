; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text

    .global Actor_SaveAndForceFlags
    .type Actor_SaveAndForceFlags, @function
Actor_SaveAndForceFlags: ; 0x02033ed0
    ldr r1, [r0, #0xd0]
    tst r1, #0x400
    bxne lr
    orr r1, r1, #0x400
    str r1, [r0, #0xd0]
    ldr r1, [r0, #0x14]
    str r1, [r0, #0xc]
    ldr r1, [r0, #0x14]
    orr r1, r1, #0xe
    str r1, [r0, #0x14]
    bx lr
    .size Actor_SaveAndForceFlags, . - Actor_SaveAndForceFlags

    .global Actor_RestoreSavedFlags

