; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern data_020d4860

    .global GamePhaseVariant_GetPointerTableEntry
    .type GamePhaseVariant_GetPointerTableEntry, @function
GamePhaseVariant_GetPointerTableEntry: ; 0x0202852c
    mov r1, #0x18
    mul r1, r0, r1
    ldr r0, .L_02028540
    ldr r0, [r0, r1]
    bx lr
.L_02028540: .word data_020d4860
    .size GamePhaseVariant_GetPointerTableEntry, . - GamePhaseVariant_GetPointerTableEntry

