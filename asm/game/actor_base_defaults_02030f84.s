; Matching retail form; see src/game/actor_base_defaults.c.
.text
.extern data_02105680

    .global func_02030f84
    .type func_02030f84, @function
func_02030f84: ; 0x02030f84
    ldr r2, .L_02030f94
    strh r0, [r2, #0x0]
    strh r1, [r2, #0x2]
    bx lr
.L_02030f94: .word data_02105680
    .size func_02030f84, . - func_02030f84
