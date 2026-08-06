; Matching retail form; see src/game/actor_extended_type2_interaction_eligibility.c.
.text
.extern data_020df9e8
.extern data_020dfbd8
.extern data_020e8380
.extern func_02033f44
.global func_020430ec
.type func_020430ec, @function
func_020430ec: ; 0x020430ec
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x10]
    mov r4, r1
    tst r0, #0x1000000
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    tst r0, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_02043220
    mov r0, #0x30
    mla r0, r2, r0, r1
    ldrh r0, [r0, #0x1e]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x12
    cmp r0, #0x5
    movhs r0, #0x0
    ldmhsia sp!, {r4, r5, r6, pc}
    ldr r0, .L_02043224
    ldr r2, [r5, #0x218]
    ldr r0, [r0, #0x1f0]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02043228
    bne .L_0204316c
    ldr r1, [r5, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_0204316c:
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0x260]
    tst r0, #0x10000
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    tst r0, #0x2
    beq .L_020431b8
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_020431bc
.L_020431b8:
    mov r0, #0x0
.L_020431bc:
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_02033f44
    mov r6, r0
    mov r0, r4
    bl func_02033f44
    cmp r6, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r3, [r5, #0xd0]
    mov r2, #0x0
    tst r3, #0x10
    ldreq r1, [r5, #0x24]
    ldreq r0, [r5, #0x1dc]
    cmpeq r1, r0
    moveq r2, #0x1
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    tst r3, #0x100
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_02043220: .word data_020e8380
.L_02043224: .word data_020df9e8
.L_02043228: .word data_020dfbd8

    .global func_0204322c
.size func_020430ec, . - func_020430ec
