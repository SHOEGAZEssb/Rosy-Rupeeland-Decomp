; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern data_020d4740

    .global func_020284f0
    .type func_020284f0, @function
func_020284f0: ; 0x020284f0
    ldrsb r1, [r0, #0x4c]
    ldr r2, .L_02028504
    mov r0, #0x1e
    mla r0, r1, r0, r2
    bx lr
.L_02028504: .word data_020d4740
    .size func_020284f0, . - func_020284f0

