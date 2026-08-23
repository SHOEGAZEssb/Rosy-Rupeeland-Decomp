; Matching retail form; see src/game/fx32_vector_magnitude.c.
.text
    .global Fx32Vector2_Magnitude
.type Fx32Vector2_Magnitude, @function
Fx32Vector2_Magnitude: ; 0x0204cfa4
    smull r3, r2, r1, r1
    smlal r3, r2, r0, r0
    mov r0, r2, lsl #0x2
    ldr r2, .L_0204cfec
    mov r1, #0x1
    strh r1, [r2, #0x0]
    mov r1, r3, lsl #0x2
    str r1, [r2, #0x8]
    orr r0, r0, r3, lsr #0x1e
    str r0, [r2, #0xc]
.L_0204cfcc:
    ldrh r0, [r2, #0x0]
    tst r0, #0x8000
    bne .L_0204cfcc
    ldr r0, .L_0204cff0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    bx lr
.L_0204cfec: .word 0x40002b0
.L_0204cff0: .word 0x40002b4
.size Fx32Vector2_Magnitude, . - Fx32Vector2_Magnitude
