; Matching retail form; see src/game/tile_layer_cache_refresh.c.
.text
.extern RectS32_Init
.extern RectS32_ContainsPoint
.extern TileLayer_WriteMetatileToCache

    .global TileLayer_RefreshCacheRow
    .type TileLayer_RefreshCacheRow, @function
TileLayer_RefreshCacheRow: ; 0x0202a1cc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    add r0, r10, #0x1000
    ldrh r4, [r0, #0x2e]
    mov r9, r1
    mov r7, r3
    str r4, [sp, #0x0]
    ldrh r3, [r0, #0x2c]
    mov r1, #0x0
    mov r8, r2
    add r0, sp, #0x4
    mov r2, r1
    bl RectS32_Init
    ldr r11, .L_0202a2ac
    mov r5, #0x0
    add r4, r10, #0x1000
.L_0202a210:
    add r0, sp, #0x4
    mov r1, r9
    mov r2, r8
    mov r6, #0x0
    bl RectS32_ContainsPoint
    cmp r0, #0x0
    beq .L_0202a24c
    ldrh r0, [r4, #0x2c]
    ldr r1, [r4, #0x8]
    mla r0, r8, r0, r9
    mov r0, r0, lsl #0x1
    ldrh r0, [r1, r0]
    and r0, r0, r11
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
.L_0202a24c:
    ldrb r2, [r7, #0x0]
    ldrb r1, [r7, #0x1]
    mov r0, r10
    mov ip, r2, lsl #0x1b
    mov r2, r1, lsl #0x1c
    mov r3, r6
    mov r1, ip, lsr #0x1b
    mov r2, r2, lsr #0x1c
    bl TileLayer_WriteMetatileToCache
    ldrb r1, [r7, #0x0]
    add r5, r5, #0x1
    cmp r5, #0x20
    mov r0, r1, lsl #0x1b
    mov r0, r0, lsr #0x1b
    add r0, r0, #0x1
    and r0, r0, #0xff
    bic r1, r1, #0x1f
    and r0, r0, #0x1f
    orr r0, r1, r0
    strb r0, [r7, #0x0]
    add r9, r9, #0x1
    blt .L_0202a210
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202a2ac: .word 0x1ff
    .size TileLayer_RefreshCacheRow, . - TileLayer_RefreshCacheRow

