; Matching retail form; see src/game/actor_collision_query_control.c.
.text

    .global Actor_SetInteractionFlag2000
    .type Actor_SetInteractionFlag2000, @function
Actor_SetInteractionFlag2000: ; 0x0203392c
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x2000
    str r1, [r0, #0x10]
    mov r0, #0x0
    bx lr
    .size Actor_SetInteractionFlag2000, . - Actor_SetInteractionFlag2000

    .global Actor_ClearInteractionFlag2000

