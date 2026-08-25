; Matching retail form; see src/game/packed_bit_grid_state.c.
.text

    .global PackedBitGrid_Init
    .type PackedBitGrid_Init, @function
PackedBitGrid_Init: ; 0x020274b8
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    bx lr
    .size PackedBitGrid_Init, . - PackedBitGrid_Init
