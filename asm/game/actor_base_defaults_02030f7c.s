; Matching retail form; see src/game/actor_base_defaults.c.
.text

    .global Actor_DefaultQueryReturnZero
    .type Actor_DefaultQueryReturnZero, @function
Actor_DefaultQueryReturnZero: ; 0x02030f7c
    mov r0, #0x0
    bx lr
    .size Actor_DefaultQueryReturnZero, . - Actor_DefaultQueryReturnZero
