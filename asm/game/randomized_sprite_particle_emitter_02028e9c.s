; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern Heap_Free
.extern func_02028cd4

    .global func_02028e9c
    .type func_02028e9c, @function
func_02028e9c: ; 0x02028e9c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r1, r0
    ldreq r0, [r1, #0x0]
    streq r0, [r4, #0x4]
    ldrne r2, [r1, #0x0]
    ldrne r0, [r1, #0x4]
    strne r2, [r0, #0x0]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    ldreq r0, [r1, #0x4]
    streq r0, [r4, #0x8]
    ldmneia r1, {r0, r2}
    strne r2, [r0, #0x4]
    cmp r1, #0x0
    beq .L_02028ee8
    mov r0, r1
    bl Heap_Free
.L_02028ee8:
    ldr r0, [r4, #0xc]
    subs r0, r0, #0x1
    str r0, [r4, #0xc]
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_02028cd4
    ldmia sp!, {r4, pc}
    .size func_02028e9c, . - func_02028e9c

