; Matching retail form; see src/game/dual_layer_tile_renderer_base.c.
.text
.extern gDualLayerTileRendererBaseVtable
.extern VecFx32Object_Init
.extern AnimatedTileStagingBuffer_Init
.extern ByteTileMapOwner_Init

    .global DualLayerTileRendererBase_InitBase
    .type DualLayerTileRendererBase_InitBase, @function
DualLayerTileRendererBase_InitBase: ; 0x020291b8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ByteTileMapOwner_Init
    ldr r1, .L_02029214
    add r0, r4, #0x50
    str r1, [r4, #0x0]
    bl VecFx32Object_Init
    add r0, r4, #0x60
    bl AnimatedTileStagingBuffer_Init
    mov r2, #0x0
    mov r1, r2
.L_020291e4:
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x28]
    cmp r2, #0x2
    blt .L_020291e4
    str r1, [r4, #0x44]
    mov r0, #0x1c
    str r0, [r4, #0x48]
    mov r1, #0x1e
    mov r0, r4
    str r1, [r4, #0x4c]
    ldmia sp!, {r4, pc}
.L_02029214: .word gDualLayerTileRendererBaseVtable
    .size DualLayerTileRendererBase_InitBase, . - DualLayerTileRendererBase_InitBase

