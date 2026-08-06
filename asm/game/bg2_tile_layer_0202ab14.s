; Matching retail form; see src/game/bg2_tile_layer.c.
.text


    .global func_0202ab14
    .type func_0202ab14, @function
func_0202ab14: ; 0x0202ab14
    add r0, r0, #0x1000
    cmp r1, #0x0
    ldrb r1, [r0, #0x31]
    beq .L_0202ab48
    cmp r1, #0x1
    beq .L_0202ab3c
    cmp r1, #0x2
    moveq r1, #0x400
    streqh r1, [r0, #0x32]
    bx lr
.L_0202ab3c:
    mov r1, #0x400
    strh r1, [r0, #0x32]
    bx lr
.L_0202ab48:
    cmp r1, #0x1
    beq .L_0202ab60
    cmp r1, #0x2
    moveq r1, #0x0
    streqh r1, [r0, #0x32]
    bx lr
.L_0202ab60:
    mov r1, #0x0
    strh r1, [r0, #0x32]
    bx lr
    .size func_0202ab14, . - func_0202ab14

