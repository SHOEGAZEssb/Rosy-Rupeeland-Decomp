; Matching retail form; see src/game/actor_orientation_update.c.
.text
.extern func_020ae024

    .global func_02032228
    .type func_02032228, @function
func_02032228: ; 0x02032228
    stmdb sp!, {r3, r4, r5, lr}
    cmp r1, #0x0
    mov r5, r0
    mov r4, r3
    cmpeq r2, #0x0
    beq .L_02032308
    mov r0, r2
    bl func_020ae024
    sub r0, r0, #0x4000
    mov r1, r0, lsl #0x10
    ldr r2, [r5, #0xc8]
    mov r0, r1, lsr #0x10
    cmp r2, r1, lsr #0x10
    addgt r0, r0, #0x10000
    sub r1, r0, r2
    cmp r1, #0x8000
    bge .L_020322a8
    cmp r1, #0x2000
    blt .L_02032280
    ldr r2, [r5, #0xd0]
    tst r2, #0x8000
    beq .L_02032290
.L_02032280:
    ldr r2, [r5, #0xd0]
    orr r2, r2, #0x1
    str r2, [r5, #0xd0]
    b .L_0203229c
.L_02032290:
    mov r2, #0x0
    str r2, [r5, #0x40]
    str r2, [r5, #0x3c]
.L_0203229c:
    cmp r1, r4
    movgt r1, r4
    b .L_020322f0
.L_020322a8:
    rsb r1, r1, #0x10000
    cmp r1, #0x2000
    blt .L_020322c0
    ldr r2, [r5, #0xd0]
    tst r2, #0x8000
    beq .L_020322d0
.L_020322c0:
    ldr r2, [r5, #0xd0]
    orr r2, r2, #0x1
    str r2, [r5, #0xd0]
    b .L_020322dc
.L_020322d0:
    mov r2, #0x0
    str r2, [r5, #0x40]
    str r2, [r5, #0x3c]
.L_020322dc:
    cmp r1, r4
    movgt r1, r4
    mvn r2, #0x0
    mul r2, r1, r2
    mov r1, r2
.L_020322f0:
    ldr r2, [r5, #0xc8]
    add r2, r2, r1
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [r5, #0xc8]
    b .L_02032310
.L_02032308:
    ldr r0, [r5, #0xcc]
    str r0, [r5, #0xc8]
.L_02032310:
    add r2, r5, #0x100
    ldrh r1, [r2, #0xea]
    cmp r1, #0x0
    bne .L_02032350
    ldr r1, [r5, #0xc8]
    add r1, r1, #0x1000
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0xd
    strb r3, [r5, #0xd4]
    ldrb r1, [r5, #0xd5]
    and r3, r3, #0xff
    cmp r3, r1
    movne r1, #0x5
    strneh r1, [r2, #0xea]
    b .L_02032358
.L_02032350:
    sub r1, r1, #0x1
    strh r1, [r2, #0xea]
.L_02032358:
    add r0, r0, #0x1000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0xd
    and r0, r0, #0xff
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02032228, . - func_02032228

