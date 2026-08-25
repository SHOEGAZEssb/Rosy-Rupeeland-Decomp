; Matching retail form; see src/game/packed_bit_grid_state.c.
.text
.extern __register_global_object
.extern data_02105614
.extern data_02105618
.extern data_02105624
.extern PackedBitGrid_Init
.extern PackedBitGrid_Destroy

    .global PackedBitGrid_GetOrCreateGlobal
    .type PackedBitGrid_GetOrCreateGlobal, @function
PackedBitGrid_GetOrCreateGlobal: ; 0x020275b0
    stmdb sp!, {r3, lr}
    ldr r0, .L_020275f4
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    bne .L_020275ec
    ldr r0, .L_020275f8
    bl PackedBitGrid_Init
    ldr r0, .L_020275f8
    ldr r1, .L_020275fc
    ldr r2, .L_02027600
    bl __register_global_object
    ldr r0, .L_020275f4
    ldr r1, [r0, #0x0]
    orr r1, r1, #0x1
    str r1, [r0, #0x0]
.L_020275ec:
    ldr r0, .L_020275f8
    ldmia sp!, {r3, pc}
.L_020275f4: .word data_02105614
.L_020275f8: .word data_02105624
.L_020275fc: .word PackedBitGrid_Destroy
.L_02027600: .word data_02105618
    .size PackedBitGrid_GetOrCreateGlobal, . - PackedBitGrid_GetOrCreateGlobal
