; Matching retail form; see src/game/actor_virtual_default_helpers.c.
.text

    .global Actor_DefaultSecondaryQueryReturnZero
    .type Actor_DefaultSecondaryQueryReturnZero, @function
Actor_DefaultSecondaryQueryReturnZero: ; 0x02034e44
    mov r0, #0x0
    bx lr
    .size Actor_DefaultSecondaryQueryReturnZero, . - Actor_DefaultSecondaryQueryReturnZero

    .global Actor_IsCurrentState9Or10
