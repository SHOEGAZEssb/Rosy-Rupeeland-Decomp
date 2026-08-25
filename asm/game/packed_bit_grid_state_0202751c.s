; Matching retail form; see src/game/packed_bit_grid_state.c.
.text
.extern data_020d8810
.extern func_02003e20
.extern PackedBitGrid_Clear
.extern gHeapContext

    .global PackedBitGrid_Configure
    .type PackedBitGrid_Configure, @function
PackedBitGrid_Configure: ; 0x0202751c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, [r1, #0x20]
    mov r4, r0
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    str r2, [r4, #0x8]
    ldr r1, [r1, #0x20]
    mov r2, r1, lsr #0x10
    str r2, [r4, #0xc]
    ldr r1, [r4, #0x8]
    mul r2, r1, r2
    add r3, r2, #0x7
    mov r1, r3, asr #0x2
    ldr r2, [r4, #0x0]
    add r1, r3, r1, lsr #0x1d
    cmp r2, #0x0
    mov r5, r1, asr #0x3
    beq .L_02027568
    bl PackedBitGrid_Clear
.L_02027568:
    ldr r1, .L_020275a8
    ldr r3, .L_020275ac
    mov r0, r5
    mov r2, #0x4
    bl func_02003e20
    mov r2, #0x0
    stmia r4, {r0, r5}
    mov r1, r2
    b .L_02027598
.L_0202758c:
    ldr r0, [r4, #0x0]
    strb r1, [r0, r2]
    add r2, r2, #0x1
.L_02027598:
    ldr r0, [r4, #0x4]
    cmp r2, r0
    blt .L_0202758c
    ldmia sp!, {r3, r4, r5, pc}
.L_020275a8: .word data_020d8810
.L_020275ac: .word gHeapContext
    .size PackedBitGrid_Configure, . - PackedBitGrid_Configure
