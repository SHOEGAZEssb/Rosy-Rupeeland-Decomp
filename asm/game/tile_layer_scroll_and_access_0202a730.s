; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text


    .global TileLayer_GetSourceCell
    .type TileLayer_GetSourceCell, @function
TileLayer_GetSourceCell: ; 0x0202a730
    add r0, r0, #0x1000
    ldrh r3, [r0, #0x2c]
    ldr ip, [r0, #0x8]
    mla r0, r2, r3, r1
    mov r0, r0, lsl #0x1
    ldrh r0, [ip, r0]
    bx lr
    .size TileLayer_GetSourceCell, . - TileLayer_GetSourceCell

