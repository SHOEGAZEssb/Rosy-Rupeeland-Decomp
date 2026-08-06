; Matching retail form; see src/game/bg3_extended_tile_layer.c.
.text


    .global func_0202b320
    .type func_0202b320, @function
func_0202b320: ; 0x0202b320
    add r0, r0, #0x1000
    cmp r1, #0x0
    ldrb r1, [r0, #0x31]
    beq .L_0202b354
    cmp r1, #0x1
    beq .L_0202b348
    cmp r1, #0x2
    moveq r1, #0x800
    streqh r1, [r0, #0x32]
    bx lr
.L_0202b348:
    mov r1, #0x800
    strh r1, [r0, #0x32]
    bx lr
.L_0202b354:
    cmp r1, #0x1
    beq .L_0202b36c
    cmp r1, #0x2
    moveq r1, #0x0
    streqh r1, [r0, #0x32]
    bx lr
.L_0202b36c:
    mov r1, #0x0
    strh r1, [r0, #0x32]
    bx lr
    .size func_0202b320, . - func_0202b320

