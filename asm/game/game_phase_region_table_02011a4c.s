; Matching retail form; see src/game/game_phase_region_table_flags.c.
.text
.extern data_021055c8

    .global func_02011a4c
func_02011a4c: ; 0x02011a4c
    ldr r1, L_02011a58
    str r0, [r1, #0x0]
    bx lr
L_02011a58: .word data_021055c8
    .size func_02011a4c, . - func_02011a4c

