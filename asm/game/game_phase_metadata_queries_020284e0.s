; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern data_020d4640

    .global func_020284e0
    .type func_020284e0, @function
func_020284e0: ; 0x020284e0
    ldr r1, .L_020284ec
    add r0, r1, r0, lsl #0x4
    bx lr
.L_020284ec: .word data_020d4640
    .size func_020284e0, . - func_020284e0

