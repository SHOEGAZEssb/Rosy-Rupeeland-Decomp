; Matching retail form; see src/game/actor_target_selection_state.c.
.text
.extern data_02105690

    .global func_02034ea8
    .type func_02034ea8, @function
func_02034ea8: ; 0x02034ea8
    mov r2, #0x0
    ldr r0, .L_02034ec8
    mov r1, r2
.L_02034eb4:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0xa
    blt .L_02034eb4
    bx lr
.L_02034ec8: .word data_02105690
    .size func_02034ea8, . - func_02034ea8

    .global func_02034ecc

