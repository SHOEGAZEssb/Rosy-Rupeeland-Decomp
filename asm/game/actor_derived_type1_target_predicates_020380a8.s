; Matching retail form; see src/game/actor_derived_type1_target_predicates.c.
.text

    .global func_020380a8
    .type func_020380a8, @function
func_020380a8: ; 0x020380a8
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x260]
    mov r4, #0x0
    tst r1, #0x8
    beq .L_020380e8
    tst r1, #0x2
    beq .L_020380dc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_020380e0
.L_020380dc:
    mov r0, #0x0
.L_020380e0:
    cmp r0, #0x0
    movne r4, #0x1
.L_020380e8:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_020380a8, . - func_020380a8
