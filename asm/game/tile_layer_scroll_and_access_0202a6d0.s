; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text


    .global TileLayer_SetSourceCellUpperBits
    .type TileLayer_SetSourceCellUpperBits, @function
TileLayer_SetSourceCellUpperBits: ; 0x0202a6d0
    stmdb sp!, {r3, lr}
    add r0, r0, #0x1000
    ldrh ip, [r0, #0x2c]
    ldr lr, [r0, #0x8]
    ldr r0, .L_0202a704
    mla r1, r2, ip, r1
    mov r2, r1, lsl #0x1
    ldrh r1, [lr, r2]
    and r0, r1, r0
    mov r0, r0, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    strh r0, [lr, r2]
    ldmia sp!, {r3, pc}
.L_0202a704: .word 0x1ff
    .size TileLayer_SetSourceCellUpperBits, . - TileLayer_SetSourceCellUpperBits

