; Matching retail form; see src/game/type7_actor_relationship_control.c.
.extern data_020e16b0
.extern data_020e1758
.extern data_020e1760
.extern data_020e1768
.extern data_020e1890
.extern data_021052fc
.extern Type7Actor_SetCallbackPair
.text
    .global func_0204a3d8
.type func_0204a3d8, @function
func_0204a3d8: ; 0x0204a3d8
    stmdb sp!, {r4, lr}
    ldr r3, .L_0204a4a8
    mov r2, #0x1
    ldr lr, [r0, #0x208]
    ldr r3, [r3, #0xb8]
    mov r4, r2
    cmp lr, r3
    ldr r3, .L_0204a4ac
    bne .L_0204a410
    ldr ip, [r0, #0x20c]
    ldr r3, [r3, #0x4]
    cmp ip, r3
    cmpne lr, #0x0
    moveq r4, #0x0
.L_0204a410:
    cmp r4, #0x0
    beq .L_0204a450
    ldr r3, .L_0204a4a8
    ldr lr, [r0, #0x208]
    ldr r3, [r3, #0x1e0]
    mov r4, #0x1
    cmp lr, r3
    ldr r3, .L_0204a4b0
    bne .L_0204a448
    ldr ip, [r0, #0x20c]
    ldr r3, [r3, #0x4]
    cmp ip, r3
    cmpne lr, #0x0
    moveq r4, #0x0
.L_0204a448:
    cmp r4, #0x0
    movne r2, #0x0
.L_0204a450:
    cmp r2, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, .L_0204a4a8
    ldr ip, [r0, #0x208]
    ldr r2, [r2, #0xa8]
    mov r4, #0x1
    cmp ip, r2
    ldr r2, .L_0204a4b4
    bne .L_0204a488
    ldr r3, [r0, #0x20c]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne ip, #0x0
    moveq r4, #0x0
.L_0204a488:
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r2, .L_0204a4b8
    mvn r3, #0x0
    str r1, [r0, #0x210]
    ldmia r2, {r1, r2}
    bl Type7Actor_SetCallbackPair
    ldmia sp!, {r4, pc}
.L_0204a4a8: .word data_020e16b0
.L_0204a4ac: .word data_020e1768
.L_0204a4b0: .word data_020e1890
.L_0204a4b4: .word data_020e1758
.L_0204a4b8: .word data_020e1760
.size func_0204a3d8, . - func_0204a3d8

    .global func_0204a4bc
.type func_0204a4bc, @function
func_0204a4bc: ; 0x0204a4bc
    ldr r1, .L_0204a4ec
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r2, [r1, #0xea8]
    cmp r2, #0x0
    ldrne r1, [r2, #0x210]
    cmpne r1, #0x0
    bxeq lr
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r2, #0x210]
    bx lr
.L_0204a4ec: .word data_021052fc
.size func_0204a4bc, . - func_0204a4bc

