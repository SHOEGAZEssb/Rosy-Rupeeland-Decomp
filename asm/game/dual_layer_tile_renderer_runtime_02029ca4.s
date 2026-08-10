; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern GameFile_Destroy
.extern GameFile_Init
.extern GameFile_Open
.extern gDualLayerTileRendererArchivePath
.extern NcgFile_Init
.extern NcgFile_Destroy
.extern NcgFile_LoadCompressedFromFile
.extern func_0202b750
.extern func_0202b834
.extern func_0202b838

    .global DualLayerTileRenderer_LoadEmbeddedRendererEntry
    .type DualLayerTileRenderer_LoadEmbeddedRendererEntry, @function
DualLayerTileRenderer_LoadEmbeddedRendererEntry: ; 0x02029ca4
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x7c
    sub sp, sp, #0x1800
    mov r5, r0
    add r0, sp, #0x0
    mov r4, r1
    bl NcgFile_Init
    add r0, sp, #0x1800
    add r0, r0, #0x30
    bl GameFile_Init
    add r0, sp, #0x1800
    ldr r1, .L_02029d38
    add r0, r0, #0x30
    bl GameFile_Open
    ldr r3, [r5, #0x1c]
    add r1, sp, #0x1800
    add r0, sp, #0x0
    add r1, r1, #0x30
    ldmia r3, {r2, r3}
    bl NcgFile_LoadCompressedFromFile
    mov r2, r4
    add r0, sp, #0x14
    add r1, sp, #0x0
    bl func_0202b750
    add r0, r5, #0x60
    add r1, sp, #0x14
    bl func_0202b838
    add r0, sp, #0x14
    bl func_0202b834
    add r0, sp, #0x1800
    add r0, r0, #0x30
    bl GameFile_Destroy
    add r0, sp, #0x0
    bl NcgFile_Destroy
    add sp, sp, #0x7c
    add sp, sp, #0x1800
    ldmia sp!, {r4, r5, pc}
.L_02029d38: .word gDualLayerTileRendererArchivePath
    .size DualLayerTileRenderer_LoadEmbeddedRendererEntry, . - DualLayerTileRenderer_LoadEmbeddedRendererEntry

