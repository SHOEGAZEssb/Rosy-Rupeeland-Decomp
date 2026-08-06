; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern data_020de89c
.extern func_02028cd4

    .global func_02028cb4
    .type func_02028cb4, @function
func_02028cb4: ; 0x02028cb4
    stmdb sp!, {r4, lr}
    ldr r1, .L_02028cd0
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02028cd4
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02028cd0: .word data_020de89c
    .size func_02028cb4, . - func_02028cb4

