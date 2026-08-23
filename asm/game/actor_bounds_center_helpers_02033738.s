; Matching retail form; see src/game/actor_bounds_center_helpers.c.
.text
.extern data_020df030

    .global S8BoundsCenter_Init
    .type S8BoundsCenter_Init, @function
S8BoundsCenter_Init: ; 0x02033738
    ldr r3, .L_02033790
    mov r2, #0x0
    str r3, [r0, #0x0]
    strb r2, [r0, #0x4]
    strb r2, [r0, #0x5]
    ldrsb r3, [r1, #0x0]
    ldrsb r2, [r1, #0x2]
    sub r2, r2, r3
    mov r2, r2, lsl #0x18
    mov r2, r2, asr #0x18
    add r2, r2, r2, lsr #0x1f
    add r2, r3, r2, asr #0x1
    strb r2, [r0, #0x4]
    ldrsb r2, [r1, #0x1]
    ldrsb r1, [r1, #0x3]
    sub r1, r1, r2
    mov r1, r1, lsl #0x18
    mov r1, r1, asr #0x18
    add r1, r1, r1, lsr #0x1f
    add r1, r2, r1, asr #0x1
    strb r1, [r0, #0x5]
    bx lr
.L_02033790: .word data_020df030
    .size S8BoundsCenter_Init, . - S8BoundsCenter_Init

    .global S8BoundsCenter_Destroy
