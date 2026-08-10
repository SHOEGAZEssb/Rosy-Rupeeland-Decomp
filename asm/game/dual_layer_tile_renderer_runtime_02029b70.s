; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern TileLayer_SetSourceCellUpperBits

    .global DualLayerTileRenderer_SetPackedTileValue
    .type DualLayerTileRenderer_SetPackedTileValue, @function
DualLayerTileRenderer_SetPackedTileValue: ; 0x02029b70
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r5, r1
    mov r6, r0
    mov r4, r2
    bmi .L_02029bf0
    ldr r0, [r6, #0x20]
    mov r3, r0, lsl #0x10
    cmp r5, r3, lsr #0x10
    bhs .L_02029bf0
    cmp r4, #0x0
    blt .L_02029bf0
    cmp r4, r0, lsr #0x10
    bhs .L_02029bf0
    ldrh ip, [sp, #0x24]
    ldr r0, [r6, #0x28]
    mov r3, ip, lsl #0x9
    and ip, ip, #0x7f
    cmp r0, #0x0
    mov r7, r3, lsr #0x10
    beq .L_02029bd0
    mov r3, ip, lsl #0x19
    mov r3, r3, lsr #0x10
    bl TileLayer_SetSourceCellUpperBits
.L_02029bd0:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_02029bf0
    mov r3, r7, lsl #0x19
    mov r1, r5
    mov r2, r4
    mov r3, r3, lsr #0x10
    bl TileLayer_SetSourceCellUpperBits
.L_02029bf0:
    ldmia sp!, {r3, r4, r5, r6, r7, lr}
    add sp, sp, #0x10
    bx lr
    .size DualLayerTileRenderer_SetPackedTileValue, . - DualLayerTileRenderer_SetPackedTileValue

