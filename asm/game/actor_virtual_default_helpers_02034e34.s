; Matching retail form; see src/game/actor_virtual_default_helpers.c.
.text

    .global Actor_PrepareForAuxiliaryInteraction
    .type Actor_PrepareForAuxiliaryInteraction, @function
Actor_PrepareForAuxiliaryInteraction: ; 0x02034e34
    ldr r1, [r0, #0xd0]
    orr r1, r1, #0x80
    str r1, [r0, #0xd0]
    bx lr
    .size Actor_PrepareForAuxiliaryInteraction, . - Actor_PrepareForAuxiliaryInteraction

    .global Actor_DefaultSecondaryQueryReturnZero
