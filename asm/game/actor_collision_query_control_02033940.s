; Matching retail form; see src/game/actor_collision_query_control.c.
.text

    .global Actor_ClearInteractionFlag2000
    .type Actor_ClearInteractionFlag2000, @function
Actor_ClearInteractionFlag2000: ; 0x02033940
    ldr r1, [r0, #0x10]
    bic r1, r1, #0x2000
    str r1, [r0, #0x10]
    mov r0, #0x0
    bx lr
    .size Actor_ClearInteractionFlag2000, . - Actor_ClearInteractionFlag2000

    .global Actor_TestQueryPointAndClearFlag2000

