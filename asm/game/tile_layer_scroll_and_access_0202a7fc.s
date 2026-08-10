; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text
.extern TileLayer_RebuildCache
.extern TileLayer_LoadSourceTileSection

    .global TileLayer_InitSourceMap
    .type TileLayer_InitSourceMap, @function
TileLayer_InitSourceMap: ; 0x0202a7fc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TileLayer_LoadSourceTileSection
    ldr r0, [sp, #0x8]
    add r1, r4, #0x1000
    ldr r2, [sp, #0x14]
    str r0, [r1, #0x10]
    ldrsh r0, [sp, #0xc]
    str r2, [r1, #0x14]
    ldrsh r2, [sp, #0x10]
    strh r0, [r1, #0x2c]
    mov r0, #0x0
    strh r2, [r1, #0x2e]
    str r0, [r1, #0x18]
    str r0, [r1, #0x1c]
    strh r0, [r1, #0x28]
    strh r0, [r1, #0x2a]
    ldrsh r2, [r1, #0x28]
    ldrb r3, [r1, #0x4]
    mov r0, r4
    and r2, r2, #0xff
    bic r3, r3, #0x1f
    and r2, r2, #0x1f
    orr r2, r3, r2
    strb r2, [r1, #0x4]
    ldrsh r2, [r1, #0x2a]
    ldrb r3, [r1, #0x5]
    and r2, r2, #0xff
    bic r3, r3, #0xf
    and r2, r2, #0xf
    orr r2, r3, r2
    strb r2, [r1, #0x5]
    bl TileLayer_RebuildCache
    ldmia sp!, {r4, pc}
    .size TileLayer_InitSourceMap, . - TileLayer_InitSourceMap

