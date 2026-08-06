; Matching retail form; see src/game/actor_derived_type1_record_queries.c.
.text
    .global func_020393f4
    .type func_020393f4, @function
func_020393f4: ; 0x020393f4
    ldr r0, [r0, #0x27c]
    cmp r0, #0x0
    ldrnesh r0, [r0, #0x0]
    mvneq r0, #0x0
    bx lr
    .size func_020393f4, . - func_020393f4
