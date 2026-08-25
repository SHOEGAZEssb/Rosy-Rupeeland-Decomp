; Matching retail form; see src/game/packed_bit_grid_state.c.
.text
.extern PackedBitGrid_Clear

    .global PackedBitGrid_Destroy
    .type PackedBitGrid_Destroy, @function
PackedBitGrid_Destroy: ; 0x020274f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl PackedBitGrid_Clear
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02027514
    mov r0, r4
    bl PackedBitGrid_Clear
.L_02027514:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size PackedBitGrid_Destroy, . - PackedBitGrid_Destroy
