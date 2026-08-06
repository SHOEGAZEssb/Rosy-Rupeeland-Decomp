; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern data_020d8ae4

    .global func_02028508
    .type func_02028508, @function
func_02028508: ; 0x02028508
    ldr r1, .L_02028528
    sub r2, r0, #0x1
    mov r0, #0x58
    mla r0, r2, r0, r1
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x1c
    bx lr
.L_02028528: .word data_020d8ae4
    .size func_02028508, . - func_02028508

