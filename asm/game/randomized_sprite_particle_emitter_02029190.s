; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern Heap_Free
.extern data_020de89c
.extern func_02028cd4

    .global func_02029190
    .type func_02029190, @function
func_02029190: ; 0x02029190
    stmdb sp!, {r4, lr}
    ldr r1, .L_020291b4
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02028cd4
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020291b4: .word data_020de89c
    .size func_02029190, . - func_02029190

