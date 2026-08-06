; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern data_020d8ae4

    .global func_02028388
    .type func_02028388, @function
func_02028388: ; 0x02028388
    ldr r2, .L_02028398
    mov r1, #0x58
    mla r0, r1, r0, r2
    bx lr
.L_02028398: .word data_020d8ae4
    .size func_02028388, . - func_02028388

