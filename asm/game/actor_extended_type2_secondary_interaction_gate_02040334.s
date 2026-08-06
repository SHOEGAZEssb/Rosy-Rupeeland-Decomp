; Matching retail form; see src/game/actor_extended_type2_secondary_interaction_gate.c.
.text
.extern data_021052fc
.extern func_020401a0
.global func_02040334
.type func_02040334, @function
func_02040334: ; 0x02040334
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldrh r1, [r4, #0x1a]
    mov r5, r0
    tst r1, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020401a0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x1a]
    tst r0, #0x10
    bne .L_0204039c
    ldr r1, .L_020403fc
    mov r0, r5
    ldr r1, [r1, #0x0]
    ldr r3, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r3, [r3, #0x128]
    mov r2, r4
    blx r3
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_0204039c:
    ldrh r0, [r4, #0x1a]
    tst r0, #0x20
    ldrne r0, .L_020403fc
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r1, [r0, #0xea8]
    cmpne r1, #0x0
    beq .L_020403f4
    ldr r0, [r1, #0x268]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_020403f4
    mov r0, r5
    ldr r3, [r0, #0x0]
    mov r2, r4
    ldr r3, [r3, #0x128]
    blx r3
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_020403f4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_020403fc: .word data_021052fc
.size func_02040334, . - func_02040334

