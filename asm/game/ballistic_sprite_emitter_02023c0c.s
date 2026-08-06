; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern Heap_Free

    .global func_02023c0c
    .type func_02023c0c, @function
func_02023c0c: ; 0x02023c0c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b .L_02023c30
.L_02023c1c:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq .L_02023c2c
    bl Heap_Free
.L_02023c2c:
    mov r0, r4
.L_02023c30:
    cmp r0, #0x0
    bne .L_02023c1c
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02023c0c, . - func_02023c0c
