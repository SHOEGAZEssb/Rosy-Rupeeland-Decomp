; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern data_020d4860

    .global func_0202852c
    .type func_0202852c, @function
func_0202852c: ; 0x0202852c
    mov r1, #0x18
    mul r1, r0, r1
    ldr r0, .L_02028540
    ldr r0, [r0, r1]
    bx lr
.L_02028540: .word data_020d4860
    .size func_0202852c, . - func_0202852c

