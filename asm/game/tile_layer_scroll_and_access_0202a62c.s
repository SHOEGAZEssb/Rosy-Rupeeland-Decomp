; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text


    .global TileLayer_WriteMetatileToCache
    .type TileLayer_WriteMetatileToCache, @function
TileLayer_WriteMetatileToCache: ; 0x0202a62c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov ip, r1, lsr #0x1f
    rsb r1, ip, r1, lsl #0x1b
    add r1, ip, r1, ror #0x1b
    add r7, r0, #0x1000
    mov r8, r1, lsl #0x1
    add r1, r3, r3, lsl #0x2
    mov r4, r8, lsr #0x1f
    mov r5, r2, lsr #0x1f
    ldr ip, [r7, #0x10]
    mov r3, r1, lsl #0x1
    rsb lr, r4, r8, lsl #0x1b
    rsb r2, r5, r2, lsl #0x1c
    mov r6, r8, asr #0x4
    add r6, r8, r6, lsr #0x1b
    add lr, r4, lr, ror #0x1b
    add r4, r5, r2, ror #0x1c
    ldrh r3, [ip, r3]
    ldrh r2, [r7, #0x34]
    add r5, lr, r4, lsl #0x6
    mov r4, r6, asr #0x5
    add r4, r5, r4, lsl #0xa
    add r6, r0, #0x4
    mov r5, r4, lsl #0x1
    add r0, r3, r2
    strh r0, [r6, r5]
    add r3, ip, r1, lsl #0x1
    ldrh r1, [r3, #0x2]
    ldrh r0, [r7, #0x34]
    add r2, r6, r4, lsl #0x1
    add r0, r1, r0
    strh r0, [r2, #0x2]
    ldrh r1, [r3, #0x4]
    ldrh r0, [r7, #0x34]
    add r0, r1, r0
    strh r0, [r2, #0x40]
    ldrh r1, [r3, #0x6]
    ldrh r0, [r7, #0x34]
    add r0, r1, r0
    strh r0, [r2, #0x42]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size TileLayer_WriteMetatileToCache, . - TileLayer_WriteMetatileToCache

