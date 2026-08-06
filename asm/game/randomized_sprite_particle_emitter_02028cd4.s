; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern Heap_Free

    .global func_02028cd4
    .type func_02028cd4, @function
func_02028cd4: ; 0x02028cd4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b .L_02028cf8
.L_02028ce4:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq .L_02028cf4
    bl Heap_Free
.L_02028cf4:
    mov r0, r4
.L_02028cf8:
    cmp r0, #0x0
    bne .L_02028ce4
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02028cd4, . - func_02028cd4

