; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern data_020de89c

    .global func_02028c94
    .type func_02028c94, @function
func_02028c94: ; 0x02028c94
    ldr r2, .L_02028cb0
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
.L_02028cb0: .word data_020de89c
    .size func_02028c94, . - func_02028c94

