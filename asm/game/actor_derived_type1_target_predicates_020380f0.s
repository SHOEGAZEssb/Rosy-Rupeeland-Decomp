; Matching retail form; see src/game/actor_derived_type1_target_predicates.c.
.text

    .global func_020380f0
    .type func_020380f0, @function
func_020380f0: ; 0x020380f0
    ldrb r1, [r0, #0x27e]
    mov r0, #0x0
    add r1, r1, #0xff
    and r2, r1, #0xff
    cmp r2, #0x1f
    bxhi lr
    mov r1, #0x1
    mov r2, r1, lsl r2
    tst r2, #0x90000007
    movne r0, r1
    bx lr
    .size func_020380f0, . - func_020380f0
