; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern GameFile_Close
.extern GameFile_Destroy
.extern GameFile_Init
.extern GameFile_Open
.extern Heap_Alloc
.extern gDualLayerTileRendererArchivePath
.extern gDualLayerTileRendererLayerAllocationTag
.extern NclFile_LoadCompressedFromFile
.extern DualLayerTileRenderer_UploadGraphics
.extern DualLayerTileRenderer_UploadPalette
.extern TileLayer_InitSourceMap
.extern TileLayer_SetScrollPositionDirect
.extern func_0202a8b4
.extern func_0202abb0
.extern func_0202aeac
.extern func_0202b134
.extern CompressedByteBuffer_GetData
.extern CompressedByteBuffer_LoadLz8Payload
.extern func_0202b520
.extern func_0202b5f4
.extern gHeapContext

    .global DualLayerTileRenderer_LoadFromConfig
    .type DualLayerTileRenderer_LoadFromConfig, @function
DualLayerTileRenderer_LoadFromConfig: ; 0x02029370
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x5c
    mov r6, r0
    mov r4, r2
    strb r4, [r6, #0x30]
    add r0, sp, #0x10
    mov r5, r1
    strb r3, [r6, #0x31]
    str r5, [r6, #0x1c]
    bl GameFile_Init
    ldr r1, .L_0202963c
    add r0, sp, #0x10
    bl GameFile_Open
    ldr r2, [r5, #0x8]
    ldr r3, [r5, #0xc]
    add r0, r6, #0x10
    add r1, sp, #0x10
    bl NclFile_LoadCompressedFromFile
    ldr r2, [r5, #0x10]
    ldr r3, [r5, #0x14]
    add r0, r6, #0x4
    add r1, sp, #0x10
    bl func_0202b520
    ldr r3, [r5, #0x2c]
    cmp r3, #0x0
    beq .L_020293e8
    ldr r2, [r5, #0x28]
    add r1, sp, #0x10
    add r0, r6, #0xc
    bl CompressedByteBuffer_LoadLz8Payload
.L_020293e8:
    ldrsh r1, [r5, #0x38]
    mov r0, #0x10000
    ldr r2, [r6, #0x20]
    rsb r0, r0, #0x0
    and r2, r2, r0
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    str r0, [r6, #0x20]
    ldrsh r1, [r5, #0x3a]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r6, #0x20]
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    beq .L_0202951c
    ldrb r0, [r6, #0x31]
    cmp r0, #0x0
    beq .L_02029440
    cmp r0, #0x2
    beq .L_02029474
    b .L_020294a4
.L_02029440:
    ldr r1, .L_02029640
    ldr r3, .L_02029644
    mov r0, #0x1040
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0202946c
    ldr r2, [r6, #0x44]
    ldr r3, [r6, #0x48]
    mov r1, r4
    bl func_0202abb0
.L_0202946c:
    str r0, [r6, #0x28]
    b .L_020294a4
.L_02029474:
    ldr r1, .L_02029640
    ldr r3, .L_02029644
    mov r0, #0x1040
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020294a0
    ldr r2, [r6, #0x44]
    ldr r3, [r6, #0x48]
    mov r1, r4
    bl func_0202b134
.L_020294a0:
    str r0, [r6, #0x28]
.L_020294a4:
    add r0, r6, #0x4
    bl func_0202b5f4
    mov r7, r0
    add r0, r6, #0xc
    bl CompressedByteBuffer_GetData
    str r7, [sp, #0x0]
    ldr r2, [r6, #0x20]
    add r1, sp, #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    str r2, [sp, #0x4]
    ldr r2, [r6, #0x20]
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    str r2, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r0, [r6, #0x28]
    ldr r2, [r5, #0x18]
    ldr r3, [r5, #0x1c]
    bl TileLayer_InitSourceMap
    mov r1, #0x0
    ldr r0, [r6, #0x28]
    mov r2, r1
    bl TileLayer_SetScrollPositionDirect
    mov r0, #0x0
    str r0, [r6, #0x34]
    str r0, [r6, #0x3c]
.L_0202951c:
    ldr r0, [r5, #0x24]
    cmp r0, #0x0
    beq .L_02029614
    ldrb r0, [r6, #0x31]
    cmp r0, #0x0
    beq .L_02029540
    cmp r0, #0x2
    beq .L_02029574
    b .L_020295a4
.L_02029540:
    ldr r1, .L_02029640
    ldr r3, .L_02029644
    mov r0, #0x1040
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0202956c
    ldr r2, [r6, #0x44]
    ldr r3, [r6, #0x4c]
    mov r1, r4
    bl func_0202a8b4
.L_0202956c:
    str r0, [r6, #0x2c]
    b .L_020295a4
.L_02029574:
    ldr r1, .L_02029640
    ldr r3, .L_02029644
    mov r0, #0x1040
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020295a0
    ldr r2, [r6, #0x44]
    ldr r3, [r6, #0x4c]
    mov r1, r4
    bl func_0202aeac
.L_020295a0:
    str r0, [r6, #0x2c]
.L_020295a4:
    add r0, r6, #0x4
    bl func_0202b5f4
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x20]
    mov r2, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x20]
    add r1, sp, #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r6, #0x2c]
    ldr r2, [r5, #0x20]
    ldr r3, [r5, #0x24]
    bl TileLayer_InitSourceMap
    mov r1, #0x0
    ldr r0, [r6, #0x2c]
    mov r2, r1
    bl TileLayer_SetScrollPositionDirect
    mov r0, #0x0
    str r0, [r6, #0x38]
    str r0, [r6, #0x40]
.L_02029614:
    mov r0, r6
    bl DualLayerTileRenderer_UploadGraphics
    mov r0, r6
    bl DualLayerTileRenderer_UploadPalette
    add r0, sp, #0x10
    bl GameFile_Close
    add r0, sp, #0x10
    bl GameFile_Destroy
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0202963c: .word gDualLayerTileRendererArchivePath
.L_02029640: .word gDualLayerTileRendererLayerAllocationTag
.L_02029644: .word gHeapContext
    .size DualLayerTileRenderer_LoadFromConfig, . - DualLayerTileRenderer_LoadFromConfig

