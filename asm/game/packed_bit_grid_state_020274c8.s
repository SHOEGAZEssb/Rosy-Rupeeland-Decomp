; Matching retail form; see src/game/packed_bit_grid_state.c.
.text
.extern func_02003e38

    .global PackedBitGrid_Clear
    .type PackedBitGrid_Clear, @function
PackedBitGrid_Clear: ; 0x020274c8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_020274e8
    bl func_02003e38
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_020274e8:
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
    .size PackedBitGrid_Clear, . - PackedBitGrid_Clear
