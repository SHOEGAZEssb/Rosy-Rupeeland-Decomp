; Matching retail form; see src/game/packed_bit_grid_state.c.
.text
.extern func_020274c8

    .global func_020274f4
    .type func_020274f4, @function
func_020274f4: ; 0x020274f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020274c8
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02027514
    mov r0, r4
    bl func_020274c8
.L_02027514:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_020274f4, . - func_020274f4
