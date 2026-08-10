; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text


    .global TileLayer_SetScrollPositionDirect
    .type TileLayer_SetScrollPositionDirect, @function
TileLayer_SetScrollPositionDirect: ; 0x0202a884
    add r3, r0, #0x1000
    mov r0, r1, asr #0x3
    str r1, [r3, #0x18]
    add r0, r1, r0, lsr #0x1c
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    str r2, [r3, #0x1c]
    mov r0, r0, asr #0x4
    strh r0, [r3, #0x28]
    mov r0, r1, asr #0x4
    strh r0, [r3, #0x2a]
    bx lr
    .size TileLayer_SetScrollPositionDirect, . - TileLayer_SetScrollPositionDirect

