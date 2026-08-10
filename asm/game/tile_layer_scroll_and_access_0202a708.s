; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text


    .global TileLayer_GetMetatileIndex
    .type TileLayer_GetMetatileIndex, @function
TileLayer_GetMetatileIndex: ; 0x0202a708
    add r0, r0, #0x1000
    ldrh r3, [r0, #0x2c]
    ldr ip, [r0, #0x8]
    ldr r0, .L_0202a72c
    mla r1, r2, r3, r1
    mov r1, r1, lsl #0x1
    ldrh r1, [ip, r1]
    and r0, r1, r0
    bx lr
.L_0202a72c: .word 0x1ff
    .size TileLayer_GetMetatileIndex, . - TileLayer_GetMetatileIndex

