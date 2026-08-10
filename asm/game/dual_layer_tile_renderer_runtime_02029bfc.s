; Matching retail form; see src/game/dual_layer_tile_renderer_runtime.c.
.text


    .global DualLayerTileRenderer_FillTileRectangle
    .type DualLayerTileRenderer_FillTileRectangle, @function
DualLayerTileRenderer_FillTileRectangle: ; 0x02029bfc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r11, r1
    add r0, r10, r11, lsl #0x2
    ldr r0, [r0, #0x28]
    ldr r9, [sp, #0x30]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [sp, #0x2c]
    mov r4, r2, asr #0x3
    mov r6, r3, asr #0x3
    mov r5, r0, asr #0x3
    add r3, r3, r6, lsr #0x1c
    add r2, r2, r4, lsr #0x1c
    ldr r1, [sp, #0x28]
    mov r6, r2, asr #0x4
    mov r4, r1, asr #0x3
    add r4, r1, r4, lsr #0x1c
    add r5, r0, r5, lsr #0x1c
    mov r7, r3, asr #0x4
    b .L_02029c88
.L_02029c50:
    mov r8, r6
    b .L_02029c7c
.L_02029c58:
    mov r0, r10
    str r7, [sp, #0x0]
    ldr ip, [r0, #0x0]
    mov r1, r11
    ldr ip, [ip, #0x30]
    mov r2, r9
    mov r3, r8
    blx ip
    add r8, r8, #0x1
.L_02029c7c:
    cmp r8, r4, asr #0x4
    blt .L_02029c58
    add r7, r7, #0x1
.L_02029c88:
    cmp r7, r5, asr #0x4
    blt .L_02029c50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size DualLayerTileRenderer_FillTileRectangle, . - DualLayerTileRenderer_FillTileRectangle

