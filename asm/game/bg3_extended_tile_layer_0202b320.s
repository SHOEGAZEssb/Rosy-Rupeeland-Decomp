; Matching retail form; see src/game/bg3_extended_tile_layer.c.
.text


    .global Bg3ExtendedTileLayer_SetVisible
    .type Bg3ExtendedTileLayer_SetVisible, @function
Bg3ExtendedTileLayer_SetVisible: ; 0x0202b320
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
    .size Bg3ExtendedTileLayer_SetVisible, . - Bg3ExtendedTileLayer_SetVisible

