; Matching retail form; see src/game/packed_bit_grid_state.c.
.text
.extern __register_global_object
.extern data_02105614
.extern data_02105618
.extern data_02105624
.extern func_020274b8
.extern func_020274f4

    .global func_020275b0
    .type func_020275b0, @function
func_020275b0: ; 0x020275b0
    stmdb sp!, {r3, lr}
    ldr r0, .L_020275f4
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    bne .L_020275ec
    ldr r0, .L_020275f8
    bl func_020274b8
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
.L_020275fc: .word func_020274f4
.L_02027600: .word data_02105618
    .size func_020275b0, . - func_020275b0
