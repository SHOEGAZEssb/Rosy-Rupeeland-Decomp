; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern TileLayer_GetSourceCell

    .global DualLayerTileRenderer_GetPackedTileValue
    .type DualLayerTileRenderer_GetPackedTileValue, @function
DualLayerTileRenderer_GetPackedTileValue: ; 0x02029ad0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    movs r8, r1
    mov r9, r0
    mov r7, r2
    add r4, sp, #0x0
    bmi .L_02029b08
    ldr r0, [r9, #0x20]
    mov r3, r0, lsl #0x10
    cmp r8, r3, lsr #0x10
    bhs .L_02029b08
    cmp r7, #0x0
    blt .L_02029b08
    cmp r7, r0, lsr #0x10
    blo .L_02029b18
.L_02029b08:
    mov r0, #0x0
    strh r0, [r4, #0x0]
    ldr r0, [sp, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02029b18:
    ldr r0, [r9, #0x28]
    mov r5, #0x0
    mov r6, r5
    cmp r0, #0x0
    beq .L_02029b3c
    bl TileLayer_GetSourceCell
    and r0, r0, #0xfe00
    mov r0, r0, lsl #0x7
    mov r6, r0, lsr #0x10
.L_02029b3c:
    ldr r0, [r9, #0x2c]
    cmp r0, #0x0
    beq .L_02029b60
    mov r1, r8
    mov r2, r7
    bl TileLayer_GetSourceCell
    and r0, r0, #0xfe00
    mov r0, r0, lsl #0x7
    mov r5, r0, lsr #0x10
.L_02029b60:
    orr r0, r6, r5, lsl #0x7
    strh r0, [r4, #0x0]
    ldr r0, [sp, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size DualLayerTileRenderer_GetPackedTileValue, . - DualLayerTileRenderer_GetPackedTileValue

