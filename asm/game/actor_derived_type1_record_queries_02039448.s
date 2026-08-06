; Matching retail form; see src/game/actor_derived_type1_record_queries.c.
.text
    .global func_02039448
    .type func_02039448, @function
func_02039448: ; 0x02039448
    ldr r1, [r0, #0x27c]
    mov r0, #0x0
    cmp r1, #0x0
    bxeq lr
    ldrb r1, [r1, #0x8]
    cmp r1, #0x6f
    moveq r0, #0x1
    bx lr
    .size func_02039448, . - func_02039448
