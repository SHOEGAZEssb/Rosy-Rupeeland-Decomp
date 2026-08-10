; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text
.extern VecFx32Object_Destroy
.extern VecFx32_Subtract
.extern TileLayer_ScrollToPixelPosition
.extern func_0202b930
.extern func_0202badc
.extern func_020b17ec
.extern func_020b1854

    .global DualLayerTileRenderer_UpdatePosition
    .type DualLayerTileRenderer_UpdatePosition, @function
DualLayerTileRenderer_UpdatePosition: ; 0x02029784
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r5, r1
    bl func_0202badc
    add r0, sp, #0x0
    mov r1, r5
    add r2, r4, #0x50
    bl VecFx32_Subtract
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    ldr r0, [r4, #0x28]
    mov r5, r2, asr #0xc
    cmp r0, #0x0
    mov r6, r1, asr #0xc
    beq .L_020297d0
    mov r1, r5
    mov r2, r6
    bl TileLayer_ScrollToPixelPosition
.L_020297d0:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    beq .L_020297e8
    mov r1, r5
    mov r2, r6
    bl TileLayer_ScrollToPixelPosition
.L_020297e8:
    add r0, r4, #0x1000
    ldr r0, [r0, #0x878]
    tst r0, #0x1
    beq .L_02029854
    add r0, r4, #0x60
    bl func_0202b930
    ldr r0, [r4, #0x24]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_02029854
    ldrb r0, [r4, #0x30]
    cmp r0, #0x1
    beq .L_02029828
    cmp r0, #0x2
    beq .L_02029840
    b .L_02029854
.L_02029828:
    add r0, r4, #0x1000
    ldr r0, [r0, #0x874]
    mov r1, #0x6800
    mov r2, #0x800
    bl func_020b1854
    b .L_02029854
.L_02029840:
    add r0, r4, #0x1000
    ldr r0, [r0, #0x874]
    mov r1, #0x6800
    mov r2, #0x800
    bl func_020b17ec
.L_02029854:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
    .size DualLayerTileRenderer_UpdatePosition, . - DualLayerTileRenderer_UpdatePosition

