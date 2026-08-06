; Matching retail form; see src/game/actor_derived_type1_query_helpers.c.
.text

    .global func_02037298
    .type func_02037298, @function
func_02037298: ; 0x02037298
    add r0, r0, #0x100
    ldrh r0, [r0, #0xf0]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x11
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    .size func_02037298, . - func_02037298
