; Matching retail form; see src/game/bg3_tile_layer.c.
.text


    .global Bg3TileLayer_SetVisible
    .type Bg3TileLayer_SetVisible, @function
Bg3TileLayer_SetVisible: ; 0x0202ae10
    add r0, r0, #0x1000
    cmp r1, #0x0
    ldrb r1, [r0, #0x31]
    beq .L_0202ae44
    cmp r1, #0x1
    beq .L_0202ae38
    cmp r1, #0x2
    moveq r1, #0x800
    streqh r1, [r0, #0x32]
    bx lr
.L_0202ae38:
    mov r1, #0x800
    strh r1, [r0, #0x32]
    bx lr
.L_0202ae44:
    cmp r1, #0x1
    beq .L_0202ae5c
    cmp r1, #0x2
    moveq r1, #0x0
    streqh r1, [r0, #0x32]
    bx lr
.L_0202ae5c:
    mov r1, #0x0
    strh r1, [r0, #0x32]
    bx lr
    .size Bg3TileLayer_SetVisible, . - Bg3TileLayer_SetVisible

