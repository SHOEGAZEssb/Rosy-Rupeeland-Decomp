; Matching retail form; see src/game/type7_actor_target_state.c.
.text
.extern data_020e16b0
.extern data_020e17b8
.extern data_020e1920
.extern data_020e1928
.extern data_021052fc
.extern func_020050a4
.extern func_02046d8c
.extern func_020481dc
.extern func_020adcac
.global func_0204820c
.global func_0204832c
.type func_0204820c, @function
.type func_0204832c, @function

func_0204820c: ; 0x0204820c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0204831c
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r4, #0x210]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    cmp r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr ip, [r4, #0x268]
    tst ip, #0x20000
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, .L_02048320
    ldr r2, [r4, #0x208]
    ldr r0, [r0, #0x108]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02048324
    bne .L_02048274
    ldr r1, [r4, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02048274:
    cmp r3, #0x0
    moveq r2, #0x3
    ldr r1, [r4, #0x25c]
    movne r2, #0x1
    ldr r0, [r4, #0xd0]
    mul r5, r1, r2
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    addne r5, r5, #0x20000
    addeq r5, r5, #0x10000
    tst ip, #0x4
    beq .L_020482bc
    mov r0, r4
    bl func_02046d8c
    cmp r0, #0x0
    beq .L_020482d8
.L_020482bc:
    adds r1, r4, #0x214
    addne r1, r1, #0x4
    adds r0, r4, #0x18
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, r5
    ble .L_02048314
.L_020482d8:
    ldr r0, [r4, #0x268]
    tst r0, #0x4
    beq .L_020482f0
    add r0, r4, #0x214
    add r1, r4, #0x224
    bl func_020050a4
.L_020482f0:
    mov r0, #0x0
    str r0, [r4, #0x210]
    ldr r1, .L_02048328
    mov r0, r4
    mov r3, #0x78
    ldmia r1, {r1, r2}
    bl func_020481dc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02048314:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_0204831c: .word data_021052fc
.L_02048320: .word data_020e16b0
.L_02048324: .word data_020e17b8
.L_02048328: .word data_020e1928

func_0204832c: ; 0x0204832c
    stmdb sp!, {r3, lr}
    ldr r1, .L_02048370
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r1, [r1, #0x270]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r2, #0x0
    ldr r1, .L_02048374
    sub r3, r2, #0x1
    str r2, [r0, #0x210]
    ldmia r1, {r1, r2}
    bl func_020481dc
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_02048370: .word data_021052fc
.L_02048374: .word data_020e1920

.size func_0204820c, func_0204832c - func_0204820c
.size func_0204832c, . - func_0204832c

